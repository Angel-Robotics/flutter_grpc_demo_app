import 'package:flutter/material.dart';
import 'package:flutter_grpc_demo_app/src/protos/helloworld.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class GrpcSimpleTestPage extends StatefulWidget {
  const GrpcSimpleTestPage({Key? key}) : super(key: key);

  @override
  State<GrpcSimpleTestPage> createState() => _GrpcSimpleTestPageState();
}

class _GrpcSimpleTestPageState extends State<GrpcSimpleTestPage> {
  ClientChannel? channel;
  GreeterClient? stub;

  Future sendSayHello(String args) async {
    final name = args.isNotEmpty ? args[0] : 'world';

    try {
      final response = await stub?.sayHello(
        HelloRequest()..name = name,
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
    channel = ClientChannel(
      '192.168.15.240',
      port: 50051,
      options: ChannelOptions(
        credentials: const ChannelCredentials.insecure(),
        codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
      ),
    );

    stub = GreeterClient(channel!);
  }

  @override
  void dispose() {
    // TODO: implement dispose

    channel?.shutdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grpc Simple Test Page"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                sendSayHello("hey");
              },
              child: Text("Say Hello"))
        ],
      ),
    );
  }
}
