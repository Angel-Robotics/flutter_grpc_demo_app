import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_grpc_demo_app/src/enums/enum_mode.dart';
import 'package:flutter_grpc_demo_app/src/model/emr_msg.dart';
import 'package:flutter_grpc_demo_app/src/model/encoder_raw.dart';
import 'package:flutter_grpc_demo_app/src/model/jetson_device_info.dart';
import 'package:flutter_grpc_demo_app/src/model/joint_state.dart';
import 'package:flutter_grpc_demo_app/src/model/joy_msg.dart';
import 'package:flutter_grpc_demo_app/src/model/sensor_msg/battery_state_msg.dart';
import 'package:flutter_grpc_demo_app/src/model/sensor_msg/temperature_msg.dart';
import 'package:flutter_grpc_demo_app/src/model/tegrastats_msg.dart';
import 'package:flutter_grpc_demo_app/src/model/uint8_array_msg.dart';
import 'package:flutter_grpc_demo_app/src/protos/mobile_transceiver.pbgrpc.dart';
import 'package:flutter_grpc_demo_app/src/protos/sound.pbgrpc.dart';
import 'package:flutter_grpc_demo_app/src/provider/backpack_button_provider.dart';
import 'package:flutter_grpc_demo_app/src/provider/device_battery_provider.dart';
import 'package:flutter_grpc_demo_app/src/provider/device_info/device_temperature_provider.dart';
import 'package:flutter_grpc_demo_app/src/provider/device_info/jetson_device_info_controller.dart';
import 'package:flutter_grpc_demo_app/src/provider/device_info/tegrastats_provider.dart';
import 'package:flutter_grpc_demo_app/src/provider/emr_button_state_provider.dart';
import 'package:flutter_grpc_demo_app/src/provider/joystick_state_provider.dart';
import 'package:flutter_grpc_demo_app/src/provider/wifi_direct_provider.dart';
import 'package:flutter_grpc_demo_app/src/ui/component/monitoring/encoder_raw_widget.dart';
import 'package:flutter_grpc_demo_app/src/ui/component/monitoring/jetson_cpu_temp_widget.dart';
import 'package:flutter_grpc_demo_app/src/ui/component/monitoring/jetson_gpu_temp_widget.dart';
import 'package:flutter_grpc_demo_app/src/ui/component/monitoring/joint_state_raw_widget.dart';
import 'package:flutter_grpc_demo_app/src/ui/roslib/data_monitoring_page.dart';
import 'package:flutter_p2p_plus/flutter_p2p_plus.dart';
import 'package:flutter_p2p_plus/protos/protos.pb.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';
import 'package:roslibdart/roslibdart.dart' as roslib;

