import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grpc_demo_app/src/enums/enum_mode.dart';
import 'package:flutter_grpc_demo_app/src/model/basic_msg.dart';
import 'package:flutter_grpc_demo_app/src/protos/helloworld.pbgrpc.dart';
import 'package:flutter_grpc_demo_app/src/protos/m30_backpack_stream.pbgrpc.dart';
import 'package:flutter_grpc_demo_app/src/protos/sound.pb.dart';
import 'package:flutter_grpc_demo_app/src/protos/sound.pbgrpc.dart';
import 'package:flutter_grpc_demo_app/src/provider/backpack_button_provider.dart';
import 'package:flutter_grpc_demo_app/src/provider/emr_button_state_provider.dart';
import 'package:flutter_grpc_demo_app/src/provider/joystick_state_provider.dart';
import 'package:flutter_grpc_demo_app/src/provider/wifi_direct_provider.dart';
import 'package:flutter_grpc_demo_app/src/ui/component/clickly_button.dart';
import 'package:flutter_grpc_demo_app/src/ui/component/fancy_button.dart';
import 'package:flutter_p2p_plus/flutter_p2p_plus.dart';
import 'package:flutter_p2p_plus/protos/protos.pb.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grpc/grpc.dart';
import 'package:pushable_button/pushable_button.dart';

class TcpSimpleTestPage extends ConsumerStatefulWidget {
  TcpSimpleTestPage({Key? key, required this.device}) : super(key: key);
  WifiP2pDevice device;

  @override
  ConsumerState<TcpSimpleTestPage> createState() => _TcpSimpleTestPageState();
}

class _TcpSimpleTestPageState extends ConsumerState<TcpSimpleTestPage> {
  Socket? _clientSocket;
  BasicMsg _basicMsg = BasicMsg(msg: "", timestamp: 0);
  StreamSubscription? _streamSubscription;
  bool _isSocketConnected = false;


  ClientChannel? soundChannel;
  SoundClient? soundStub;
  double soundVolume = 70.0;

