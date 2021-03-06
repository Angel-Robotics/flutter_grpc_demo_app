import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as service;
import 'package:flutter_grpc_demo_app/src/protos/mobile_transceiver.pbgrpc.dart';
import 'package:flutter_grpc_demo_app/src/protos/sound.pbgrpc.dart';
import 'package:flutter_grpc_demo_app/src/provider/ros_lib_state_provider.dart';
import 'package:flutter_grpc_demo_app/src/provider/wifi_direct_provider.dart';
import 'package:flutter_p2p_plus/flutter_p2p_plus.dart';
import 'package:flutter_p2p_plus/protos/protos.pb.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:roslibdart/roslibdart.dart';

class RosLibRequestTestPage extends ConsumerStatefulWidget {
  WifiP2pDevice device;

  RosLibRequestTestPage({
    Key? key,
    required this.device,
  }) : super(key: key);

  @override
  ConsumerState<RosLibRequestTestPage> createState() => _RosLibRequestTestPageState();
}

class _RosLibRequestTestPageState extends ConsumerState<RosLibRequestTestPage> {
  bool _isSocketConnected = false;

  grpc.ClientChannel? soundChannel;
  grpc.ClientChannel? _clientChannel;
  SoundClient? soundStub;
  MobileTransceiverClient? _mobileTransceiverClient;
  late Ros ros;
  Topic? chatter;
  Service? mobileBridgeRequest;
  StreamSubscription? _rosStateSubscription;

  Future initRos() async {
    ros = Ros(url: 'ws://192.168.15.240:9090');
    await _rosStateSubscription?.cancel();
    _rosStateSubscription = null;
    _rosStateSubscription ??= ros.statusStream.listen((event) {
      print(event);
    });
    mobileBridgeRequest = Service(name: 'mobile_bridge_request', ros: ros, type: "mobile_app_interfaces/MobileBird");
    print("Connect: ROS");
    ros.connect();
    await Future.delayed(Duration(seconds: 2));
    Map<String, dynamic> json = {"rq_code": 1, "data": "hello"};
    Map<String, dynamic> result = await mobileBridgeRequest?.call(json);
    // msgToPublished = result['sum'];
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
    // destroyConnection();
    super.dispose();
  }

