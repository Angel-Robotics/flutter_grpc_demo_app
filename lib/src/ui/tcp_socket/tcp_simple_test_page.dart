import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_grpc_demo_app/src/enums/enum_mode.dart';
import 'package:flutter_grpc_demo_app/src/model/basic_msg.dart';
import 'package:flutter_grpc_demo_app/src/model/emr_msg.dart';
import 'package:flutter_grpc_demo_app/src/model/encoder_raw.dart';
import 'package:flutter_grpc_demo_app/src/model/joint_state.dart';
import 'package:flutter_grpc_demo_app/src/model/joy_msg.dart';
import 'package:flutter_grpc_demo_app/src/model/uint8_array_msg.dart';
import 'package:flutter_grpc_demo_app/src/model/user_mode_settings.dart';
import 'package:flutter_grpc_demo_app/src/protos/helloworld.pbgrpc.dart';
import 'package:flutter_grpc_demo_app/src/protos/m30_backpack_stream.pbgrpc.dart';
import 'package:flutter_grpc_demo_app/src/protos/mobile_transceiver.pbgrpc.dart';
import 'package:flutter_grpc_demo_app/src/protos/sound.pb.dart';
import 'package:flutter_grpc_demo_app/src/protos/sound.pbgrpc.dart';
import 'package:flutter_grpc_demo_app/src/provider/backpack_button_provider.dart';
import 'package:flutter_grpc_demo_app/src/provider/emr_button_state_provider.dart';
import 'package:flutter_grpc_demo_app/src/provider/encoder_raw_controller.dart';
import 'package:flutter_grpc_demo_app/src/provider/joystick_state_provider.dart';
import 'package:flutter_grpc_demo_app/src/provider/mode_setting_provider.dart';
import 'package:flutter_grpc_demo_app/src/provider/robot_size_provider.dart';
import 'package:flutter_grpc_demo_app/src/provider/wifi_direct_provider.dart';
import 'package:flutter_grpc_demo_app/src/ui/component/clickly_button.dart';
import 'package:flutter_grpc_demo_app/src/ui/component/fancy_button.dart';
import 'package:flutter_grpc_demo_app/src/ui/component/mode_settings_widget.dart';
import 'package:flutter_grpc_demo_app/src/ui/component/robot_size_setting_widget.dart';
import 'package:flutter_p2p_plus/flutter_p2p_plus.dart';
import 'package:flutter_p2p_plus/protos/protos.pb.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grpc/grpc.dart';
import 'package:pushable_button/pushable_button.dart';
import 'package:roslibdart/roslibdart.dart';

class TcpSimpleTestPage extends ConsumerStatefulWidget {
  TcpSimpleTestPage({
    Key? key,
    required this.device,
  }) : super(key: key);
  WifiP2pDevice device;

  @override
  ConsumerState<TcpSimpleTestPage> createState() => _TcpSimpleTestPageState();
}

class _TcpSimpleTestPageState extends ConsumerState<TcpSimpleTestPage> {
  Socket? _clientSocket;
  StreamSubscription? _streamSubscription;
  BasicMsg _basicMsg = BasicMsg(msg: "", timestamp: 0);
  bool _isSocketConnected = false;

  ClientChannel? soundChannel;
  ClientChannel? _clientChannel;
  SoundClient? soundStub;
  double soundVolume = 70.0;

  MobileTransceiverClient? _mobileTransceiverClient;

