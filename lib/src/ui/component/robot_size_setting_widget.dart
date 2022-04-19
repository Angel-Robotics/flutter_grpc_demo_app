import 'package:flutter/material.dart';
import 'package:flutter_grpc_demo_app/src/provider/robot_size_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RobotSizeSettingWidget extends ConsumerWidget {
  const RobotSizeSettingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text("좌 허벅지 길이"),
            // Expanded(child: Slider())
            const SizedBox(
              width: 16,
            ),
            Consumer(builder: (context, ref, _) {
              final rs = ref.watch(robotSizeProvider);
              return Expanded(
                child: Slider(
                  value: rs.lh?.toDouble() ?? 0.0,
                  onChanged: (double value) {
                    ref.watch(robotSizeProvider.notifier).updateLh(value.toInt());
                  },
                  min: 320,
                  max: 460,
                ),
              );
            }),
            Consumer(builder: (context, ref, _) {
              final rs = ref.watch(robotSizeProvider);
              return Text("${rs.lh}");
            })
          ],
        ),
        Row(
          children: [
            const Text("우 허벅지 길이"),
            // Expanded(child: Slider())
            const SizedBox(
              width: 16,
            ),
            Consumer(builder: (context, ref, _) {
              final rs = ref.watch(robotSizeProvider);
              return Expanded(
                child: Slider(
                  value: rs.rh?.toDouble() ?? 0.0,
                  onChanged: (double value) {
                    ref.watch(robotSizeProvider.notifier).updateRh(value.toInt());
                  },
                  min: 320,
                  max: 460,
                ),
              );
            }),
            Consumer(builder: (context, ref, _) {
              final rs = ref.watch(robotSizeProvider);
              return Text("${rs.rh}");
            })
          ],
        ),
        Row(
          children: [
            const Text("좌 종아리 길이"),
            // Expanded(child: Slider())
            const SizedBox(
              width: 16,
            ),
            Consumer(builder: (context, ref, _) {
              final rs = ref.watch(robotSizeProvider);
              return Expanded(
                child: Slider(
                  value: rs.lk?.toDouble() ?? 0.0,
                  onChanged: (double value) {
                    ref.watch(robotSizeProvider.notifier).updateLk(value.toInt());
                  },
                  min: 320,
                  max: 460,
                ),
              );
            }),
            Consumer(builder: (context, ref, _) {
              final rs = ref.watch(robotSizeProvider);
              return Text("${rs.lk}");
            })
          ],
        ),
        Row(
          children: [
            const Text("우 종아리 길이"),
            // Expanded(child: Slider())
            const SizedBox(
              width: 16,
            ),
            Consumer(builder: (context, ref, _) {
              final rs = ref.watch(robotSizeProvider);
              return Expanded(
                child: Slider(
                  value: rs.rk?.toDouble() ?? 0.0,
                  onChanged: (double value) {
                    ref.watch(robotSizeProvider.notifier).updateRk(value.toInt());
                  },
                  min: 320,
                  max: 460,
                ),
              );
            }),
            Consumer(builder: (context, ref, _) {
              final rs = ref.watch(robotSizeProvider);
              return Text("${rs.rk}");
            })
          ],
        ),

      ],
    );
  }
}
