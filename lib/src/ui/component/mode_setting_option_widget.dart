import 'package:flutter/material.dart';
import 'package:flutter_grpc_demo_app/src/provider/mode_setting_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModeSettingOptionWidget extends ConsumerWidget {
  const ModeSettingOptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer(builder: (context, ref, _) {
            final ums = ref.watch(modeSettingProvider);
            return SwitchListTile(
                title: const Text("유각기 말기(좌)"),
                value: ums.terminalSupport[0],
                onChanged: (b) {
                  ref.watch(modeSettingProvider.notifier).updateTerminalSupport([b, ums.terminalSupport[1]]);
                });
          }),
          const Divider(),
          Consumer(builder: (context, ref, _) {
            final ums = ref.watch(modeSettingProvider);
            return SwitchListTile(
                title: const Text("유각기 말기(우)"),
                value: ums.terminalSupport[1],
                onChanged: (b) {
                  ref.watch(modeSettingProvider.notifier).updateTerminalSupport([ums.terminalSupport[0], b]);
                });
          }),
          const Divider(),
          Consumer(builder: (context, ref, _) {
            final ums = ref.watch(modeSettingProvider);
            return SwitchListTile(
                title: const Text("가이드 조작(좌)"),
                value: ums.btnControl[0],
                onChanged: (b) {
                  ref.watch(modeSettingProvider.notifier).updateBtnControl([b, ums.btnControl[1]]);
                });
          }),
          const Divider(),
          Consumer(builder: (context, ref, _) {
            final ums = ref.watch(modeSettingProvider);
            return SwitchListTile(
                title: const Text("가이드 조작(우)"),
                value: ums.btnControl[1],
                onChanged: (b) {
                  ref.watch(modeSettingProvider.notifier).updateBtnControl([ums.btnControl[0], b]);
                });
          }),
          const Divider(),
          Consumer(builder: (context, ref, _) {
            final ums = ref.watch(modeSettingProvider);
            return SwitchListTile(
                title: const Text("일어서기 후 힘 유지"),
                value: ums.keepStanding ?? false,
                onChanged: (b) {
                  ref.watch(modeSettingProvider.notifier).updateKeepStanding(b);
                });
          }),
          const Divider(),
          Consumer(builder: (context, ref, _) {
            final ums = ref.watch(modeSettingProvider);
            return Row(
              children: [
                const Text("리듬청각자극 훈련 - BPM"),
                Expanded(
                  child: Slider(
                      min: 0,
                      max: 140,
                      value: ums.bpm ?? 40.0,
                      onChanged: (d) {
                        ref.watch(modeSettingProvider.notifier).updateBpm(d);
                      }),
                ),
              ],
            );
          }),
          const Divider(
            color: Colors.black,
          ),
          Consumer(builder: (context, ref, _) {
            final ums = ref.watch(modeSettingProvider);
            return Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("왼쪽 민감도"),
                      ...List.generate(
                        5,
                        (index) => RadioListTile<int>(
                          value: index,
                          title: Text("$index"),
                          groupValue: ums.sensitivity[0],
                          onChanged: (i) {
                            ref.watch(modeSettingProvider.notifier).updateSensitivity([i ?? 0, ums.sensitivity[1]]);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("오른쪽 민감도"),
                      ...List.generate(
                        5,
                        (index) => RadioListTile<int>(
                          value: index,
                          title: Text("$index"),
                          groupValue: ums.sensitivity[1],
                          onChanged: (i) {
                            ref.watch(modeSettingProvider.notifier).updateSensitivity([
                              ums.sensitivity[0],
                              i ?? 0,
                            ]);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
          const Divider(
            color: Colors.black,
          ),
          Consumer(builder: (context, ref, _) {
            final ums = ref.watch(modeSettingProvider);
            return Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("왼쪽 보조력 유지시간"),
                      ...List.generate(
                        5,
                        (index) => RadioListTile<int>(
                          value: index,
                          title: Text("$index"),
                          groupValue: ums.supportDuration[0],
                          onChanged: (i) {
                            ref.watch(modeSettingProvider.notifier).updateDuration([i ?? 0, ums.supportDuration[1]]);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("오른쪽 보조력 유지시간"),
                      ...List.generate(
                        5,
                        (index) => RadioListTile<int>(
                          value: index,
                          title: Text("$index"),
                          groupValue: ums.supportDuration[1],
                          onChanged: (i) {
                            ref.watch(modeSettingProvider.notifier).updateDuration([
                              ums.supportDuration[0],
                              i ?? 0,
                            ]);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
          const Divider(
            color: Colors.black,
          ),
          Consumer(builder: (context, ref, _) {
            final ums = ref.watch(modeSettingProvider);
            return Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("왼쪽 입각기 굽힘 방지"),
                      ...List.generate(
                        5,
                        (index) => RadioListTile<int>(
                          value: index,
                          title: Text("$index"),
                          groupValue: ums.stanceSupport[0],
                          onChanged: (i) {
                            ref.watch(modeSettingProvider.notifier).updateStanceSupport([i ?? 0, ums.stanceSupport[1]]);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("오른쪽 입각기 굽힘 방지"),
                      ...List.generate(
                        5,
                        (index) => RadioListTile<int>(
                          value: index,
                          title: Text("$index"),
                          groupValue: ums.stanceSupport[1],
                          onChanged: (i) {
                            ref.watch(modeSettingProvider.notifier).updateStanceSupport([
                              ums.stanceSupport[0],
                              i ?? 0,
                            ]);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
          const Divider(
            color: Colors.black,
          ),
          Consumer(builder: (context, ref, _) {
            final ums = ref.watch(modeSettingProvider);
            return Column(
              children: [
                Row(
                  children: [
                    const Text("왼쪽 Hip 목표각도"),
                    Expanded(
                      child: Slider(
                        min: -100,
                        max: 100,
                        value: ums.targetHipDegree[0].toDouble(),
                        onChanged: (d) {
                          ref.watch(modeSettingProvider.notifier).updateTargetHipDegree([
                            d.toInt(),
                            ums.targetHipDegree[1].toInt(),
                          ]);
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("오른쪽 Hip 목표 각도"),
                    Expanded(
                      child: Slider(
                        min: -100,
                        max: 100,
                        value: ums.targetHipDegree[1].toDouble(),
                        onChanged: (d) {
                          ref.watch(modeSettingProvider.notifier).updateTargetHipDegree([
                            ums.targetHipDegree[0].toInt(),
                            d.toInt(),
                          ]);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
          const Divider(
            color: Colors.black,
          ),
          Consumer(builder: (context, ref, _) {
            final ums = ref.watch(modeSettingProvider);
            return Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("제어 알고리즘"),
                      ...List.generate(
                        3,
                        (index) => RadioListTile<int>(
                          value: index,
                          title: Text("$index"),
                          groupValue: ums.controlAlgorithm,
                          onChanged: (i) {
                            ref.watch(modeSettingProvider.notifier).updateControlAlgorithm(i ?? 0);
                          },
                        ),
                      )
                    ],
                  ),
                ),

              ],
            );
          }),
        ],
      ),
    );
  }
}
