

import 'package:flutter/material.dart';
import 'package:flutter_grpc_demo_app/src/ui/component/monitoring/device_tegrastats_widget.dart';
import 'package:flutter_grpc_demo_app/src/ui/component/monitoring/encoder_raw_widget.dart';
import 'package:flutter_grpc_demo_app/src/ui/component/monitoring/jetson_cpu_temp_widget.dart';
import 'package:flutter_grpc_demo_app/src/ui/component/monitoring/jetson_gpu_temp_widget.dart';
import 'package:flutter_grpc_demo_app/src/ui/component/monitoring/joint_state_raw_widget.dart';
import 'package:flutter_grpc_demo_app/src/ui/component/monitoring/robot_battery_state_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataMonitoringPage extends ConsumerWidget {
  const DataMonitoringPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return     Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("데이터 모니터링 "),
        const Text("센서 값(엔코더, IMU) / 족저압 눌림 / 좌표 / 젯슨 온도(시피유, 지피유)"),
        Expanded(
            child: Row(
              children: [
                Expanded(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("엔코더 센서 (RAW)"),
                              EncoderRawWidget(),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("조인트 상태 (RAW)"),
                              JointStateRawWidget(),
                            ],
                          ),
                        )
                      ],
                    )),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("AM 디바이스 모니터링"),
                                Row(
                                  children: const [
                                    Text("CPU 온도: "),
                                    JetsonCpuTempWidget(),
                                    Text("GPU 온도: "),
                                    JetsonGpuTempWidget(),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Text("배터리 상태: "),
                                    RobotBatteryStateWidget(),
                                  ],
                                ),
                                const Divider(),
                                const DeviceTegrastatsWidget(),


                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            )),
      ],
    );
  }
}
