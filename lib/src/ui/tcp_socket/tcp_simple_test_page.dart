import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_grpc_demo_app/src/model/basic_msg.dart';
import 'package:flutter_grpc_demo_app/src/protos/helloworld.pbgrpc.dart';
import 'package:flutter_grpc_demo_app/src/protos/m30_backpack_stream.pbgrpc.dart';
import 'package:flutter_grpc_demo_app/src/provider/backpack_button_provider.dart';
import 'package:flutter_grpc_demo_app/src/provider/emr_button_state_provider.dart';
import 'package:flutter_grpc_demo_app/src/provider/joystick_state_provider.dart';
import 'package:flutter_grpc_demo_app/src/provider/wifi_direct_provider.dart';
import 'package:flutter_p2p_plus/flutter_p2p_plus.dart';
import 'package:flutter_p2p_plus/protos/protos.pb.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grpc/grpc.dart';

class TcpSimpleTestPage extends ConsumerStatefulWidget {
  TcpSimpleTestPage({Key? key, required this.device}) : super(key: key);
  WifiP2pDevice device;

  @override
  ConsumerState<TcpSimpleTestPage> createState() => _TcpSimpleTestPageState();
}

class _TcpSimpleTestPageState extends ConsumerState<TcpSimpleTestPage> {
  Socket? _clientSocket;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  BasicMsg _basicMsg = BasicMsg(msg: "", timestamp: 0);

  void dataHandler(data) {
    // var msg = utf8.decode(data.data);
    var msg = String.fromCharCodes(data).trim();
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
    _clientSocket?.destroy();
  }

  Future connectSocket() async {
    var ipAddress = ref.watch(p2pDeviceAddressProvider);
    _clientSocket = await Socket.connect(ipAddress ?? '192.168.15.240', 8000).catchError((e) {
      print("Unable to connect: $e");
    });
  }

  StreamSubscription? _streamSubscription;

  Future listenData() async {

    await _streamSubscription?.cancel();
    _streamSubscription = null;
    _streamSubscription ??=
        _clientSocket?.listen(dataHandler, onError: errorHandler, onDone: doneHandler, cancelOnError: false);
  }

  Future stopListen() async {
    try {
      _clientSocket?.write("end");
    } catch (e, s) {
      print("[Error] ${e.toString()}, ${s.toString()}");
    }
    // _clientSocket?.listen(dataHandler, onError: errorHandler, onDone: doneHandler, cancelOnError: false);
  }

  Future startCommend() async{
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
      appBar: AppBar(
        title: Text("${widget.device.deviceName} | ${widget.device.deviceAddress}"),
        leading: IconButton(
          onPressed: () async {
            if (_clientSocket != null) {
              await _clientSocket?.close();
              _clientSocket?.destroy();
            }
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      connectSocket();
                    },
                    child: const Text("소켓 연결")),
                ElevatedButton(
                  onPressed: () async {
                    await _clientSocket?.close();
                    _clientSocket?.destroy();
                  },
                  child: const Text("연결 종료"),
                ),
                ElevatedButton(
                  onPressed: () {
                    listenData();
                  },
                  child: const Text("데이터 구독"),
                ),
                ElevatedButton(
                  onPressed: () {
                    startCommend();
                  },
                  child: const Text("데이터 시작 "),
                ),
                ElevatedButton(
                  onPressed: () {
                    stopListen();
                  },
                  child: const Text("데이터 종료"),
                ),
              ],
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
            SizedBox(
              height: 400,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      // height: 300,
                      child: Consumer(builder: (context, ref, _) {
                        final joy = ref.watch(joyButtonStateBoolProvider);
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 4,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 0.8,
                            children: joy
                                .map(
                                  (e) => Container(
                                    decoration: BoxDecoration(
                                      color: e  ? Colors.red : Colors.green,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        );
                      }),
                    ),
                  ),
                  Expanded(
                    child: Consumer(builder: (context, ref, _) {
                      final joy = ref.watch(joyAxisStateProvider);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 4,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.5,
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
