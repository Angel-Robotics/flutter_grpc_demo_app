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
              const Text("모든 요청 집합 (테스트용)"),
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
                                  const Text("연결 관리"),
                                  const Text("ROS 시스템과 연결 (웹소켓 기반)"),
                                  OutlinedButton(
                                    onPressed: () {
                                      initRos();
                                      ref.read(rosLibProvider).connectRos();
                                    },
                                    child: const Text(
                                      "연결",
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      // destroyConnection();
                                      ref.read(rosLibProvider).destroyConnection();
                                    },
                                    child: const Text(
                                      "연결해제",
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
                                      "연결 확인",
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
                                  const Text("젯슨 모듈 자체의 정보 처리에 사용"),
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
                                  //     "젯슨 시스템 정보 요청",
                                  //   ),
                                  // ),
                                  // OutlinedButton(
                                  //   onPressed: () async {
                                  //     Map<String, dynamic> json = {"rq_code": 1001, "data": "device_info_mac"};
                                  //     Map<String, dynamic> result = await mobileBridgeRequest?.call(json);
                                  //     print(result);
                                  //   },
                                  //   child: const Text(
                                  //     "MAC Address 정보 요청",
                                  //   ),
                                  // ),
                                  // OutlinedButton(
                                  //   onPressed: () async {
                                  //     Map<String, dynamic> json = {"rq_code": 1002, "data": "device_info_mac"};
                                  //     Map<String, dynamic> result = await mobileBridgeRequest?.call(json);
                                  //     print(result);
                                  //   },
                                  //   child: const Text(
                                  //     "ROS 관련 정보 요청",
                                  //   ),
                                  // ),
                                  // OutlinedButton(
                                  //   onPressed: () async {
                                  //     Map<String, dynamic> json = {"rq_code": 1003, "data": "device_info_mac"};
                                  //     Map<String, dynamic> result = await mobileBridgeRequest?.call(json);
                                  //     print(result);
                                  //   },
                                  //   child: const Text(
                                  //     "IP 관련 정보 요청",
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
                                  const Text("모바일 브릿지 노드 및 서비스 전용"),
                                  const Divider(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("로봇 조정을 위해 사용"),
                                      OutlinedButton(
                                        onPressed: () async {},
                                        child: const Text(
                                          "로봇사이즈 조정 요청 전달",
                                        ),
                                      ),
                                      OutlinedButton(
                                        onPressed: () async {},
                                        child: const Text(
                                          "구동기 원점 조정",
                                        ),
                                      ),
                                      OutlinedButton(
                                        onPressed: () async {},
                                        child: const Text(
                                          "업라이트 센서 원점 및 초기화",
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("사운드, 음성, 부저"),
                                      OutlinedButton(
                                        onPressed: () async {},
                                        child: const Text(
                                          "사운드 폴더 정보",
                                        ),
                                      ),
                                      OutlinedButton(
                                        onPressed: () async {},
                                        child: const Text(
                                          "볼륨 조정 요청",
                                        ),
                                      ),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "사운드 재생 테스트 1",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "사운드 재생 테스트 2",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "사운드 재생 테스트 3",
                                            ),
                                          ),
                                        ],
                                      ),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "부저 재생 테스트 1",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "부저 재생 테스트 2",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "부저 재생 테스트 3",
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
                                      const Text("훈련 관련 테스트"),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "일어서기 모드",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "앉기 모드",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "서있기 모드",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "평지보행 모드",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "평지보행(스마트) 모드",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "계단오르기 모드",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "제자리걷기 모드",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "스쿼트 모드",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "6분 보행검사",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "10미터 보행검사",
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Text("모드 설정 테스트"),
                                      OutlinedButton(
                                        onPressed: () async {},
                                        child: const Text(
                                          "모드설정(통합) 요청",
                                        ),
                                      ),
                                      const Text("일반 모드관련"),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "일어서기 모드 설정",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "서있기 모드 설정",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "앉기 모드 설정",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "평지보행 모드 설정",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "평지보행 (스마트) 모드 설정",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "스쿼트 모드 설정",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "계단오르기 모드 설정",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () async {},
                                            child: const Text(
                                              "제자리걷기 모드 설정",
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Text("보행분석 모드관련"),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "6분 보행 검사 모드 설정",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "10미터 보행검사 모드 설정",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "서있기 모드 설정",
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Text("훈련정보 테스트 데이터 요청"),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "모드설정(통합) 요청",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "훈련정보 요청",
                                            ),
                                          ),
                                        ],
                                      ),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "모드 구동 시작",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "모드 구동 일시정지",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "모드 구동 정지(종료)",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "리듬청각자극 훈련 시작",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "리듬청각자극 훈련 종료(정지)",
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      const Text("일반"),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "CM(컨트롤 모듈) 정보 요청",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "MD(모터 드라이버) 정보 요청",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "배터리 정보 요청",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "시스템 및 에러정보 요청",
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Text("시스템 구동 모드 설정"),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "시스템 일반 모드 설정",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "시스템 테스트 모드 설정",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "시스템 디버깅 모드 설정",
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      const Text("데이터베이스 테스트 관련"),
                                      const Text("고객정보 테스트 관련"),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "고객정보 등록 요청",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "고객정보 수정 요청",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "고객정보 삭제 요청",
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Text("로봇사이즈 테스트 관련"),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "로봇사이즈 등록 요청",
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "착용부 정보 등록 요청",
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Text("태블릿 정보 테스트 관련"),
                                      Wrap(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "태블릿 정보 등록 요청",
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
                                  Text("전송"),
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
                                  Text("응답"),
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
        label: const Text("종료"),
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
      debugPrint("[connect] p2p연결하기 결과: result: $result");

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
