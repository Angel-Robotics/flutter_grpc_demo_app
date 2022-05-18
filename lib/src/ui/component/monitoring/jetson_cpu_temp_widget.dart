

import 'package:flutter/material.dart';
import 'package:flutter_grpc_demo_app/src/provider/device_info/device_temperature_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JetsonCpuTempWidget extends ConsumerWidget {
  const JetsonCpuTempWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final cpuTemp = ref.watch(jetsonCpuTemperatureProvider);
    return Text("${cpuTemp}");
  }
}
