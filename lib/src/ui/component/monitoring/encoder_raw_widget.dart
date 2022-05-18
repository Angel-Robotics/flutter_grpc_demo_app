import 'package:flutter/material.dart';
import 'package:flutter_grpc_demo_app/src/provider/encoder_raw_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EncoderRawWidget extends ConsumerWidget {
  const EncoderRawWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final encoderRaw = ref.watch(encoderRawProvider);

    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: encoderRaw.layout.dim?.length,
        itemBuilder: (context, index) {
          var item = encoderRaw.layout.dim;
          // print(encoderRaw.data?[index]);
          return Text(
            "${item?[index].label} : ${encoderRaw.data?[index]}",
            style: const TextStyle(
              fontSize: 12,
            ),
          );
        },
      ),
    );
  }
}
