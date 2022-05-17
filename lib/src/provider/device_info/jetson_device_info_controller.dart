

import 'package:flutter_grpc_demo_app/src/model/jetson_device_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final jetsonDeviceInfoProvider = StateProvider<JetsonDeviceInfo?>((ref) => JetsonDeviceInfo());