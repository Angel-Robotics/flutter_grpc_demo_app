import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_grpc_demo_app/src/enums/enum_mode.dart';
import 'package:flutter_grpc_demo_app/src/model/emr_msg.dart';
import 'package:flutter_grpc_demo_app/src/model/encoder_raw.dart';
import 'package:flutter_grpc_demo_app/src/model/joint_state.dart';
import 'package:flutter_grpc_demo_app/src/model/joy_msg.dart';
import 'package:flutter_grpc_demo_app/src/model/uint8_array_msg.dart';
import 'package:flutter_grpc_demo_app/src/protos/mobile_transceiver.pbgrpc.dart';
import 'package:flutter_grpc_demo_app/src/protos/sound.pbgrpc.dart';
import 'package:flutter_grpc_demo_app/src/provider/backpack_button_provider.dart';
import 'package:flutter_grpc_demo_app/src/provider/emr_button_state_provider.dart';
import 'package:flutter_grpc_demo_app/src/provider/joystick_state_provider.dart';
import 'package:flutter_grpc_demo_app/src/provider/wifi_direct_provider.dart';
import 'package:flutter_p2p_plus/flutter_p2p_plus.dart';
import 'package:flutter_p2p_plus/protos/protos.pb.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';
import 'package:roslibdart/roslibdart.dart';

import '../../provider/encoder_raw_controller.dart';

class RosLibDartTestPage extends ConsumerStatefulWidget {
  WifiP2pDevice device;

  RosLibDartTestPage({
    Key? key,
    required this.device,
  }) : super(key: key);

  @override
  ConsumerState<RosLibDartTestPage> createState() => _RosLibDartTestPageState();
}

class _RosLibDartTestPageState extends ConsumerState<RosLibDartTestPage> {
  Socket? _clientSocket;
  double soundVolume = 70.0;
  double _sumTotalTime = 0.0;
  int _sumTotalCount = 0;
  EnumSelectMode _enumMode = EnumSelectMode.unselect;

  bool _isSocketConnected = false;

  ClientChannel? soundChannel;
  ClientChannel? _clientChannel;
  SoundClient? soundStub;
  MobileTransceiverClient? _mobileTransceiverClient;

  late Ros ros;
  late Topic chatter;
  late Topic defaultTopic;
  late Topic topicJointState;

  Topic? cpuTempTopic;
  Topic? emrTopic;
  Topic? backpackTopic;
  Topic? joystickTopic;
  String msgReceived = '';

  bool isRosBridgeConnected = false;

  Future<void> subscribeHandler(Map<String, dynamic> msg) async {
    // print(msg);
    // msgReceived = json.encode(msg);
    // print(msgReceived);
    // setState(() {});
  }

  Future<void> subscribeTemperatureHandler(Map<String, dynamic> msg) async {
    // print(msg);
    // msgReceived = json.encode(msg);
    // print(msgReceived);
    // setState(() {});
  }

  int refreshCounter = 0;
  String _encoderMsg = "";

  Future<void> subscribeEncoderHandler(Map<String, dynamic> msg) async {
    // print(msg);
    // msgReceived = json.encode(msg);
    // print(msgReceived);
    final encoderRaw = EncoderRaw.fromJson(msg);

    refreshCounter++;
    // _encoderMsg += "$msgReceived \n";
    ref.read(encoderRawProvider.notifier).state = encoderRaw;
    if (refreshCounter > 60) {
      // ref.read(encoderRawDataProvider.notifier).state += _encoderMsg;
      _encoderMsg = "";
      refreshCounter = 0;
    }
    // setState(() {});
  }

  Future<void> subscribeJointStateHandler(Map<String, dynamic> msg) async {
    // print(msg);
    // msgReceived = json.encode(msg);
    // print(msgReceived);
    final jointStateRaw = JointState.fromJson(msg);
    ref.read(jointStateRawProvider.notifier).state = jointStateRaw;
    // setState(() {});
  }

  Future<void> subscribeEmrButtonHandler(Map<String, dynamic> msg) async {
    // print(msg);
    // msgReceived = json.encode(msg);
    // print(msgReceived);
    final boolMsg = BoolMsg.fromJson(msg);
    ref.read(emrButtonStateProvider.notifier).state = boolMsg.data ?? false;
  }

  Future<void> subscribeBackpackButtonHandler(Map<String, dynamic> msg) async {
    // print(msg);
    msgReceived = json.encode(msg);
    print(msgReceived);
    var rcvData = Uint8ArrayMsg.fromJson(msg);
    var filterList = rcvData.data?.map((e) => e == 1 ? true : false).toList();
    debugPrint(filterList.toString());
    ref.watch(backpackButtonProvider.notifier).state = filterList ?? [];
  }

