

import 'package:flutter/material.dart';
import 'package:flutter_grpc_demo_app/src/provider/mode_setting_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModeSettingTorqueWidget extends ConsumerWidget {
  const ModeSettingTorqueWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("보조력 - 좌/왼쪽"),
              Row(
                children: [
                  const Text("엉덩관절 굽힘"),
                  Consumer(builder: (context, ref, _) {
                    final ms = ref.watch(modeSettingProvider);
                    return Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Slider(
                              min: 0,
                              max: 20,
                              divisions: 20,
                              value: ms.leftHipFlexionTorqueLevel?.toDouble() ?? 0.0,
                              onChanged: (double value) {
                                ref
                                    .watch(modeSettingProvider.notifier)
                                    .updateLeftHipFlexionTorqueLevel(value.toInt());
                              },
                            ),
                          ),
                          Text("${ms.leftHipFlexionTorqueLevel}")
                        ],
                      ),
                    );
                  }),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text("엉덩관절 폄힘"),
                  Consumer(builder: (context, ref, _) {
                    final ms = ref.watch(modeSettingProvider);
                    return Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Slider(
                              min: 0,
                              max: 20,
                              divisions: 20,
                              value: ms.leftHipExtensionTorqueLevel?.toDouble() ?? 0.0,
                              onChanged: (double value) {
                                ref
                                    .watch(modeSettingProvider.notifier)
                                    .updateLeftHipExtensionTorqueLevel(value.toInt());
                              },
                            ),
                          ),
                          Text("${ms.leftHipExtensionTorqueLevel}")
                        ],
                      ),
                    );
                  }),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  const Text("무릎관절 굽힘"),
                  Consumer(builder: (context, ref, _) {
                    final ms = ref.watch(modeSettingProvider);
                    return Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Slider(
                              min: 0,
                              max: 20,
                              divisions: 20,
                              value: ms.leftKneeFlexionTorqueLevel?.toDouble() ?? 0.0,
                              onChanged: (double value) {
                                ref
                                    .watch(modeSettingProvider.notifier)
                                    .updateLeftKneeFlexionTorqueLevel(value.toInt());
                              },
                            ),
                          ),
                          Text("${ms.leftKneeFlexionTorqueLevel}"),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text("  무릎관절 폄힘"),
                  Consumer(builder: (context, ref, _) {
                    final ms = ref.watch(modeSettingProvider);
                    return Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Slider(
                              min: 0,
                              max: 20,
                              divisions: 20,
                              value: ms.leftKneeExtensionTorqueLevel?.toDouble() ?? 0.0,
                              onChanged: (double value) {
                                ref
                                    .watch(modeSettingProvider.notifier)
                                    .updateLeftKneeExtensionTorqueLevel(value.toInt());
                              },
                            ),
                          ),
                          Text("${ms.leftKneeExtensionTorqueLevel}")
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("보조력 - 우/오른쪽"),
              Row(
                children: [
                  const Text("엉덩관절 굽힘"),
                  Consumer(builder: (context, ref, _) {
                    final ms = ref.watch(modeSettingProvider);
                    return Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Slider(
                              min: 0,
                              max: 20,
                              divisions: 20,
                              value: ms.rightHipFlexionTorqueLevel?.toDouble() ?? 0.0,
                              onChanged: (double value) {
                                ref
                                    .watch(modeSettingProvider.notifier)
                                    .updateRightHipFlexionTorqueLevel(value.toInt());
                              },
                            ),
                          ),
                          Text("${ms.rightHipFlexionTorqueLevel}")
                        ],
                      ),
                    );
                  }),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text("엉덩관절 폄힘"),
                  Consumer(builder: (context, ref, _) {
                    final ms = ref.watch(modeSettingProvider);
                    return Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Slider(
                              min: 0,
                              max: 20,
                              divisions: 20,
                              value: ms.rightHipExtensionTorqueLevel?.toDouble() ?? 0.0,
                              onChanged: (double value) {
                                ref
                                    .watch(modeSettingProvider.notifier)
                                    .updateRightHipExtensionTorqueLevel(value.toInt());
                              },
                            ),
                          ),
                          Text("${ms.rightHipExtensionTorqueLevel}")
                        ],
                      ),
                    );
                  }),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  const Text("무릎관절 굽힘"),
                  Consumer(builder: (context, ref, _) {
                    final ms = ref.watch(modeSettingProvider);
                    return Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Slider(
                              min: 0,
                              max: 20,
                              divisions: 20,
                              value: ms.rightKneeFlexionTorqueLevel?.toDouble() ?? 0.0,
                              onChanged: (double value) {
                                ref
                                    .watch(modeSettingProvider.notifier)
                                    .updateRightKneeFlexionTorqueLevel(value.toInt());
                              },
                            ),
                          ),
                          Text("${ms.rightKneeFlexionTorqueLevel}")
                        ],
                      ),
                    );
                  }),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text("  무릎관절 폄힘"),
                  Consumer(builder: (context, ref, _) {
                    final ms = ref.watch(modeSettingProvider);
                    return Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Slider(
                              min: 0,
                              max: 20,
                              divisions: 20,
                              value: ms.rightKneeExtensionTorqueLevel?.toDouble() ?? 0.0,
                              onChanged: (double value) {
                                ref.watch(modeSettingProvider.notifier).updateRightKneeExtensionTorqueLevel(
                                  value.toInt(),
                                );
                              },
                            ),
                          ),
                          Text("${ms.rightKneeExtensionTorqueLevel}")
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