  Future sendPlaySound(String args) async {
    // final name = args.isNotEmpty ? args[0] : 'world';

    try {
      final response = await soundStub?.playSound(
        PlayRequest()..volume = soundVolume.toInt()..path = args,
        options: CallOptions(compression: const GzipCodec()),
      );
      print('Greeter client received: ${response?.message}');
    } catch (e) {
      print('Caught error: $e');
    }
  }
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectDevice();

  }

  Future connectDevice() async {
    print("[Call] connectDevice()");
    FlutterP2pPlus _flutterP2pPlus = ref.read(wifiDirectProvider).flutterP2pPlus;
    print("[Device] : ${widget.device} | ${widget.device.deviceAddress} | "
        "${widget.device.deviceName}");
    try {
      bool? result = await _flutterP2pPlus.connect(widget.device);
      print("[connect] result: $result");

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

  void dataHandler(data) {
    var msg = utf8.decode(data);
    // var msg = String.fromCharCodes(data).trim();
    print(msg);
    var _splitPacket = msg.split("#");

    for (String element in _splitPacket) {
      print("[Origin Msg] element : ${element}");
      if (element.isNotEmpty && element.length > 50) {
        try {
          var _msg = BasicMsg.fromJson(jsonDecode(element));
          // print("[Origin Msg][fromJson] : ${[_msg]}");
          double diffTime = (_msg.timestamp ?? 0) - (_basicMsg.timestamp ?? 0);
          _basicMsg = BasicMsg.fromJson(jsonDecode(element));
          var splitMsgItem = _basicMsg.msg?.split("|") ?? [];
          // print("splitMsgItem Length : ${splitMsgItem.length}");
          if (splitMsgItem.length > 1) {
            String type = splitMsgItem[0];
            String value = splitMsgItem[1];
            if (type == "emr") {
              debugPrint("emr 버튼 패킷 들어옴 ");
              if (value == "False") {
                ref.watch(emrButtonStateProvider.notifier).state = false;
              } else {
                ref.watch(emrButtonStateProvider.notifier).state = true;
              }
            } else if (type == "backpack") {
              debugPrint("backpack 버튼 패킷 들어옴 ");
              debugPrint("===== 백팩 버튼 Value: $value");
              var result = value.substring(1, value.length - 1);
              // debugPrint(result);
              var sResult = result.split(",");
              var filterList = sResult.map((e) => e == "True" ? true : false).toList();
              debugPrint(filterList.toString());
              ref.watch(backpackButtonProvider.notifier).state = filterList;
            } else if (type == "joy") {
              debugPrint("조이스틱 패킷 들어옴 ");
              debugPrint("===== 조이스틱 값 Value: $value");
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
            }
          }

          // _sumTotalTime += diffTime;
          // _sumTotalCount++;
          ref.watch(p2pSocketInputTimestampProvider.notifier).state = diffTime;
          // ref.watch(benchmarkPackAvgTime.notifier).state = (_sumTotalTime / _sumTotalCount);

        } catch (e, s) {
          debugPrint("[Error] 변환 오류 ${e.toString()} , ${s.toString()}");
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

  Future connectSocket() async {
    var ipAddress = ref.watch(p2pDeviceAddressProvider);
    _clientSocket =
        await Socket.connect(ipAddress ?? '192.168.15.240', 8000, timeout: const Duration(seconds: 5)).catchError((e) {
      print("Unable to connect: $e");
    });
    print("_clientSocket: ${_clientSocket}");
    if (_clientSocket != null) {
      setState(() {
        _isSocketConnected = true;
      });
    }
  }

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

  Future stopListen() async {
    try {
      _clientSocket?.write("end");
    } catch (e, s) {
      print("[Error] ${e.toString()}, ${s.toString()}");
    }
    // _clientSocket?.listen(dataHandler, onError: errorHandler, onDone: doneHandler, cancelOnError: false);
  }

  Future startCommend() async {
    try {
      _clientSocket?.write("start");
    } catch (e, s) {
      print("[Error] ${e.toString()}, ${s.toString()}");
    }
  }


  @override
  void dispose() {
    // TODO: implement dispose
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
            }
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return const Center(
            child: Text("가로화면 지원"),
          );
        }
        return Row(
          children: [
            Expanded(
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
                              child: const Text(
                                "소켓연결",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.green,
                            ),
                            ClickyButton(
                              onPressed: () async {
                                print("연결 종료");
                                await _clientSocket?.close();
                                _clientSocket?.destroy();
                                setState(() {
                                  _isSocketConnected = false;
                                });
                              },
                              child: const Text(
                                "연결 종료",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.red,
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
                            //           "연결 종료",
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
                              child: const Text(
                                "Hello 전달",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.deepPurple,
                            ),
                            ClickyButton(
                              onPressed: () async {
                                listenData();
                              },
                              child: const Text(
                                "데이터 구독",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.deepPurple,
                            ),
                            ClickyButton(
                              onPressed: () async {
                                startCommend();
                              },
                              child: const Text(
                                "데이터 시작",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.deepPurple,
                            ),
                            ClickyButton(
                              onPressed: () async {
                                stopListen();
                              },
                              child: const Text(
                                "데이터 중단",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.deepPurple,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                          height: 240,
                          child: Row(
                            children: [
                              Expanded(
                                child: Consumer(
                                  builder: (BuildContext context, WidgetRef ref, Widget? child) {
                                    final emrState = ref.watch(emrButtonStateProvider);
                                    return Container(
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: emrState ? Colors.green : Colors.red,
                                      ),
                                      child: const Center(
                                          child: Text(
                                        "비상버튼",
                                      )),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "백팩 버튼",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      child: Consumer(
                                        builder: (BuildContext context, WidgetRef ref, Widget? child) {
                                          final backpackState = ref.watch(backpackButtonProvider);
                                          return GridView.count(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 16,
                                            crossAxisSpacing: 16,
                                            childAspectRatio: 1.8,
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
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Text(
                          "조이스틱 컨트롤러",
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
                              crossAxisCount: 4,
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
                              crossAxisCount: 4,
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
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                                  .toList(),
                            ),
                          );
                        }),
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
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        ClickyButton(
                          onPressed: () async {
                            sendPlaySound("/01/001.mp3");
                          },
                          child: const Text(
                            "사운드 테스트",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          color: Colors.orange,
                        ),
                        ClickyButton(
                          onPressed: () async {
                            // sendPlaySound("/01/001.mp3");륨
                            sendSetVolume();
                          },
                          child: const Text(
                            "볼륨 설정",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("볼륨"),
                        Expanded(
                          child: Slider(value: soundVolume,
                              min: 0,
                              max: 80,
                              divisions: 80,
                              onChanged: (d){
                                setState(() {
                                  soundVolume = d;
                                });
                              }),
                        ),
                        Text("${soundVolume}"),
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
                          onPressed: () async {},
                          child: const Text(
                            "모드 설정",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        ClickyButton(
                          color: Colors.grey,
                          onPressed: () async {},
                          child: const Text(
                            "모드 시작",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        ClickyButton(
                          color: Colors.grey,
                          onPressed: () async {},
                          child: const Text(
                            "일시정지",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        ClickyButton(
                          color: Colors.grey,
                          onPressed: () async {},
                          child: const Text(
                            "모드종료",
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
                        const Text("선택한 모드"),
                        Text("$_enumMode"),
                      ],
                    ),
                    Wrap(
                      children: [
                        RadioListTile<EnumMode>(
                          title: const Text("앉기"),
                          value: EnumMode.sit,
                          groupValue: _enumMode,
                          onChanged: (v) {
                            setState(() {
                              _enumMode = v ?? EnumMode.sit;
                            });
                          },
                        ),
                        RadioListTile<EnumMode>(
                          title: const Text("일어서기"),
                          value: EnumMode.stand,
                          groupValue: _enumMode,
                          onChanged: (v) {
                            setState(() {
                              _enumMode = v ?? EnumMode.stand;
                            });
                          },
                        ),
                        RadioListTile<EnumMode>(
                          title: const Text("서있기"),
                          value: EnumMode.standing,
                          groupValue:_enumMode,
                          onChanged: (v) {
                            setState(() {
                              _enumMode = v ?? EnumMode.standing;
                            });
                          },
                        ),
                        RadioListTile<EnumMode>(
                          title: const Text("스쿼트"),
                          value: EnumMode.squat,
                          groupValue:_enumMode,
                          onChanged: (v) {
                            setState(() {
                              _enumMode = v ?? EnumMode.squat;
                            });
                          },
                        ),
                        RadioListTile<EnumMode>(
                          title: const Text("평지보행"),
                          value: EnumMode.levelWalking,
                          groupValue:_enumMode,
                          onChanged: (v) {
                            setState(() {
                              _enumMode = v ?? EnumMode.levelWalking;
                            });
                          },
                        ),
                        RadioListTile<EnumMode>(
                          title: const Text("계단보행"),
                          value: EnumMode.stairsWalking,
                          groupValue:_enumMode,
                          onChanged: (v) {
                            setState(() {
                              _enumMode = v ?? EnumMode.stairsWalking;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )),
          ],
        );
      }),
    );
  }

  EnumMode _enumMode = EnumMode.unselect;
}
