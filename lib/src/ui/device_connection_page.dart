import 'dart:async';

import 'package:flutter/material.dart';
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

class DeviceConnectionPage extends ConsumerStatefulWidget {
  DeviceConnectionPage({Key? key, required this.device}) : super(key: key);
  WifiP2pDevice device;

  @override
  ConsumerState<DeviceConnectionPage> createState() => _DeviceConnectionPageState();
}

class _DeviceConnectionPageState extends ConsumerState<DeviceConnectionPage> {

  ClientChannel? channel;
  GreeterClient? stub;
  M30BackpackIOStreamClient? m30BackpackStub;

  Map<String, StreamSubscription?> _streamSubscriptionMap = {};

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectDevice();
  }



  Future _connectionGrpc() async {
    print("   widget.device.deviceAddress,: ${widget.device.deviceAddress}");
    var ipAddress = ref.watch(p2pDeviceAddressProvider);
    channel = ClientChannel(
      // '192.168.15.240',
      ipAddress ?? '192.168.15.240',
      port: 50051,
      options: ChannelOptions(
        credentials: const ChannelCredentials.insecure(),
        codecRegistry: CodecRegistry(
          codecs: const [
            GzipCodec(),
            IdentityCodec(),
          ],
        ),
      ),
    );

    stub = GreeterClient(channel!);
    m30BackpackStub = M30BackpackIOStreamClient(channel!);
  }

  Future sendSayHello(String args) async {
    final name = args.isNotEmpty ? args[0] : 'world';

    try {
      final response = await stub
          ?.sayHello(
        HelloRequest()..name = name,
        options: CallOptions(
          compression: const GzipCodec(),
          timeout: const Duration(seconds: 5),
        ),
      )
          .catchError((error, stackTrace) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Text("${error.toString()}, ${stackTrace.toString()}"),
                ));
      });
      print('Greeter client received: ${response?.message}');
      Fluttertoast.showToast(msg: "사용 가능");
    } catch (e) {
      print('Caught error: $e');
    }
  }

  final StreamController<List<bool>> _streamController = StreamController.broadcast();

  Future listenStreams() async {
    print("[Call] listenStreams()");
    for (var element in _streamSubscriptionMap.entries) {
      await _streamSubscriptionMap[element.key]?.cancel();
      _streamSubscriptionMap[element.key] = null;
    }
    _streamSubscriptionMap["joy"] = m30BackpackStub?.streamJoystick(SayRequest()..trigger = true).listen((value) {
      print("[Listen] value: ${value}");
    }, onError: (e, c) {
      print("[Error] ${e.toString()}, ${c.toString()}");
    })
      ?..onData((data) {
        // print(data);
        print("[onData][JOY] value: ${data.buttons} | ${data.axes}");
        ref.watch(joyButtonStateProvider.notifier).updateState(data.buttons);
        ref.watch(joyAxisStateProvider.notifier).updateState(data.axes);
      });

    _streamSubscriptionMap["emr"] =
        m30BackpackStub?.streamEmergencyButton(SayRequest()..trigger = true).listen((value) {
      print("[Listen] value: ${value}");
    }, onError: (e, c) {
      print("[Error] ${e.toString()}, ${c.toString()}");
    })
          ?..onData((data) {
            // print(data);
            print("[onData][EMR] value: ${data}");
            ref.watch(emrButtonStateProvider.notifier).state = data.emrButton;
          });
    _streamSubscriptionMap["backpack"] =
        m30BackpackStub?.streamBackpackButtons(SayRequest()..trigger = true).listen((value) {
      print("[Listen] value: ${value}");
    }, onError: (e, c) {
      print("[Error] ${e.toString()}, ${c.toString()}");
    })
          ?..onData((data) {
            // print(data);
            // print("[onData][BACKPACK] value: ${data.buttons}");
            // ref.watch(backpackButtonProvider.notifier).state = data.buttons;
            _streamController.sink.add(data.buttons);
          });

    _streamSubscriptionMap['test_backpack'] ??= _streamController.stream.listen((event) {
      print(event);
      ref.watch(backpackButtonProvider.notifier).state = event;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    for (var element in _streamSubscriptionMap.entries) {
      _streamSubscriptionMap[element.key]?.cancel();
      _streamSubscriptionMap[element.key] = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.device.deviceName} | ${widget.device.deviceAddress}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                _connectionGrpc();
              },
              child: const Text("RPC 연결하기"),
            ),
            ElevatedButton(
              onPressed: () async {
                sendSayHello("Hello?");
              },
              child: const Text("Send Say Hello"),
            ),
            ElevatedButton(
                onPressed: () {
                  listenStreams();
                },
                child: const Text("Listen Streams")),
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
                        final joy = ref.watch(joyButtonStateProvider);
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
                                      color: e == 0x01 ? Colors.red : Colors.green,
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
