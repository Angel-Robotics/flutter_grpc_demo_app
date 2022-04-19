import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_grpc_demo_app/src/provider/wifi_direct_provider.dart';
import 'package:flutter_grpc_demo_app/src/services/permission_api.dart';
import 'package:flutter_grpc_demo_app/src/ui/device_connection_page.dart';
import 'package:flutter_p2p_plus/flutter_p2p_plus.dart';
import 'package:flutter_p2p_plus/protos/protos.pb.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'tcp_socket/tcp_simple_test_page.dart';

class DeviceScanPage extends ConsumerStatefulWidget {
  const DeviceScanPage({Key? key}) : super(key: key);

  @override
  _DemoHomePageState createState() => _DemoHomePageState();
}

class _DemoHomePageState extends ConsumerState<DeviceScanPage> with WidgetsBindingObserver {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    requestPermissions().then((value) {
      if (value == PermissionStatus.granted) {
        ref.read(wifiDirectProvider).initP2p().then((value) async {
          SharedPreferences sp = await SharedPreferences.getInstance();
          String? v = sp.getString("device");
          String? ip = sp.getString("ipAddress");
          if (v != null) {
            WifiP2pDevice wifiP2pDevice = WifiP2pDevice.fromJson(v);

            print("[Info] wifiP2pDevice: ${wifiP2pDevice.deviceName}");
            if (ref.read(p2pDeviceConnectionStateProvider)) {
              Future.delayed(Duration.zero).then((value) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    // builder: (context) => DeviceConnectionPage(
                    //   device: wifiP2pDevice,
                    //   // device:  WifiP2pDevice()?? ,
                    // ),
                    builder: (context) => TcpSimpleTestPage(
                      device: wifiP2pDevice,
                    ),
                  ),
                );
              });
            }
          }
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ref.read(wifiDirectProvider).initP2p();
    } else if (state == AppLifecycleState.paused) {
      ref.read(wifiDirectProvider).unregister();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: const Text("Wi-Fi Direct Demo"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final _devices = ref.watch(p2pDeviceItemProvider);
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 0.7,
                    children: _devices
                        .map(
                          (e) => GestureDetector(
                            onTap: () async {
                              if (!e.deviceName.contains("javier") ) {
                                return;
                              }
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text("안내"),
                                  content: Text("${e.deviceName} (${e.deviceAddress})를 연결할까요?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("취소")),
                                    TextButton(
                                        onPressed: () async {
                                          WifiP2pDevice _wifiP2pDevice = e;
                                          // GoRouter.of(context).push("/connection");
                                          print(_wifiP2pDevice.writeToJson());
                                          SharedPreferences sp = await SharedPreferences.getInstance();
                                          await sp.setString("device", _wifiP2pDevice.writeToJson());
                                          Navigator.of(context).pop();
                                          await Navigator.of(context).push(
                                            MaterialPageRoute(

                                              builder: (context) => TcpSimpleTestPage(
                                                device: _wifiP2pDevice,
                                              ),
                                              // builder: (context) => DeviceConnectionPage(
                                              //   device: _wifiP2pDevice,
                                              // ),
                                            ),
                                          );
                                          // if (ref.read(p2pDeviceAddressProvider) != null) {
                                          //   await ref.read(wifiDirectProvider).socketDisconnect();
                                          //   try {
                                          //     bool? result = await ref
                                          //         .read(wifiDirectProvider)
                                          //         .flutterP2pPlus
                                          //         .cancelConnect(_wifiP2pDevice);
                                          //     print("[cancelConnect] result: $result");
                                          //   } catch (e) {
                                          //     print(e.toString());
                                          //   }
                                          //   ref.read(p2pDeviceConnectionStateProvider.notifier).state = false;
                                          // }
                                          // ref.read(p2pDeviceAddressProvider.notifier).state = null;
                                          // await ref.read(wifiDirectProvider).flutterP2pPlus.stopDiscoverDevices();
                                        },
                                        child: const Text("확인")),
                                  ],
                                ),
                              );
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Lottie.asset(
                                      'assets/lottie/41617-chatbot.json',
                                      height: 240,
                                    ),
                                    Text(
                                      e.deviceName,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      e.deviceAddress,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
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
          ),
        ],
      ),
      floatingActionButton: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final isDiscovered = ref.watch(wifiDiscoveredProvider);

          return FloatingActionButton(
            onPressed: () async {
              if (isDiscovered) {
                await FlutterP2pPlus.instance.stopDiscoverDevices();
              } else {
                await FlutterP2pPlus.instance.discoverDevices();
              }
              ref.read(wifiDiscoveredProvider.notifier).state = !isDiscovered;
            },
            backgroundColor: isDiscovered ? Colors.red : Colors.green,
            child: isDiscovered ? const Icon(Icons.remove) : const Icon(Icons.search),
          );
        },
      ),
    );
  }
}