  Future<void> subscribeJoystickHandler(Map<String, dynamic> msg) async {
    // print(msg);
    msgReceived = json.encode(msg);
    print(msgReceived);
    var joyMsg = JoyMsg.fromJson(msg);
    var _filterList = joyMsg.buttons?.map((e) => e == 0 ? true : false).toList();
    ref.read(joyButtonStateBoolProvider.notifier).updateState(_filterList ?? []);
    ref.read(joyAxisStateProvider.notifier).updateState(joyMsg.axes ?? []);
  }

  Future initRosLib() async {
    if (!isRosBridgeConnected) {
      ros = Ros(url: 'ws://192.168.15.240:9090');
      // ros1 = Ros(url: 'ws://192.168.15.240:9090');

      defaultTopic = Topic(
        ros: ros,
        name: '/topic',
        type: "std_msgs/String",
        reconnectOnClose: true,
        queueLength: 10,
        queueSize: 10,
      );

      chatter = Topic(
          ros: ros,
          name: '/topic/debug/encoder/raw',
          type: "std_msgs/UInt16MultiArray",
          reconnectOnClose: true,
          queueLength: 10,
          queueSize: 10);
      cpuTempTopic = Topic(
          ros: ros,
          name: '/topic/device/temp/cpu',
          type: "sensor_msgs/Temperature",
          reconnectOnClose: true,
          queueLength: 10,
          queueSize: 10);

      topicJointState = Topic(
          ros: ros,
          name: '/topic/debug/joint/state',
          type: "sensor_msgs/JointState",
          reconnectOnClose: true,
          queueLength: 10,
          queueSize: 10);

      emrTopic = Topic(
          ros: ros,
          name: '/topic/button/emr/bool',
          type: "std_msgs/Bool",
          reconnectOnClose: true,
          queueLength: 10,
          queueSize: 10);

      backpackTopic = Topic(
          ros: ros,
          name: '/topic/button/backpack',
          type: "std_msgs/UInt8MultiArray",
          reconnectOnClose: true,
          queueLength: 10,
          queueSize: 10);

      joystickTopic = Topic(
          ros: ros,
          name: '/controller/joystic',
          type: "sensor_msgs/Joy",
          reconnectOnClose: true,
          queueLength: 10,
          queueSize: 10);

      ros.connect();
      isRosBridgeConnected = true;
      // ros1.connect();
      Timer(const Duration(seconds: 2), () async {
        await defaultTopic.subscribe(subscribeHandler);
        await cpuTempTopic?.subscribe(subscribeTemperatureHandler);
        await chatter.subscribe(subscribeEncoderHandler);
        await topicJointState.subscribe(subscribeJointStateHandler);
        await emrTopic?.subscribe(subscribeEmrButtonHandler);
        await backpackTopic?.subscribe(subscribeBackpackButtonHandler);
        await joystickTopic?.subscribe(subscribeJoystickHandler);
      });
    }

    // await defaultTopic.subscribe(subscribeHandler);
    // await chatter.subscribe(subscribeHandler);
    // await cpuTempTopic?.subscribe(subscribeHandler);
  }

  void destroyConnection() async {
    isRosBridgeConnected = false;
    await cpuTempTopic?.unsubscribe();
    await defaultTopic.unsubscribe();
    await chatter.unsubscribe();
    await topicJointState.unsubscribe();
    await emrTopic?.unsubscribe();
    await backpackTopic?.unsubscribe();
    await joystickTopic?.unsubscribe();
    await ros.close();
    // ros1.connect();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectDevice();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    destroyConnection();
    super.dispose();
  }

