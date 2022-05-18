import 'package:flutter_grpc_demo_app/src/model/sensor_msg/battery_state_msg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deviceBatteryProvider = StateProvider<BatteryStateMsg>(
  (ref) => BatteryStateMsg(),
);
