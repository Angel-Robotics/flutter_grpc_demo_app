import 'package:flutter_riverpod/flutter_riverpod.dart';

final jetsonCpuTemperatureProvider = StateProvider<double>((ref) => 0);
final jetsonGpuTemperatureProvider = StateProvider<double>((ref) => 0);
