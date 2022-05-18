

import 'package:flutter/material.dart';
import 'package:flutter_grpc_demo_app/src/provider/device_info/device_temperature_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JetsonGpuTempWidget extends ConsumerWidget {
  const JetsonGpuTempWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final gpuTemp = ref.watch(jetsonGpuTemperatureProvider);
    return Text("${gpuTemp}");
  }
}