  void destroyConnection() async {
    await ros.close();
    await _rosStateSubscription?.cancel();
    _rosStateSubscription = null;
    // ros1.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("?????? ?????? ?????? (????????????)"),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(border: Border.all()),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("?????? ??????"),
                                  const Text("ROS ???????????? ?????? (????????? ??????)"),
                                  OutlinedButton(
                                    onPressed: () {
                                      initRos();
                                      ref.read(rosLibProvider).connectRos();
                                    },
                                    child: const Text(
                                      "??????",
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      // destroyConnection();
                                      ref.read(rosLibProvider).destroyConnection();
                                    },
                                    child: const Text(
                                      "????????????",
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () async {
                                      // await Future.delayed(Duration(seconds: 2));
                                      Map<String, dynamic> json = {"rq_code": 0, "data": "hello"};
                                      Map<String, dynamic> result = await mobileBridgeRequest?.call(json);
                                      print(result);
                                    },
                                    child: const Text(
                                      "?????? ??????",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(border: Border.all()),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Device Info"),
                                  const Text("?????? ?????? ????????? ?????? ????????? ??????"),
                                  ...ref.read(rosLibProvider).generateDeviceInfoTestItems().map((e) {
                                    return OutlinedButton(
                                      onPressed: () async {
                                        Map<String, dynamic> json = {"rq_code": e.rqCode, "data": e.data};
                                        Map<String, dynamic> result = await ref.read(rosLibProvider).mobileBridgeRequest?.call(json);
                                        print(result);
                                      },
                                      child:  Text(
                                        e.title ?? "??",
                                      ),
                                    );
                                  }).toList(),
                                  // OutlinedButton(
                                  //   onPressed: () async {
                                  //     Map<String, dynamic> json = {"rq_code": 1000, "data": "device_info_summary"};
                                  //     Map<String, dynamic> result = await mobileBridgeRequest?.call(json);
                                  //     print(result);
                                  //   },
                                  //   child: const Text(
                                  //     "?????? ????????? ?????? ??????",
                                  //   ),
                                  // ),
                                  // OutlinedButton(
                                  //   onPressed: () async {
                                  //     Map<String, dynamic> json = {"rq_code": 1001, "data": "device_info_mac"};
                                  //     Map<String, dynamic> result = await mobileBridgeRequest?.call(json);
                                  //     print(result);
                                  //   },
                                  //   child: const Text(
                                  //     "MAC Address ?????? ??????",
                                  //   ),
                                  // ),
                                  // OutlinedButton(
                                  //   onPressed: () async {
                                  //     Map<String, dynamic> json = {"rq_code": 1002, "data": "device_info_mac"};
                                  //     Map<String, dynamic> result = await mobileBridgeRequest?.call(json);
                                  //     print(result);
                                  //   },
                                  //   child: const Text(
                                  //     "ROS ?????? ?????? ??????",
                                  //   ),
                                  // ),
                                  // OutlinedButton(
                                  //   onPressed: () async {
                                  //     Map<String, dynamic> json = {"rq_code": 1003, "data": "device_info_mac"};
                                  //     Map<String, dynamic> result = await mobileBridgeRequest?.call(json);
                                  //     print(result);
                                  //   },
                                  //   child: const Text(
                                  //     "IP ?????? ?????? ??????",
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(border: Border.all()),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Mobile Bridge Roslib"),
                                  const Text("????????? ????????? ?????? ??? ????????? ??????"),
                                  const Divider(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("?????? ????????? ?????? ??????"),
                                      OutlinedButton(
                                        onPressed: () async {},
                                        child: const Text(
                                          "??????????????? ?????? ?????? ??????",
                                        ),
                                      ),
                                      OutlinedButton(
                                        onPressed: () async {},
                                        child: const Text(
                                          "????????? ?????? ??????",
                                        ),
                                      ),
                                      OutlinedButton(
                                        onPressed: () async {},
                                        child: const Text(
                                          "???????????? ?????? ?????? ??? ?????????",
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("?????????, ??????, ??????"),
                                      OutlinedButton(
                                        onPressed: () async {},
                                        child: const Text(
                                          "????????? ?????? ??????",
                                        ),
                                      ),
                                      OutlinedButton(
                                        onPressed: () async {},
                                        child: const Text(
                                          "?????? ?????? ??????",
                                        ),
                                      ),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "????????? ?????? ????????? 1",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "????????? ?????? ????????? 2",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "????????? ?????? ????????? 3",
                                            ),
                                          ),
                                        ],
                                      ),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "?????? ?????? ????????? 1",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "?????? ?????? ????????? 2",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "?????? ?????? ????????? 3",
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const Divider(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("?????? ?????? ?????????"),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "???????????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "?????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "????????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "???????????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "????????????(?????????) ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "??????????????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "??????????????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "????????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "6??? ????????????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "10?????? ????????????",
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Text("?????? ?????? ?????????"),
                                      OutlinedButton(
                                        onPressed: () async {},
                                        child: const Text(
                                          "????????????(??????) ??????",
                                        ),
                                      ),
                                      const Text("?????? ????????????"),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "???????????? ?????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "????????? ?????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "?????? ?????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "???????????? ?????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "???????????? (?????????) ?????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "????????? ?????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "??????????????? ?????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "??????????????? ?????? ??????",
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Text("???????????? ????????????"),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "6??? ?????? ?????? ?????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "10?????? ???????????? ?????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "????????? ?????? ??????",
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Text("???????????? ????????? ????????? ??????"),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "????????????(??????) ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "???????????? ??????",
                                            ),
                                          ),
                                        ],
                                      ),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "?????? ?????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "?????? ?????? ????????????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "?????? ?????? ??????(??????)",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "?????????????????? ?????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "?????????????????? ?????? ??????(??????)",
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      const Text("??????"),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "CM(????????? ??????) ?????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "MD(?????? ????????????) ?????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "????????? ?????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "????????? ??? ???????????? ??????",
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Text("????????? ?????? ?????? ??????"),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "????????? ?????? ?????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "????????? ????????? ?????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "????????? ????????? ?????? ??????",
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      const Text("?????????????????? ????????? ??????"),
                                      const Text("???????????? ????????? ??????"),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "???????????? ?????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "???????????? ?????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "???????????? ?????? ??????",
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Text("??????????????? ????????? ??????"),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "??????????????? ?????? ??????",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "????????? ?????? ?????? ??????",
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Text("????????? ?????? ????????? ??????"),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "????????? ?????? ?????? ??????",
                                            ),
                                          ),
                                        ],
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
                    const VerticalDivider(
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(border: Border.all()),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Status"),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(border: Border.all()),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("??????"),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(border: Border.all()),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("??????"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          destroyConnection();
          Navigator.of(context).pop();
        },
        label: const Text("??????"),
        icon: const Icon(Icons.logout),
      ),
    );
  }

  Future<List<int>> readCert() async {
    final cert = await service.rootBundle.load('assets/server.crt');

    final certAsList = cert.buffer
        .asUint8List(cert.offsetInBytes, cert.lengthInBytes)
        .map(
          (uint8) => uint8.toInt(),
        )
        .toList();
    print(certAsList);
    return certAsList;
  }

  Future connectDevice() async {
    var cert = await readCert();
    debugPrint("[Call] connectDevice()");
    FlutterP2pPlus _flutterP2pPlus = ref.read(wifiDirectProvider).flutterP2pPlus;
    debugPrint("[Device] : ${widget.device} | ${widget.device.deviceAddress} | ${widget.device.deviceName}");
    try {
      bool? result = await _flutterP2pPlus.connect(widget.device);
      debugPrint("[connect] p2p???????????? ??????: result: $result");

      if (result ?? false) {
        ref.read(p2pDeviceConnectionStateProvider.notifier).state = true;
      }

      soundChannel = grpc.ClientChannel(
        '192.168.15.240',
        port: 50052,
        options: grpc.ChannelOptions(
          credentials: const grpc.ChannelCredentials.insecure(),
          codecRegistry: grpc.CodecRegistry(codecs: const [grpc.GzipCodec(), grpc.IdentityCodec()]),
        ),
      );
      soundStub = SoundClient(soundChannel!);

      _clientChannel = grpc.ClientChannel(
        '192.168.15.240',
        port: 50051,
        options: grpc.ChannelOptions(
          // credentials: const ChannelCredentials.insecure(),
          credentials: grpc.ChannelCredentials.secure(
            certificates: cert,
          ),
          codecRegistry: grpc.CodecRegistry(codecs: const [grpc.GzipCodec(), grpc.IdentityCodec()]),
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
}
