import 'package:flutter/material.dart';
import 'package:flutter_grpc_demo_app/src/ui/roslib/ros_lib_dart_test_page.dart';
import 'package:flutter_grpc_demo_app/src/ui/tcp_socket/tcp_simple_test_page.dart';
import 'package:flutter_p2p_plus/protos/protos.pb.dart';

class ProgramHomePage extends StatefulWidget {
  WifiP2pDevice device;

  ProgramHomePage({
    super.key,
    required this.device,
  });

  @override
  State<ProgramHomePage> createState() => _ProgramSelectPageState();
}

class _ProgramSelectPageState extends State<ProgramHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("테스트 프로그램"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TcpSimpleTestPage(
                        device: widget.device,
                      ),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4,
                    child: Center(
                      child: Text("Older Test Method"),
                    ),
                  ),
                ),
              ),
            ),
             Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async{
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RosLibDartTestPage(
                          device: widget.device,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    child: Center(
                      child: Text("ROS LIB"),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