// import 'package:roslibdart/roslibdart.dart' ;
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

  late roslib.Ros ros;
  roslib.Topic? chatter;
  roslib.Topic? defaultTopic;
  roslib.Topic? topicJointState;

  roslib.Topic? batteryTopic;
  roslib.Topic? cpuTempTopic;
  roslib.Topic? gpuTempTopic;
  roslib.Topic? emrTopic;
  roslib.Topic? backpackTopic;
  roslib.Topic? joystickTopic;
  roslib.Topic? tegrastatsTopic;

  roslib.Service? jetsonDeviceInfoService;
  roslib.Service? indicatorSetService;

  bool isRosBridgeConnected = false;
  int refreshCounter = 0;
  String msgReceived = '';
  String _encoderMsg = "";
  int _railIndex = 0;

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
    jetsonDeviceInfoService = null;
    super.dispose();
  }

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
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ref.read(p2pDeviceConnectionStateProvider) ? Colors.green : Colors.red,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      const Spacer(),
                      SizedBox(
                        height: 48,
                        width: 240,
                        child: InkWell(
                          onTap: () async {
                            await initRosLib();
                            debugPrint("Connect ROS");
                          },
                          child: const Card(
                            elevation: 4,
                            // color: Colors.blue[500],
                            child: Center(
                              child: Text(
                                "엔젤렉스 연결하기",
                                style: TextStyle(
                                    // color: Colors.white,
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
                        height: 48,
                        width: 240,
                        child: InkWell(
                          onTap: () async {
                            destroyConnection();
                            debugPrint("Disconnect ROS");
                          },
                          child: const Card(
                            elevation: 4,
                            // color: Colors.red[500],
                            child: Center(
                              child: Text(
                                "엔젤렉스 연결끊기",
                                style: TextStyle(
                                    // color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
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
                                  const Text(
                                    "무선연결상태",
                                  ),
                                  Container(
                                    height: 120,
                                    width: 240,
                                    decoration: BoxDecoration(
                                      color: ref.read(p2pDeviceConnectionStateProvider) ? Colors.green : Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  const Text(
                                    "엔젤렉스 연결 관리",
                                  ),
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
                                            debugPrint("Disconnect ROS");
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
                                  const Text("AM, CM, MD 모듈별 시리얼 및 정보"),
                                  const Text("모듈별 소프트웨어 버전정보"),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Consumer(
                                          builder: (context, ref, _) {
                                            final amDeviceInfo = ref.watch(jetsonDeviceInfoProvider);
                                            return Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                              ),
                                              padding: const EdgeInsets.all(16),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      Map<String, dynamic> json = {"key": "summary"};
                                                      try {
                                                        Map<String, dynamic> _result =
                                                            await jetsonDeviceInfoService?.call(json);
                                                        debugPrint(_result['value']);
                                                        try {
                                                          var deviceInfo =
                                                              JetsonDeviceInfo.fromJson(jsonDecode(_result['value']));
                                                          ref.read(jetsonDeviceInfoProvider.notifier).state =
                                                              deviceInfo;
                                                          debugPrint(deviceInfo.jetsonSerialNumber);
                                                        } catch (e, s) {
                                                          debugPrint(e.toString());
                                                        }
                                                      } catch (e, s) {
                                                        debugPrint(e.toString());
                                                      }
                                                    },
                                                    child: const Text("AM 정보확인"),
                                                  ),
                                                  const SizedBox(
                                                    height: 16,
                                                  ),
                                                  Text(
                                                      "jetson_serial_number: ${amDeviceInfo?.jetsonSerialNumber ?? ""}"),
                                                  Text("jetson_board: ${amDeviceInfo?.jetsonBoard ?? ""}"),
                                                  Text("jetson_codename: ${amDeviceInfo?.jetsonCodename ?? ""}"),
                                                  Text("jetson_cuda: ${amDeviceInfo?.jetsonCuda ?? ""}"),
                                                  Text("jetson_cudnn: ${amDeviceInfo?.jetsonCudnn ?? ""}"),
                                                  Text("jetson_l4t: ${amDeviceInfo?.jetsonL4t ?? ""}"),
                                                  Text("jetson_l4t_release: ${amDeviceInfo?.jetsonL4tRelease ?? ""}"),
                                                  Text("jetson_l4t_revision: ${amDeviceInfo?.jetsonL4tRevision ?? ""}"),
                                                  Text("jetson_machine: ${amDeviceInfo?.jetsonMachine ?? ""}"),
                                                  Text("jetson_opencv: ${amDeviceInfo?.jetsonOpencv ?? ""}"),
                                                  Text("jetson_soc: ${amDeviceInfo?.jetsonSoc ?? ""}"),
                                                  Text("jetson_tensorrt: ${amDeviceInfo?.jetsonTensorrt ?? ""}"),
                                                  Text("jetson_type: ${amDeviceInfo?.jetsonType ?? ""}"),
                                                  Text("jetson_vpi: ${amDeviceInfo?.jetsonVpi ?? ""}"),
                                                  Text("jetson_vulkan_info: ${amDeviceInfo?.jetsonVulkanInfo ?? ""}"),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      Expanded(child: Container()),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("로봇사이즈 설정, 영점 설정, 길이 센서 초기 값 설정"),
                                  Text("또 설정할게 무엇이 있는가"),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("IO 관리"),
                                  const Text("배터리팩 LED 상태 확인 및 기능 테스트(버튼 몇개 두고 누르면 켜지고 꺼지지)"),
                                  const Text("비상버튼 상태, 백팩 버튼 상태, 조이콘"),
                                  const Text("사운드/오디오 재생, 음량 설정"),
                                  Expanded(
                                      child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                              ),
                                              child: Row(
                                                children: [
                                                  const Text("비상버튼 상태"),
                                                  const SizedBox(
                                                    width: 16,
                                                  ),
                                                  Consumer(
                                                    builder: (BuildContext context, WidgetRef ref, Widget? child) {
                                                      final emrState = ref.watch(emrButtonStateProvider);
                                                      return Container(
                                                        decoration: BoxDecoration(
                                                          color: emrState ? Colors.green : Colors.red,
                                                        ),
                                                        padding:
                                                            const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                                        child: const Center(
                                                          child: Text(
                                                            "비상버튼",
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                              ),
                                              child: Row(
                                                children: const [
                                                  Text(
                                                    "백팩 버튼",
                                                  ),
                                                  // Consumer(
                                                  //   builder: (BuildContext context, WidgetRef ref, Widget? child) {
                                                  //     final backpackState = ref.watch(backpackButtonProvider);
                                                  //     return SizedBox(
                                                  //       height: 64,
                                                  //       child: GridView.count(
                                                  //         crossAxisCount: 4,
                                                  //         mainAxisSpacing: 16,
                                                  //         crossAxisSpacing: 16,
                                                  //         // childAspectRatio: 1.8,
                                                  //         childAspectRatio: 3,
                                                  //         children: backpackState
                                                  //             .map((e) => Container(
                                                  //                 decoration: BoxDecoration(
                                                  //                   color: e ? Colors.red : Colors.green,
                                                  //                 ),
                                                  //                 child: const Text("")))
                                                  //             .toList(),
                                                  //       ),
                                                  //     );
                                                  //   },
                                                  // ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(border: Border.all()),
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "조이스틱 컨트롤러",
                                                    style: TextStyle(
                                                      // fontSize: 1,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Consumer(builder: (context, ref, _) {
                                                    final joy = ref.watch(joyButtonStateBoolProvider);
                                                    return Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: GridView.count(
                                                        shrinkWrap: true,
                                                        crossAxisCount: 8,
                                                        crossAxisSpacing: 8,
                                                        mainAxisSpacing: 8,
                                                        childAspectRatio: 1,
                                                        children: joy
                                                            .map(
                                                              (e) => Container(
                                                                decoration: BoxDecoration(
                                                                  color: e ? Colors.red : Colors.green,
                                                                ),
                                                              ),
                                                            )
                                                            .toList(),
                                                      ),
                                                    );
                                                  }),
                                                  Consumer(
                                                    builder: (context, ref, _) {
                                                      final joy = ref.watch(joyAxisStateProvider);
                                                      return Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: GridView.count(
                                                          shrinkWrap: true,
                                                          crossAxisCount: 8,
                                                          crossAxisSpacing: 8,
                                                          mainAxisSpacing: 8,
                                                          childAspectRatio: 1,
                                                          children: joy
                                                              .map(
                                                                (e) => Container(
                                                                  decoration: BoxDecoration(
                                                                    border: Border.all(),
                                                                  ),
                                                                  padding: const EdgeInsets.all(8),
                                                                  child: Center(
                                                                    child: Text(
                                                                      e.toStringAsFixed(6),
                                                                      style: const TextStyle(
                                                                        fontSize: 12,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                              .toList(),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(border: Border.all()),
                                          child: DefaultTabController(
                                            length: 2,
                                            child: Column(
                                              children: [
                                                const TabBar(
                                                    labelColor: Colors.black,
                                                    unselectedLabelColor: Colors.grey,
                                                    indicatorColor: Colors.black,
                                                    indicatorWeight: 4,
                                                    tabs: [
                                                      Tab(
                                                        text: "사운드(오디오)",
                                                      ),
                                                      Tab(
                                                        text: "인디케이터",
                                                      )
                                                    ]),
                                                Expanded(
                                                  child: TabBarView(children: [
                                                    SingleChildScrollView(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(16.0),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                const Text("볼륨"),
                                                                Expanded(
                                                                  child: Slider(
                                                                      value: soundVolume,
                                                                      min: 0,
                                                                      max: 80,
                                                                      activeColor: Colors.black,
                                                                      inactiveColor: Colors.grey,
                                                                      divisions: 80,
                                                                      onChanged: (d) {
                                                                        setState(() {
                                                                          soundVolume = d;
                                                                        });
                                                                      }),
                                                                ),
                                                                Text("$soundVolume"),
                                                              ],
                                                            ),
                                                            ButtonBar(
                                                              children: [
                                                                ElevatedButton(
                                                                  onPressed: () async {
                                                                    sendPlaySound("/01/001.mp3");
                                                                  },
                                                                  child: const Text(
                                                                    "사운드 테스트",
                                                                    style: TextStyle(
                                                                      fontSize: 18,
                                                                    ),
                                                                  ),
                                                                ),
                                                                ElevatedButton(
                                                                  onPressed: () async {
                                                                    sendSetVolume();
                                                                  },
                                                                  child: const Text(
                                                                    "볼륨 설정",
                                                                    style: TextStyle(
                                                                      fontSize: 18,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Text("성별"),
                                                            Text("캐릭터"),
                                                            Text("파일선택"),
                                                            ButtonBar(
                                                              children: [
                                                                ElevatedButton(
                                                                  onPressed: () {},
                                                                  child: Text("재생"),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    //TODO: 인디케이터 설정
                                                    Column(
                                                      children: [
                                                        Expanded(
                                                          child: GridView.builder(
                                                            shrinkWrap: true,
                                                            gridDelegate:
                                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 5,
                                                            ),
                                                            itemCount: 20,
                                                            itemBuilder: (context, index) {
                                                              return InkWell(
                                                                onTap: () async {
                                                                  Map<String, dynamic> json = {
                                                                    "op_code": 100,
                                                                    "labels": [
                                                                      "led_0",
                                                                      "led_1",
                                                                      "led_2",
                                                                      "led_3",
                                                                      "led_4",
                                                                    ],
                                                                    "indicators": [0, 1, 0, 0, 0]
                                                                  };
                                                                  try {
                                                                    Map<String, dynamic> _result =
                                                                        await indicatorSetService?.call(json);
                                                                    debugPrint(_result['result']);
                                                                  } catch (e, s) {
                                                                    debugPrint(e.toString());
                                                                  }
                                                                },
                                                                child: Card(
                                                                  child: Text("$index"),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                                ],
                              ),
                              const DataMonitoringPage(),
                            ],
                          ),
                        ),
                      ),
                    ],
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

  Future<void> subscribeHandler(Map<String, dynamic> msg) async {
    print(msg);
  }

  Future<void> subscribeCpuTemperatureHandler(Map<String, dynamic> msg) async {
    // print(msg);
    final tempMsg = TemperatureMsg.fromJson(msg);
    ref.read(jetsonCpuTemperatureProvider.notifier).state = tempMsg.temperature ?? 0.0;
  }

  Future<void> subscribeGpuTemperatureHandler(Map<String, dynamic> msg) async {
    // print(msg);
    final tempMsg = TemperatureMsg.fromJson(msg);
    ref.read(jetsonGpuTemperatureProvider.notifier).state = tempMsg.temperature ?? 0.0;
  }

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
    debugPrint(msg.toString());
    final boolMsg = BoolMsg.fromJson(msg);
    ref.read(emrButtonStateProvider.notifier).state = boolMsg.data ?? false;
  }

  Future<void> subscribeBackpackButtonHandler(Map<String, dynamic> msg) async {
    debugPrint(msg.toString());
    try {
      var rcvData = Uint8ArrayMsg.fromJson(msg);
      var filterList = rcvData.data?.map((e) => e == 1 ? true : false).toList();
      debugPrint(filterList.toString());
      ref.watch(backpackButtonProvider.notifier).state = filterList ?? [];
    } catch (e, s) {
      debugPrint("[Error] ${e.toString()} | ${s.toString()}");
    }
  }

  Future<void> subscribeJoystickHandler(Map<String, dynamic> msg) async {
    var joyMsg = JoyMsg.fromJson(msg);
    var _filterList = joyMsg.buttons?.map((e) => e == 0 ? true : false).toList();
    ref.read(joyButtonStateBoolProvider.notifier).updateState(_filterList ?? []);
    ref.read(joyAxisStateProvider.notifier).updateState(joyMsg.axes ?? []);
  }

  Future<void> subscribeTegrastatsHandler(Map<String, dynamic> msg) async {
    var tegrastatsMsg = TegrastatsMsg.fromJson(jsonDecode(msg['data']));
    ref.read(tegrastatsProvider.notifier).state = tegrastatsMsg;
  }

  Future<void> subscribeBatteryMsgHandler(Map<String, dynamic> msg) async {
    var batt = BatteryStateMsg.fromJson(msg);
    ref.read(deviceBatteryProvider.notifier).state = batt;
  }

  Future initRosLib() async {
    if (!isRosBridgeConnected) {
      ros = roslib.Ros(url: 'ws://192.168.15.240:9090');

      defaultTopic = roslib.Topic(
        ros: ros,
        name: '/topic',
        type: "std_msgs/String",
        reconnectOnClose: true,
        queueLength: 10,
        queueSize: 10,
      );

      chatter = roslib.Topic(
          ros: ros,
          name: '/topic/debug/encoder/raw',
          type: "std_msgs/UInt16MultiArray",
          reconnectOnClose: true,
          queueLength: 10,
          queueSize: 10);

      batteryTopic = roslib.Topic(
          ros: ros,
          name: '/topic/battery',
          type: "sensor_msgs/BatteryState",
          reconnectOnClose: true,
          queueLength: 10,
          queueSize: 10);

      cpuTempTopic = roslib.Topic(
          ros: ros,
          name: '/topic/device/temp/cpu',
          type: "sensor_msgs/Temperature",
          reconnectOnClose: true,
          queueLength: 10,
          queueSize: 10);
      gpuTempTopic = roslib.Topic(
          ros: ros,
          name: '/topic/device/temp/gpu',
          type: "sensor_msgs/Temperature",
          reconnectOnClose: true,
          queueLength: 10,
          queueSize: 10);

      topicJointState = roslib.Topic(
          ros: ros,
          name: '/topic/debug/joint/state',
          type: "sensor_msgs/JointState",
          reconnectOnClose: true,
          queueLength: 10,
          queueSize: 10);

      emrTopic = roslib.Topic(
          ros: ros,
          name: '/topic/button/emr/bool',
          type: "std_msgs/Bool",
          reconnectOnClose: true,
          queueLength: 10,
          queueSize: 10);

      backpackTopic = roslib.Topic(
          ros: ros,
          name: '/topic/button/backpack',
          type: "std_msgs/UInt8MultiArray",
          reconnectOnClose: true,
          queueLength: 10,
          queueSize: 10);

      joystickTopic = roslib.Topic(
          ros: ros,
          name: '/controller/joystic',
          type: "sensor_msgs/Joy",
          reconnectOnClose: true,
          queueLength: 10,
          queueSize: 10);

      tegrastatsTopic = roslib.Topic(
          ros: ros,
          name: '/topic/device/tegrastats',
          type: "std_msgs/String",
          reconnectOnClose: true,
          queueLength: 10,
          queueSize: 10);

      jetsonDeviceInfoService =
          roslib.Service(name: 'my_jetson_info', ros: ros, type: "m30_tutorial_interfaces/AmDeviceInfo");
      indicatorSetService =
          roslib.Service(name: '/set_led_indicator', ros: ros, type: "m30_tutorial_interfaces/LedIndicator");
      ros.connect();
      isRosBridgeConnected = true;
      // ros1.connect();
      Timer(
        const Duration(seconds: 2),
        () async {
          await defaultTopic?.subscribe(subscribeHandler);
          await chatter?.subscribe(subscribeEncoderHandler);
          await cpuTempTopic?.subscribe(subscribeCpuTemperatureHandler);
          await gpuTempTopic?.subscribe(subscribeGpuTemperatureHandler);
          await topicJointState?.subscribe(subscribeJointStateHandler);
          await emrTopic?.subscribe(subscribeEmrButtonHandler);
          await backpackTopic?.subscribe(subscribeBackpackButtonHandler);
          await joystickTopic?.subscribe(subscribeJoystickHandler);
          await tegrastatsTopic?.subscribe(subscribeTegrastatsHandler);
          await batteryTopic?.subscribe(subscribeBatteryMsgHandler);
        },
      );
    }

    // await defaultTopic.subscribe(subscribeHandler);
    // await chatter.subscribe(subscribeHandler);
    // await cpuTempTopic?.subscribe(subscribeHandler);
  }

  void destroyConnection() async {
    isRosBridgeConnected = false;
    await cpuTempTopic?.unsubscribe();
    await defaultTopic?.unsubscribe();
    await chatter?.unsubscribe();
    await topicJointState?.unsubscribe();
    await emrTopic?.unsubscribe();
    await backpackTopic?.unsubscribe();
    await joystickTopic?.unsubscribe();
    await tegrastatsTopic?.unsubscribe();
    await batteryTopic?.unsubscribe();
    await ros.close();
    // ros1.connect();
  }

  Future connectDevice() async {
    var cert = await readCert();
    debugPrint("[Call] connectDevice()");
    FlutterP2pPlus _flutterP2pPlus = ref.read(wifiDirectProvider).flutterP2pPlus;
    debugPrint("[Device] : ${widget.device} | ${widget.device.deviceAddress} | ${widget.device.deviceName}");
    try {
      bool? result = await _flutterP2pPlus.connect(widget.device);
      debugPrint("[connect] p2p연결하기 결과: result: $result");

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
      debugPrint(e.toString());
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

    final certAsList = cert.buffer
        .asUint8List(cert.offsetInBytes, cert.lengthInBytes)
        .map(
          (uint8) => uint8.toInt(),
        )
        .toList();
    print(certAsList);
    return certAsList;
  }

  Future sendPlaySound(String args) async {
    // final name = args.isNotEmpty ? args[0] : 'world';
    try {
      final response = await soundStub?.playSound(
        PlayRequest()
          ..volume = soundVolume.toInt()
          ..path = args,
        options: CallOptions(compression: const GzipCodec()),
      );
      debugPrint('Greeter client received: ${response?.message}');
    } catch (e) {
      debugPrint('Caught error: $e');
    }
  }

  /// [GRPC] 사운드 서버와 연결하여 자비어 모듈의 사운드 설정을 하기 위한 메소드
  Future sendSetVolume() async {
    // final name = args.isNotEmpty ? args[0] : 'world';
    try {
      final response = await soundStub?.setVolume(
        Volume()..level = soundVolume.toInt(),
        options: CallOptions(compression: const GzipCodec()),
      );
      print('Greeter client received: ${response?.message}');
    } catch (e) {
      print('Caught error: $e');
    }
  }
}
