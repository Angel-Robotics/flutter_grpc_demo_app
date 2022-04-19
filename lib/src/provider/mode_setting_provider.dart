import 'package:flutter_grpc_demo_app/src/model/user_mode_settings.dart';
import 'package:flutter_grpc_demo_app/src/model/user_mode_settings_v2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final modeSettingProvider = StateNotifierProvider<ModeSettingController, UserModeSettingsV2>(
  (ref) => ModeSettingController(
    UserModeSettingsV2(
      leftHipFlexionTorqueLevel: 10,
      leftHipExtensionTorqueLevel: 10,
      leftKneeExtensionTorqueLevel: 10,
      leftKneeFlexionTorqueLevel: 10,
      rightHipExtensionTorqueLevel: 10,
      rightHipFlexionTorqueLevel: 10,
      rightKneeExtensionTorqueLevel: 10,
      rightKneeFlexionTorqueLevel: 10,
      btnControl: [false, false],
      terminalSupport: [false, false],
      keepStanding: false,
      sensitivity: [3, 3],
      bpm: 0,
      supportDuration: [3, 3],
      stanceSupport: [0, 0],
      controlAlgorithm: 1,
      weightBearing: false,
    ),
  ),
);

class ModeSettingController extends StateNotifier<UserModeSettingsV2> {
  ModeSettingController(super.state);

  void updateLeftHipFlexionTorqueLevel(int i) {
    state = state.copyWith(leftHipFlexionTorqueLevel: i);
  }

  void updateLeftHipExtensionTorqueLevel(int i) {
    state = state.copyWith(leftHipExtensionTorqueLevel: i);
  }

  void updateLeftKneeExtensionTorqueLevel(int i) {
    state = state.copyWith(leftKneeExtensionTorqueLevel: i);
  }

  void updateLeftKneeFlexionTorqueLevel(int i) {
    state = state.copyWith(leftKneeFlexionTorqueLevel: i);
  }

  void updateRightHipFlexionTorqueLevel(int i) {
    state = state.copyWith(rightHipFlexionTorqueLevel: i);
  }

  void updateRightHipExtensionTorqueLevel(int i) {
    state = state.copyWith(rightHipExtensionTorqueLevel: i);
  }

  void updateRightKneeExtensionTorqueLevel(int i) {
    state = state.copyWith(rightKneeExtensionTorqueLevel: i);
  }

  void updateRightKneeFlexionTorqueLevel(int i) {
    state = state.copyWith(rightKneeFlexionTorqueLevel: i);
  }

  void updateTerminalSupport(List<bool> b) {
    state = state.copyWith(terminalSupport: b);
  }

  void updateBtnControl(List<bool> b) {
    state = state.copyWith(btnControl: b);
  }

  void updateKeepStanding(bool b) {
    state = state.copyWith(keepStanding: b);
  }

  void updateBpm(double d) {
    state = state.copyWith(bpm: d);
  }

  void updateSensitivity(List<int> li) {
    state = state.copyWith(sensitivity: li);
  }

  void updateDuration(List<int> li) {
    state = state.copyWith(supportDuration: li);
  }

  void updateStanceSupport(List<int> li) {
    state = state.copyWith(stanceSupport: li);
  }

  void updateTargetHipDegree(List<int> li) {
    state = state.copyWith(targetHipDegree: li);
  }

  void updateControlAlgorithm(int i) {
    state = state.copyWith(controlAlgorithm: i);
  }
}
