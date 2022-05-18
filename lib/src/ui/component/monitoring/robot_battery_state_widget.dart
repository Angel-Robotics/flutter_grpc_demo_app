import 'package:flutter/material.dart';
import 'package:flutter_grpc_demo_app/src/provider/device_battery_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RobotBatteryStateWidget extends ConsumerWidget {
  const RobotBatteryStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final battState = ref.watch(deviceBatteryProvider);
    return Text("${battState.percentage?.toStringAsFixed(3)} %");
  }
}
