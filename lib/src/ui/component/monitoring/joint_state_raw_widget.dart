import 'package:flutter/material.dart';
import 'package:flutter_grpc_demo_app/src/provider/encoder_raw_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JointStateRawWidget extends ConsumerWidget {
  const JointStateRawWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final encoderRaw = ref.watch(jointStateRawProvider);
    return SizedBox(
      height: 160,
      child: ListView.builder(
        itemCount: encoderRaw.name?.length,
        itemBuilder: (context, index) {
          var nameItem = encoderRaw.name;
          // print(encoderRaw.data?[index]);
          return Row(
            children: [
              Text(
                "${encoderRaw.header?.stamp?.sec}: ${encoderRaw.header?.stamp?.nanosec}",
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                "| ${encoderRaw.name?[index]}: ",
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                "| velocity: ${encoderRaw.velocity?[index]} | ",
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                "| position: ${encoderRaw.position?[index]} | ",
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                "| effort: ${encoderRaw.effort?[index]} ",
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
