import 'package:flutter_grpc_demo_app/src/model/robot_size.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final robotSizeProvider = StateNotifierProvider<RobotSizeController, RobotSize>((ref) => RobotSizeController(
      RobotSize(lh: 380, rh: 380, lk: 420, rk: 420),
    ));

class RobotSizeController extends StateNotifier<RobotSize> {
  RobotSizeController(super.state);

  updateLh(int i) {
    state = state.copyWith(lh: i);
  }
  updateLk(int i) {
    state = state.copyWith(lk: i);
  }
  updateRh(int i) {
    state = state.copyWith(rh: i);
  }
  updateRk(int i) {
    state = state.copyWith(rk: i);
  }
}
