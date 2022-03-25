///
//  Generated code. Do not modify.
//  source: mobile_transceiver.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class EnumRobotControl extends $pb.ProtobufEnum {
  static const EnumRobotControl IDLE = EnumRobotControl._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IDLE');
  static const EnumRobotControl MODE_START = EnumRobotControl._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MODE_START');
  static const EnumRobotControl MODE_PAUSE = EnumRobotControl._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MODE_PAUSE');
  static const EnumRobotControl MODE_STOP = EnumRobotControl._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MODE_STOP');
  static const EnumRobotControl FORCE_STOP = EnumRobotControl._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FORCE_STOP');

  static const $core.List<EnumRobotControl> values = <EnumRobotControl> [
    IDLE,
    MODE_START,
    MODE_PAUSE,
    MODE_STOP,
    FORCE_STOP,
  ];

  static final $core.Map<$core.int, EnumRobotControl> _byValue = $pb.ProtobufEnum.initByValue(values);
  static EnumRobotControl? valueOf($core.int value) => _byValue[value];

  const EnumRobotControl._($core.int v, $core.String n) : super(v, n);
}

class EnumMode extends $pb.ProtobufEnum {
  static const EnumMode MODE_SIT = EnumMode._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MODE_SIT');
  static const EnumMode MODE_STAND = EnumMode._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MODE_STAND');
  static const EnumMode MODE_STANDING = EnumMode._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MODE_STANDING');
  static const EnumMode MODE_LEVEL_WALKING = EnumMode._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MODE_LEVEL_WALKING');
  static const EnumMode MODE_STAIRS = EnumMode._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MODE_STAIRS');
  static const EnumMode MODE_SQUAT = EnumMode._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MODE_SQUAT');

  static const $core.List<EnumMode> values = <EnumMode> [
    MODE_SIT,
    MODE_STAND,
    MODE_STANDING,
    MODE_LEVEL_WALKING,
    MODE_STAIRS,
    MODE_SQUAT,
  ];

  static final $core.Map<$core.int, EnumMode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static EnumMode? valueOf($core.int value) => _byValue[value];

  const EnumMode._($core.int v, $core.String n) : super(v, n);
}

