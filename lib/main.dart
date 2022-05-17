import 'package:flutter/material.dart';
import 'package:flutter_grpc_demo_app/src/services/permission_api.dart';
import 'package:flutter_grpc_demo_app/src/ui/device_scan_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    requestPermissions();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        useMaterial3: true
      ),
      home: const DeviceScanPage()
    );
  }
}