  EnumSelectMode _enumMode = EnumSelectMode.unselect;
  double _sumTotalTime = 0.0;
  int _sumTotalCount = 0;

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
    doneHandler();
    _streamSubscription?.cancel();
    _streamSubscription = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("${widget.device.deviceName} | ${widget.device.deviceAddress}"),
        leading: IconButton(
          onPressed: () async {
            if (_clientSocket != null) {
              await _clientSocket?.close();
              _clientSocket?.destroy();
              doneHandler();
              await _streamSubscription?.cancel();
              _streamSubscription = null;
              Navigator.of(context).pop();
              return;
            } else {
              Navigator.of(context).pop();
            }
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return const Center(
            child: Text("???????????? ??????"),
          );
        }
        return DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const TabBar(labelColor: Colors.black, indicatorColor: Colors.brown, tabs: [
                Tab(
                  text: "Socket",
                ),
                Tab(
                  text: "RPC",
                ),
              ]),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Scrollbar(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      spacing: 16,
                                      runSpacing: 16,
                                      children: [
                                        ClickyButton(
                                          onPressed: () {
                                            if (!_isSocketConnected) {
                                              connectSocket();
                                            }
                                          },
                                          color: Colors.green,
                                          child: const Text(
                                            "????????????",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        ClickyButton(
                                          onPressed: () async {
                                            print("?????? ??????");
                                            await _clientSocket?.close();
                                            _clientSocket?.destroy();
                                            setState(() {
                                              _isSocketConnected = false;
                                            });
                                          },
                                          color: Colors.red,
                                          child: const Text(
                                            "?????? ??????",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),

                                        ClickyButton(
                                          onPressed: () async {
                                            print("ROS ??????");
                                            initRosLib();
                                            // await _clientSocket?.close();
                                            // _clientSocket?.destroy();
                                            // setState(() {
                                            //   _isSocketConnected = false;
                                            // });
                                          },
                                          color: Colors.green,
                                          child: const Text(
                                            "ROS ??????",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        ClickyButton(
                                          onPressed: () async {
                                            print("ROS ?????? ??????");
                                            destroyConnection();
                                            // await _clientSocket?.close();
                                            // _clientSocket?.destroy();
                                            // setState(() {
                                            //   _isSocketConnected = false;
                                            // });
                                          },
                                          color: Colors.red,
                                          child: const Text(
                                            "ROS ????????????",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        // Expanded(
                                        //   child: GestureDetector(
                                        //     onTap: () async {
                                        //       // _clientSocket?.drain().then((_) {
                                        //       //   print('Stop.');
                                        //       //   // timer.cancel();
                                        //       //   _clientSocket?.close();
                                        //       // });
                                        //     },
                                        //     child: Container(
                                        //       color: Colors.red,
                                        //       child: const Center(
                                        //         child: Text(
                                        //           "?????? ??????",
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Wrap(
                                      runAlignment: WrapAlignment.spaceBetween,
                                      alignment: WrapAlignment.spaceBetween,
                                      crossAxisAlignment: WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      spacing: 16,
                                      runSpacing: 16,
                                      children: [
                                        ClickyButton(
                                          onPressed: () async {
                                            try {
                                              _clientSocket?.write("Hello");
                                            } catch (e) {
                                              print(e);
                                            }
                                          },
                                          color: Colors.deepPurple,
                                          child: const Text(
                                            "Hello ??????",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        ClickyButton(
                                          onPressed: () async {
                                            listenData();
                                          },
                                          color: Colors.deepPurple,
                                          child: const Text(
                                            "????????? ??????",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        ClickyButton(
                                          onPressed: () async {
                                            startCommend();
                                          },
                                          color: Colors.deepPurple,
                                          child: const Text(
                                            "????????? ??????",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        ClickyButton(
                                          onPressed: () async {
                                            stopListen();
                                          },
                                          color: Colors.deepPurple,
                                          child: const Text(
                                            "????????? ??????",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),

                                    // SizedBox(
                                    //   height: 400,
                                    //   child: Row(
                                    //     children: [
                                    //       // Expanded(
                                    //       //   child: SizedBox(
                                    //       //     // height: 300,
                                    //       //     child:
                                    //       //   ),
                                    //       // ),
                                    //       Expanded(
                                    //         child:
                                    //       ),
                                    //     ],
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const VerticalDivider(
                          color: Colors.black,
                        ),
                        Expanded(
                          flex: 15,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Consumer(builder: (context, ref, _) {
                                    final time = ref.watch(p2pSocketInputTimestampProvider);
                                    final time2 = ref.watch(benchmarkPackAvgTime);
                                    return Text("${time} ms / ${time2} ms");
                                  }),
                                  SizedBox(
                                    height: 300,
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Consumer(
                                                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                                                  final emrState = ref.watch(emrButtonStateProvider);
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      color: emrState ? Colors.green : Colors.red,
                                                    ),
                                                    padding: EdgeInsets.all(24),
                                                    child: const Center(
                                                      child: Text(
                                                        "????????????",
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "?????? ??????",
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Consumer(
                                                    builder: (BuildContext context, WidgetRef ref, Widget? child) {
                                                      final backpackState = ref.watch(backpackButtonProvider);
                                                      return GridView.count(
                                                        shrinkWrap: true,
                                                        crossAxisCount: 2,
                                                        mainAxisSpacing: 16,
                                                        crossAxisSpacing: 16,
                                                        // childAspectRatio: 1.8,
                                                        childAspectRatio: 3,
                                                        children: backpackState
                                                            .map((e) => Container(
                                                                decoration: BoxDecoration(
                                                                  color: e ? Colors.red : Colors.green,
                                                                ),
                                                                child: const Text("")))
                                                            .toList(),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "???????????? ????????????",
                                                style: TextStyle(
                                                  fontSize: 18,
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
                                              Consumer(builder: (context, ref, _) {
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
                                              }),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Divider(),
                                  SizedBox(
                                    height: 200,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Consumer(
                                            builder: (context, ref, _) {
                                              final encoderRaw = ref.watch(encoderRawProvider);
                                              return ListView.builder(
                                                itemCount: encoderRaw.layout.dim?.length,
                                                itemBuilder: (context, index) {
                                                  var item = encoderRaw.layout.dim;
                                                  // print(encoderRaw.data?[index]);
                                                  return Text("${item?[index].label} : ${encoderRaw.data?[index]}");
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                        Expanded(child: SingleChildScrollView(
                                          child: Consumer(
                                            builder: (context, ref, _) {
                                              final encoderRaw = ref.watch(encoderRawDataProvider);
                                              return Text(
                                                encoderRaw,
                                                style: TextStyle(fontSize: 10),
                                              );
                                            },
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 200,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Consumer(
                                            builder: (context, ref, _) {
                                              final encoderRaw = ref.watch(jointStateRawProvider);
                                              return ListView.builder(
                                                itemCount: encoderRaw.name?.length,
                                                itemBuilder: (context, index) {
                                                  var nameItem = encoderRaw.name;
                                                  // print(encoderRaw.data?[index]);
                                                  return Row(
                                                    children: [
                                                      Text(
                                                          "${encoderRaw.header?.stamp?.sec}: ${encoderRaw.header?.stamp?.nanosec}"),
                                                      Text("${encoderRaw.name?[index]}: "),
                                                      Text("| velocity: ${encoderRaw.velocity?[index]} | "),
                                                      Text("| position: ${encoderRaw.position?[index]} | "),
                                                      Text("| effort: ${encoderRaw.effort?[index]} "),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //TODO: ?????? ??? ??????
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClickyButton(
                                    onPressed: () async {
                                      connectDevice();
                                    },
                                    color: Colors.green,
                                    child: const Text(
                                      "GRPC ??????",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Wrap(
                                    spacing: 16,
                                    runSpacing: 16,
                                    children: [
                                      ClickyButton(
                                        onPressed: () async {
                                          sendPlaySound("/01/001.mp3");
                                        },
                                        color: Colors.orange,
                                        child: const Text(
                                          "????????? ?????????",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      ClickyButton(
                                        onPressed: () async {
                                          // sendPlaySound("/01/001.mp3");???
                                          sendSetVolume();
                                        },
                                        color: Colors.orange,
                                        child: const Text(
                                          "?????? ??????",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      ClickyButton(
                                        onPressed: () async {
                                          sendRhythmControl(RhythmControl.PLAY_START);
                                        },
                                        color: Colors.cyan,
                                        child: const Text(
                                          "?????????????????? ??????",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      ClickyButton(
                                        onPressed: () async {
                                          sendRhythmControl(RhythmControl.PLAY_STOP);
                                        },
                                        color: Colors.cyan,
                                        child: const Text(
                                          "?????????????????? ??????",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text("??????"),
                                      Expanded(
                                        child: Slider(
                                            value: soundVolume,
                                            min: 0,
                                            max: 80,
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
                                  const SizedBox(
                                    height: 23,
                                  ),
                                  Wrap(
                                    spacing: 16,
                                    runSpacing: 16,
                                    children: [
                                      ClickyButton(
                                        color: Colors.grey,
                                        onPressed: () async {
                                          if (_enumMode == EnumSelectMode.unselect) {
                                            Fluttertoast.showToast(msg: "????????? ??????????????????.");
                                            return;
                                          }
                                          sendSetMode();
                                        },
                                        child: const Text(
                                          "?????? ??????",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      ClickyButton(
                                        color: Colors.grey,
                                        onPressed: () async {
                                          await sendRobotControl(EnumRobotControl.MODE_START);
                                        },
                                        child: const Text(
                                          "?????? ??????",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      ClickyButton(
                                        color: Colors.grey,
                                        onPressed: () async {
                                          await sendRobotControl(EnumRobotControl.MODE_PAUSE);
                                        },
                                        child: const Text(
                                          "????????????",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      ClickyButton(
                                        color: Colors.grey,
                                        onPressed: () async {
                                          await sendRobotControl(EnumRobotControl.MODE_STOP);
                                        },
                                        child: const Text(
                                          "????????????",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 23,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("????????? ??????"),
                                      Text("$_enumMode"),
                                    ],
                                  ),
                                  Wrap(
                                    children: [
                                      RadioListTile<EnumSelectMode>(
                                        title: const Text("??????"),
                                        value: EnumSelectMode.sit,
                                        groupValue: _enumMode,
                                        onChanged: (v) {
                                          setState(() {
                                            _enumMode = v ?? EnumSelectMode.sit;
                                          });
                                        },
                                      ),
                                      RadioListTile<EnumSelectMode>(
                                        title: const Text("????????????"),
                                        value: EnumSelectMode.stand,
                                        groupValue: _enumMode,
                                        onChanged: (v) {
                                          setState(() {
                                            _enumMode = v ?? EnumSelectMode.stand;
                                          });
                                        },
                                      ),
                                      RadioListTile<EnumSelectMode>(
                                        title: const Text("?????????"),
                                        value: EnumSelectMode.standing,
                                        groupValue: _enumMode,
                                        onChanged: (v) {
                                          setState(() {
                                            _enumMode = v ?? EnumSelectMode.standing;
                                          });
                                        },
                                      ),
                                      RadioListTile<EnumSelectMode>(
                                        title: const Text("?????????"),
                                        value: EnumSelectMode.squat,
                                        groupValue: _enumMode,
                                        onChanged: (v) {
                                          setState(() {
                                            _enumMode = v ?? EnumSelectMode.squat;
                                          });
                                        },
                                      ),
                                      RadioListTile<EnumSelectMode>(
                                        title: const Text("????????????"),
                                        value: EnumSelectMode.levelWalking,
                                        groupValue: _enumMode,
                                        onChanged: (v) {
                                          setState(() {
                                            _enumMode = v ?? EnumSelectMode.levelWalking;
                                          });
                                        },
                                      ),
                                      RadioListTile<EnumSelectMode>(
                                        title: const Text("????????????"),
                                        value: EnumSelectMode.stairsWalking,
                                        groupValue: _enumMode,
                                        onChanged: (v) {
                                          setState(() {
                                            _enumMode = v ?? EnumSelectMode.stairsWalking;
                                          });
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const VerticalDivider(
                          color: Colors.black,
                        ),
                        Expanded(
                          flex: 5,
                          child: DefaultTabController(
                            length: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TabBar(
                                  labelColor: Colors.black,
                                  indicatorColor: Colors.deepOrange,
                                  tabs: [
                                    Tab(
                                      text: "???????????????",
                                    ),
                                    Tab(
                                      text: "????????????",
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: TabBarView(
                                    physics: const NeverScrollableScrollPhysics(),
                                    children: [
                                      //TODO ??????????????? ???
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const RobotSizeSettingWidget(),
                                            const Spacer(),
                                            ClickyButton(
                                              onPressed: () async {
                                                final rs = ref.read(robotSizeProvider);
                                                var res = await _mobileTransceiverClient?.sendRobotSize(MsgRobotSize(
                                                  leftShankLength: rs.lk,
                                                  leftThighLength: rs.lh,
                                                  rightShankLength: rs.rk,
                                                  rightThighLength: rs.rh,
                                                ));
                                              },
                                              color: Colors.orange,
                                              child: const Text(
                                                "??????????????? ??????",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //TODO ?????? ?????? ???
                                      Column(
                                        children: [
                                          const Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: ModeSettingWidget(),
                                            ),
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                          ),
                                          ClickyButton(
                                            onPressed: () async {
                                              final ms = ref.read(modeSettingProvider);
                                              var res = await _mobileTransceiverClient?.sendModeSettings(
                                                MsgModeSettings(
                                                  mode: EnumMode.MODE_LEVEL_WALKING,
                                                  leftTorqueLevel: [
                                                    ms.leftHipExtensionTorqueLevel ?? 10,
                                                    ms.leftHipFlexionTorqueLevel ?? 10,
                                                    ms.leftKneeExtensionTorqueLevel ?? 10,
                                                    ms.leftKneeFlexionTorqueLevel ?? 10
                                                  ],
                                                  rightTorqueLevel: [
                                                    ms.rightHipExtensionTorqueLevel ?? 10,
                                                    ms.rightHipFlexionTorqueLevel ?? 10,
                                                    ms.rightKneeExtensionTorqueLevel ?? 10,
                                                    ms.rightKneeFlexionTorqueLevel ?? 10
                                                  ],
                                                  buttonControl: ms.btnControl,
                                                  terminalSupport: ms.terminalSupport,
                                                  keepStandingSupport: ms.keepStanding,
                                                  bpm: ms.bpm?.toInt(),
                                                  sensitivity: ms.sensitivity,
                                                  supportDuration: ms.supportDuration,
                                                  stanceSupport: ms.stanceSupport,
                                                  aimHipAngle: ms.targetHipDegree,
                                                  opControlAlgorithm: ms.controlAlgorithm,
                                                  weightBearing: true,
                                                ),
                                              );
                                            },
                                            color: Colors.orange,
                                            child: const Text(
                                              "?????? ??????",
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  /// [GRPC] GRPC??? ????????? ?????? ?????????
  /// ????????? ????????? ?????? ????????? ?????????????????? ????????? ??????
  ///

  Future<List<int>> readCert() async {
    final cert = await rootBundle.load('assets/server.crt');

    final certAsList =
        cert.buffer.asUint8List(cert.offsetInBytes, cert.lengthInBytes).map((uint8) => uint8.toInt()).toList();
    print(certAsList);
    return certAsList;
  }

  Future connectDevice() async {
    var cert = await readCert();
    print("[Call] connectDevice()");
    FlutterP2pPlus _flutterP2pPlus = ref.read(wifiDirectProvider).flutterP2pPlus;
    print("[Device] : ${widget.device} | ${widget.device.deviceAddress} | "
        "${widget.device.deviceName}");
    try {
      bool? result = await _flutterP2pPlus.connect(widget.device);
      print("[connect] p2p???????????? ??????: result: $result");

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

  /// [GRPC] ????????? ????????? ???????????? ????????? ??????????????? ?????? ??? ???????????? ???????????? ?????? ?????????
  Future sendPlaySound(String args) async {
    // final name = args.isNotEmpty ? args[0] : 'world';
    try {
      final response = await soundStub?.playSound(
        PlayRequest()
          ..volume = soundVolume.toInt()
          ..path = args,
        options: CallOptions(compression: const GzipCodec()),
      );
      print('Greeter client received: ${response?.message}');
    } catch (e) {
      print('Caught error: $e');
    }
  }

  /// [GRPC] ????????? ????????? ???????????? ????????? ????????? ????????? ????????? ?????? ?????? ?????????
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

  /// [GRPC] ??????????????? ???????????? ???????????? ?????? ????????? ??????????????? ?????? ??????
  Future sendRhythmControl(RhythmControl rhythmControl) async {
    try {
      final response = await _mobileTransceiverClient?.sendRhythmControl(
        MsgRhythmPlayControl()..rhythmControl = rhythmControl,
        options: CallOptions(compression: const GzipCodec()),
      );
      print('Greeter client received: sendRhythmControl: ${response?.message}');
    } catch (e) {
      print('Caught error: $e');
    }
  }

  /// [GRPC] ?????? ????????? ???????????? ????????? ???????????? ?????? ?????????
  Future sendSetMode() async {
    EnumMode mode = EnumMode.MODE_SIT;
    switch (_enumMode) {
      case EnumSelectMode.unselect:
        // TODO: Handle this case.

        break;
      case EnumSelectMode.squat:
        mode = EnumMode.MODE_SQUAT;
        break;

      case EnumSelectMode.sit:
        // TODO: Handle this case.
        mode = EnumMode.MODE_SIT;
        break;
      case EnumSelectMode.stand:
        // TODO: Handle this case.
        mode = EnumMode.MODE_STAND;
        break;
      case EnumSelectMode.standing:
        // TODO: Handle this case.
        mode = EnumMode.MODE_STANDING;
        break;
      case EnumSelectMode.levelWalking:
        // TODO: Handle this case.
        mode = EnumMode.MODE_LEVEL_WALKING;
        break;
      case EnumSelectMode.stairsWalking:
        // TODO: Handle this case.
        mode = EnumMode.MODE_STAIRS;
        break;
    }

    try {
      final response = await _mobileTransceiverClient?.setMode(
        ModeBlock()..mode = mode,
        options: CallOptions(compression: const GzipCodec()),
      );
      print('Greeter client received: ${response?.message}');
    } catch (e) {
      print('Caught error: $e');
    }
  }

  Future sendRobotControl(EnumRobotControl enumRobotControl) async {
    try {
      var response = await _mobileTransceiverClient?.sendRobotControl(
        RobotControl()..robotControl = enumRobotControl,
      );
      print(response);
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: "${e.toString()}");
    }
  }

  void dataHandler(data) {
    var msg = utf8.decode(data);
    // var msg = String.fromCharCodes(data).trim();
    // print("[?????? ?????? ?????????] [?????????] $data");
    // print("[?????? ?????? ?????????] [?????????] $msg");
    var _splitPacket = msg.split("#");

    // print("[_splitPacket] : ${_splitPacket}");
    // List<String> paddingElements = [];
    String paddingElement = "";
    bool _isError = false;
    for (int i = 0; i < _splitPacket.length; i++) {
      String element = _splitPacket[i];
      // print("[Origin Msg] $i: $element");
      // print(element.length);
      Map<String, dynamic> _decodeMsg = {};
      if (element.isNotEmpty) {
        try {
          _decodeMsg = jsonDecode(element);
          paddingElement = element;
          _isError = false;
        } catch (e) {
          // print("[Error] jsonDecode error: $e");
          _isError = true;
          if (i == (_splitPacket.length - 1)) {
            paddingElement = element;
          } else {
            paddingElement += element;
          }
          // print("[paddingElement]: ${paddingElement}");
        }
      }

      // print(paddingElement);
      // print("[_isError]: $i | ${_splitPacket.length - 1} | $_isError");
      if (paddingElement.isNotEmpty && !(_isError)) {
        _isError = false;
        // print("[paddingElement]: $i | ${_splitPacket.length - 1} | ${paddingElement}");
        try {
          _decodeMsg = jsonDecode(paddingElement);
          var _msg = BasicMsg.fromJson(_decodeMsg);
          // print("[Origin Msg][fromJson] : ${[_msg]}");
          double diffTime = (_msg.timestamp ?? 0) - (_basicMsg.timestamp ?? 0);
          _basicMsg = BasicMsg.fromJson(_decodeMsg);
          var splitMsgItem = _basicMsg.msg?.split("|") ?? [];
          // print("splitMsgItem Length : ${splitMsgItem.length}");
          if (splitMsgItem.length > 1) {
            String type = splitMsgItem[0];
            String value = splitMsgItem[1];
            if (type == "emr") {
              debugPrint("emr ?????? ?????? ????????? ");
              if (value == "False") {
                ref.watch(emrButtonStateProvider.notifier).state = false;
              } else {
                ref.watch(emrButtonStateProvider.notifier).state = true;
              }
            } else if (type == "backpack") {
              debugPrint("backpack ?????? ?????? ????????? ");
              debugPrint("===== ?????? ?????? Value: $value");
              var result = value.substring(1, value.length - 1);
              // debugPrint(result);
              var sResult = result.split(",");
              var filterList = sResult.map((e) => e == "True" ? true : false).toList();
              debugPrint(filterList.toString());
              ref.watch(backpackButtonProvider.notifier).state = filterList;
            } else if (type == "joy") {
              debugPrint("???????????? ?????? ????????? ");
              debugPrint("===== ???????????? ??? Value: $value");
              var joyParts = value.split("@");
              var _btnResult = joyParts[0].substring(1, joyParts[0].length - 1);
              // debugPrint(result);
              var sResult = _btnResult.split(",");
              var _filterList = sResult.map((e) => e.trim() == "0" ? true : false).toList();
              debugPrint("[JoyStick][Buttons] : ${_filterList.toString()}");

              var _axisResult = joyParts[1].substring(1, joyParts[1].length - 1);
              var _sResult = _axisResult.split(",");
              var _filterAxisList = _sResult.map((e) => double.parse(e.trim())).toList();
              ref.watch(joyButtonStateBoolProvider.notifier).updateState(_filterList);
              ref.watch(joyAxisStateProvider.notifier).updateState(_filterAxisList);
            } else if (type == "debug_encoder_raw") {
              // debugPrint("[?????????] ????????? ??? ????????? ");
              // debugPrint("===== ????????? ?????? Value: $value");
              final encoderRaw = EncoderRaw.fromJson(jsonDecode(value));
              // print("[data]: ${encoderRaw.data}");
              // print("[data]: ${encoderRaw.layout.toString()}");
              ref.read(encoderRawProvider.notifier).state = encoderRaw;
            }
          }

          _sumTotalTime += diffTime;
          _sumTotalCount++;
          ref.read(p2pSocketInputTimestampProvider.notifier).state = diffTime;
          ref.read(benchmarkPackAvgTime.notifier).state = (_sumTotalTime / _sumTotalCount);
        } catch (e, s) {
          // debugPrint("[Error] ?????? ?????? ${e.toString()} , ${s.toString()}");
          print("[Error] index: ${_splitPacket.length - 1} | $i");
        }
      }
    }

    // print(String.fromCharCodes(data).trim());
  }

  void errorHandler(error, StackTrace trace) {
    print(error);
  }

  void doneHandler() {
    print("socket listen onDone(): doneHandler()");
    _clientSocket?.destroy();
    _streamSubscription?.cancel().then((value) {
      _streamSubscription = null;
    });
  }

  /// [????????????] ????????? ???????????? ?????? ??????
  Future connectSocket() async {
    var ipAddress = ref.watch(p2pDeviceAddressProvider);
    print("ipAddress: ${ipAddress} ");
    _clientSocket = await Socket.connect(
      ipAddress ?? '192.168.15.240',
      8000,
      timeout: const Duration(
        seconds: 5,
      ),
    ).catchError((e) {
      print("Unable to connect: $e");
    });
    print("_clientSocket: $_clientSocket");
    if (_clientSocket != null) {
      setState(() {
        _isSocketConnected = true;
      });
    }
  }

  /// [????????????] ????????? ????????? ?????? ?????????
  Future listenData() async {
    print("[Call] listenData()");
    await _streamSubscription?.cancel();
    _streamSubscription = null;
    _streamSubscription ??= _clientSocket?.listen(
      dataHandler,
      onError: errorHandler,
      onDone: doneHandler,
      cancelOnError: false,
    );
  }

  /// [?????? ??????] ???????????? ?????? ?????? ?????? ??????
  Future startCommend() async {
    try {
      _clientSocket?.write("start");
    } catch (e, s) {
      print("[Error] ${e.toString()}, ${s.toString()}");
    }
  }

  /// [?????? ??????] ????????? ???????????? ?????? ?????? ??????
  Future stopListen() async {
    try {
      _clientSocket?.write("end");
    } catch (e, s) {
      print("[Error] ${e.toString()}, ${s.toString()}");
    }
    // _clientSocket?.listen(dataHandler, onError: errorHandler, onDone: doneHandler, cancelOnError: false);
  }
}