  Future connectDevice() async {
    var cert = await readCert();
    print("[Call] connectDevice()");
    FlutterP2pPlus _flutterP2pPlus = ref.read(wifiDirectProvider).flutterP2pPlus;
    print("[Device] : ${widget.device} | ${widget.device.deviceAddress} | "
        "${widget.device.deviceName}");
    try {
      bool? result = await _flutterP2pPlus.connect(widget.device);
      print("[connect] p2p연결하기 결과: result: $result");

      if (result ?? false) {
        ref.read(p2pDeviceConnectionStateProvider.notifier).state = true;
      }

      soundChannel = ClientChannel(
        '192.168.15.240',
        port: 50052,
        options: ChannelOptions(
          credentials: const ChannelCredentials.insecure(),
          codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
        ),
      );
      soundStub = SoundClient(soundChannel!);

      _clientChannel = ClientChannel(
        '192.168.15.240',
        port: 50051,
        options: ChannelOptions(
          // credentials: const ChannelCredentials.insecure(),
          credentials: ChannelCredentials.secure(
            certificates: cert,
          ),
          codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
        ),
      );
      _mobileTransceiverClient = MobileTransceiverClient(_clientChannel!);
    } catch (e) {
      ref.read(p2pDeviceConnectionStateProvider.notifier).state = false;
      print(e.toString());
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(e.toString()),
        ),
      );
    }

    // await Future.delayed(const Duration(seconds: 10));
    // await _flutterP2pPlus.stopDiscoverDevices();
    // await Future.delayed(const Duration(seconds: 3));
    print("[Info] Completed connectDevice()");
    setState(() {});
  }

  Future<List<int>> readCert() async {
    final cert = await rootBundle.load('assets/server.crt');

    final certAsList =
        cert.buffer.asUint8List(cert.offsetInBytes, cert.lengthInBytes).map((uint8) => uint8.toInt()).toList();
    print(certAsList);
    return certAsList;
  }

  int _railIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orient) {
          if (orient == Orientation.portrait) {
            return const Center(
              child: Text("가로화면 지원"),
            );
          }
          return SafeArea(
            child: Row(
              children: [
                NavigationRail(
                    extended: true,
                    minExtendedWidth: 180,
                    // labelType: NavigationRailLabelType.all,
                    elevation: 4,
                    onDestinationSelected: (idx) {
                      setState(() {
                        _railIndex = idx;
                      });
                    },
                    destinations: const [
                      NavigationRailDestination(
                          icon: Icon(Icons.connect_without_contact_outlined),
                          label: Text("연결설정"),
                          padding: EdgeInsets.symmetric(vertical: 16)),
                      NavigationRailDestination(
                          icon: Icon(Icons.info_outline),
                          label: Text("일반 정보"),
                          padding: EdgeInsets.symmetric(vertical: 16)),
                      NavigationRailDestination(
                          icon: Icon(Icons.settings),
                          label: Text("엔젤렉스 설정"),
                          padding: EdgeInsets.symmetric(vertical: 16)),
                      NavigationRailDestination(
                          icon: Icon(Icons.settings_input_composite_outlined),
                          label: Text("I/O 관리"),
                          padding: EdgeInsets.symmetric(vertical: 16)),
                      NavigationRailDestination(
                          icon: Icon(Icons.waterfall_chart),
                          label: Text("모니터링"),
                          padding: EdgeInsets.symmetric(vertical: 16)),
                    ],
                    selectedIndex: _railIndex),
                const VerticalDivider(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: IndexedStack(
                      index: _railIndex,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("무선연결상태"),
                            Container(
                              height: 240,
                              width: 240,
                              decoration: BoxDecoration(
                                color: ref.read(p2pDeviceConnectionStateProvider) ? Colors.green : Colors.red,
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Text("엔젤렉스 연결 관리"),
                            Row(
                              children: [
                                SizedBox(
                                  height: 120,
                                  width: 240,
                                  child: InkWell(
                                    onTap: () async {
                                      await initRosLib();
                                      debugPrint("Connect ROS");
                                    },
                                    child: Card(
                                      elevation: 4,
                                      color: Colors.green[500],
                                      child: const Center(
                                        child: Text(
                                          "엔젤렉스 연결하기",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                SizedBox(
                                  height: 120,
                                  width: 240,
                                  child: InkWell(
                                    onTap: () async {
                                      destroyConnection();
                                    },
                                    child: Card(
                                      elevation: 4,
                                      color: Colors.red[500],
                                      child: const Center(
                                        child: Text(
                                          "엔젤렉스 연결끊기",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("AM, CM, MD 모듈별 시리얼 및 정보"),
                            Text("모듈별 소프트웨어 버전정보"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("로봇사이즈 설정, 영점 설정, 길이 센서 초기 값 설정"),
                            Text("또 설정할게 무엇이 있는가"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("IO 관리"),
                            Text("배터리팩 LED 상태 확인 및 기능 테스트(버튼 몇개 두고 누르면 켜지고 꺼지지)"),
                            Text("비상버튼 상태, 백팩 버튼 상태, 조이콘"),
                            Text("사운드/오디오 재생, 음량 설정"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("데이터 모니터링 "),
                            Text("센서 값(엔코더, IMU) / 족저압 눌림 / 좌표 / 젯슨 온도(시피유, 지피유)"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          destroyConnection();
          Navigator.of(context).pop();
        },
        label: const Text("종료"),
        icon: const Icon(Icons.logout),
      ),
    );
  }
}
