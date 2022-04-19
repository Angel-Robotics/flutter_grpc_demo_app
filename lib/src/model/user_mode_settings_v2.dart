import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_mode_settings_v2.freezed.dart';

@freezed
class UserModeSettingsV2 with _$UserModeSettingsV2 {
  factory UserModeSettingsV2({
    int? leftHipExtensionTorqueLevel,
    int? leftHipFlexionTorqueLevel,
    int? rightHipExtensionTorqueLevel,
    int? rightHipFlexionTorqueLevel,
    int? leftKneeExtensionTorqueLevel,
    int? leftKneeFlexionTorqueLevel,
    int? rightKneeExtensionTorqueLevel,
    int? rightKneeFlexionTorqueLevel,
    bool? keepStanding,
    // int? leftSensitivity,
    // int? rightSensitivity,
    // int? leftDuration,
    // int? rightDuration,
    // int? leftStanceSupport,
    // int? rightStanceSupport,
    // bool? terminalSupport,
    // bool? btnControl,

    @Default([10, 10, 10, 10]) List<int> leftTorqueLevel,
    @Default([10, 10, 10, 10]) List<int> rightTorqueLevel,
    @Default([false, false]) List<bool> btnControl,
    @Default([false, false]) List<bool> terminalSupport,
    @Default([0, 0]) List<int> supportDuration,
    @Default([0, 0]) List<int> stanceSupport,
    @Default([2, 2]) List<int> sensitivity,
    double? bpm,
    @Default([0, 0]) List<int> targetHipDegree,
    bool? weightBearing,
    int? controlAlgorithm,

  }) = _UserModeSettingsV2;
}
