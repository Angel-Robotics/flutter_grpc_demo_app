///
//  Generated code. Do not modify.
//  source: mobile_transceiver.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'mobile_transceiver.pbenum.dart';

export 'mobile_transceiver.pbenum.dart';

class RobotControl extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RobotControl', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mobile_transceiver'), createEmptyInstance: create)
    ..e<EnumRobotControl>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'robotControl', $pb.PbFieldType.OE, protoName: 'robotControl', defaultOrMaker: EnumRobotControl.IDLE, valueOf: EnumRobotControl.valueOf, enumValues: EnumRobotControl.values)
    ..hasRequiredFields = false
  ;

  RobotControl._() : super();
  factory RobotControl({
    EnumRobotControl? robotControl,
  }) {
    final _result = create();
    if (robotControl != null) {
      _result.robotControl = robotControl;
    }
    return _result;
  }
  factory RobotControl.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RobotControl.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RobotControl clone() => RobotControl()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RobotControl copyWith(void Function(RobotControl) updates) => super.copyWith((message) => updates(message as RobotControl)) as RobotControl; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RobotControl create() => RobotControl._();
  RobotControl createEmptyInstance() => create();
  static $pb.PbList<RobotControl> createRepeated() => $pb.PbList<RobotControl>();
  @$core.pragma('dart2js:noInline')
  static RobotControl getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RobotControl>(create);
  static RobotControl? _defaultInstance;

  @$pb.TagNumber(1)
  EnumRobotControl get robotControl => $_getN(0);
  @$pb.TagNumber(1)
  set robotControl(EnumRobotControl v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRobotControl() => $_has(0);
  @$pb.TagNumber(1)
  void clearRobotControl() => clearField(1);
}

class ModeBlock extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ModeBlock', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mobile_transceiver'), createEmptyInstance: create)
    ..e<EnumMode>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mode', $pb.PbFieldType.OE, defaultOrMaker: EnumMode.MODE_SIT, valueOf: EnumMode.valueOf, enumValues: EnumMode.values)
    ..hasRequiredFields = false
  ;

  ModeBlock._() : super();
  factory ModeBlock({
    EnumMode? mode,
  }) {
    final _result = create();
    if (mode != null) {
      _result.mode = mode;
    }
    return _result;
  }
  factory ModeBlock.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ModeBlock.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ModeBlock clone() => ModeBlock()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ModeBlock copyWith(void Function(ModeBlock) updates) => super.copyWith((message) => updates(message as ModeBlock)) as ModeBlock; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ModeBlock create() => ModeBlock._();
  ModeBlock createEmptyInstance() => create();
  static $pb.PbList<ModeBlock> createRepeated() => $pb.PbList<ModeBlock>();
  @$core.pragma('dart2js:noInline')
  static ModeBlock getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ModeBlock>(create);
  static ModeBlock? _defaultInstance;

  @$pb.TagNumber(1)
  EnumMode get mode => $_getN(0);
  @$pb.TagNumber(1)
  set mode(EnumMode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMode() => $_has(0);
  @$pb.TagNumber(1)
  void clearMode() => clearField(1);
}

class MsgSystemOpMode extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgSystemOpMode', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mobile_transceiver'), createEmptyInstance: create)
    ..e<SystemOperationMode>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mode', $pb.PbFieldType.OE, defaultOrMaker: SystemOperationMode.NORMAL, valueOf: SystemOperationMode.valueOf, enumValues: SystemOperationMode.values)
    ..hasRequiredFields = false
  ;

  MsgSystemOpMode._() : super();
  factory MsgSystemOpMode({
    SystemOperationMode? mode,
  }) {
    final _result = create();
    if (mode != null) {
      _result.mode = mode;
    }
    return _result;
  }
  factory MsgSystemOpMode.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgSystemOpMode.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgSystemOpMode clone() => MsgSystemOpMode()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgSystemOpMode copyWith(void Function(MsgSystemOpMode) updates) => super.copyWith((message) => updates(message as MsgSystemOpMode)) as MsgSystemOpMode; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgSystemOpMode create() => MsgSystemOpMode._();
  MsgSystemOpMode createEmptyInstance() => create();
  static $pb.PbList<MsgSystemOpMode> createRepeated() => $pb.PbList<MsgSystemOpMode>();
  @$core.pragma('dart2js:noInline')
  static MsgSystemOpMode getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgSystemOpMode>(create);
  static MsgSystemOpMode? _defaultInstance;

  @$pb.TagNumber(1)
  SystemOperationMode get mode => $_getN(0);
  @$pb.TagNumber(1)
  set mode(SystemOperationMode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMode() => $_has(0);
  @$pb.TagNumber(1)
  void clearMode() => clearField(1);
}

class MsgModeSettings extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgModeSettings', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mobile_transceiver'), createEmptyInstance: create)
    ..e<EnumMode>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mode', $pb.PbFieldType.OE, defaultOrMaker: EnumMode.MODE_SIT, valueOf: EnumMode.valueOf, enumValues: EnumMode.values)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'opControlAlgorithm', $pb.PbFieldType.O3)
    ..p<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'leftTorqueLevel', $pb.PbFieldType.PU3)
    ..p<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rightTorqueLevel', $pb.PbFieldType.PU3)
    ..p<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'supportDuration', $pb.PbFieldType.PU3)
    ..p<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sensitivity', $pb.PbFieldType.PU3)
    ..p<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stanceSupport', $pb.PbFieldType.PU3)
    ..p<$core.bool>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'terminalSupport', $pb.PbFieldType.PB)
    ..p<$core.bool>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buttonControl', $pb.PbFieldType.PB)
    ..p<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'aimHipAngle', $pb.PbFieldType.PS3)
    ..aOB(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'keepStandingSupport')
    ..aOB(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'weightBearing')
    ..a<$core.int>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bpm', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  MsgModeSettings._() : super();
  factory MsgModeSettings({
    EnumMode? mode,
    $core.int? opControlAlgorithm,
    $core.Iterable<$core.int>? leftTorqueLevel,
    $core.Iterable<$core.int>? rightTorqueLevel,
    $core.Iterable<$core.int>? supportDuration,
    $core.Iterable<$core.int>? sensitivity,
    $core.Iterable<$core.int>? stanceSupport,
    $core.Iterable<$core.bool>? terminalSupport,
    $core.Iterable<$core.bool>? buttonControl,
    $core.Iterable<$core.int>? aimHipAngle,
    $core.bool? keepStandingSupport,
    $core.bool? weightBearing,
    $core.int? bpm,
  }) {
    final _result = create();
    if (mode != null) {
      _result.mode = mode;
    }
    if (opControlAlgorithm != null) {
      _result.opControlAlgorithm = opControlAlgorithm;
    }
    if (leftTorqueLevel != null) {
      _result.leftTorqueLevel.addAll(leftTorqueLevel);
    }
    if (rightTorqueLevel != null) {
      _result.rightTorqueLevel.addAll(rightTorqueLevel);
    }
    if (supportDuration != null) {
      _result.supportDuration.addAll(supportDuration);
    }
    if (sensitivity != null) {
      _result.sensitivity.addAll(sensitivity);
    }
    if (stanceSupport != null) {
      _result.stanceSupport.addAll(stanceSupport);
    }
    if (terminalSupport != null) {
      _result.terminalSupport.addAll(terminalSupport);
    }
    if (buttonControl != null) {
      _result.buttonControl.addAll(buttonControl);
    }
    if (aimHipAngle != null) {
      _result.aimHipAngle.addAll(aimHipAngle);
    }
    if (keepStandingSupport != null) {
      _result.keepStandingSupport = keepStandingSupport;
    }
    if (weightBearing != null) {
      _result.weightBearing = weightBearing;
    }
    if (bpm != null) {
      _result.bpm = bpm;
    }
    return _result;
  }
  factory MsgModeSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgModeSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgModeSettings clone() => MsgModeSettings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgModeSettings copyWith(void Function(MsgModeSettings) updates) => super.copyWith((message) => updates(message as MsgModeSettings)) as MsgModeSettings; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgModeSettings create() => MsgModeSettings._();
  MsgModeSettings createEmptyInstance() => create();
  static $pb.PbList<MsgModeSettings> createRepeated() => $pb.PbList<MsgModeSettings>();
  @$core.pragma('dart2js:noInline')
  static MsgModeSettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgModeSettings>(create);
  static MsgModeSettings? _defaultInstance;

  @$pb.TagNumber(1)
  EnumMode get mode => $_getN(0);
  @$pb.TagNumber(1)
  set mode(EnumMode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMode() => $_has(0);
  @$pb.TagNumber(1)
  void clearMode() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get opControlAlgorithm => $_getIZ(1);
  @$pb.TagNumber(2)
  set opControlAlgorithm($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOpControlAlgorithm() => $_has(1);
  @$pb.TagNumber(2)
  void clearOpControlAlgorithm() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get leftTorqueLevel => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get rightTorqueLevel => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$core.int> get supportDuration => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$core.int> get sensitivity => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$core.int> get stanceSupport => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$core.bool> get terminalSupport => $_getList(7);

  @$pb.TagNumber(9)
  $core.List<$core.bool> get buttonControl => $_getList(8);

  @$pb.TagNumber(10)
  $core.List<$core.int> get aimHipAngle => $_getList(9);

  @$pb.TagNumber(11)
  $core.bool get keepStandingSupport => $_getBF(10);
  @$pb.TagNumber(11)
  set keepStandingSupport($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasKeepStandingSupport() => $_has(10);
  @$pb.TagNumber(11)
  void clearKeepStandingSupport() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get weightBearing => $_getBF(11);
  @$pb.TagNumber(12)
  set weightBearing($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasWeightBearing() => $_has(11);
  @$pb.TagNumber(12)
  void clearWeightBearing() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get bpm => $_getIZ(12);
  @$pb.TagNumber(13)
  set bpm($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasBpm() => $_has(12);
  @$pb.TagNumber(13)
  void clearBpm() => clearField(13);
}

class MsgRhythmPlayControl extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgRhythmPlayControl', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mobile_transceiver'), createEmptyInstance: create)
    ..e<RhythmControl>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rhythmControl', $pb.PbFieldType.OE, protoName: 'rhythmControl', defaultOrMaker: RhythmControl.PLAY_IDLE, valueOf: RhythmControl.valueOf, enumValues: RhythmControl.values)
    ..hasRequiredFields = false
  ;

  MsgRhythmPlayControl._() : super();
  factory MsgRhythmPlayControl({
    RhythmControl? rhythmControl,
  }) {
    final _result = create();
    if (rhythmControl != null) {
      _result.rhythmControl = rhythmControl;
    }
    return _result;
  }
  factory MsgRhythmPlayControl.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgRhythmPlayControl.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgRhythmPlayControl clone() => MsgRhythmPlayControl()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgRhythmPlayControl copyWith(void Function(MsgRhythmPlayControl) updates) => super.copyWith((message) => updates(message as MsgRhythmPlayControl)) as MsgRhythmPlayControl; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgRhythmPlayControl create() => MsgRhythmPlayControl._();
  MsgRhythmPlayControl createEmptyInstance() => create();
  static $pb.PbList<MsgRhythmPlayControl> createRepeated() => $pb.PbList<MsgRhythmPlayControl>();
  @$core.pragma('dart2js:noInline')
  static MsgRhythmPlayControl getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgRhythmPlayControl>(create);
  static MsgRhythmPlayControl? _defaultInstance;

  @$pb.TagNumber(1)
  RhythmControl get rhythmControl => $_getN(0);
  @$pb.TagNumber(1)
  set rhythmControl(RhythmControl v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRhythmControl() => $_has(0);
  @$pb.TagNumber(1)
  void clearRhythmControl() => clearField(1);
}

class MsgRobotSize extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgRobotSize', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mobile_transceiver'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'leftThighLength', $pb.PbFieldType.O3, protoName: 'leftThighLength')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'leftShankLength', $pb.PbFieldType.O3, protoName: 'leftShankLength')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rightThighLength', $pb.PbFieldType.O3, protoName: 'rightThighLength')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rightShankLength', $pb.PbFieldType.O3, protoName: 'rightShankLength')
    ..hasRequiredFields = false
  ;

  MsgRobotSize._() : super();
  factory MsgRobotSize({
    $core.int? leftThighLength,
    $core.int? leftShankLength,
    $core.int? rightThighLength,
    $core.int? rightShankLength,
  }) {
    final _result = create();
    if (leftThighLength != null) {
      _result.leftThighLength = leftThighLength;
    }
    if (leftShankLength != null) {
      _result.leftShankLength = leftShankLength;
    }
    if (rightThighLength != null) {
      _result.rightThighLength = rightThighLength;
    }
    if (rightShankLength != null) {
      _result.rightShankLength = rightShankLength;
    }
    return _result;
  }
  factory MsgRobotSize.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgRobotSize.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgRobotSize clone() => MsgRobotSize()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgRobotSize copyWith(void Function(MsgRobotSize) updates) => super.copyWith((message) => updates(message as MsgRobotSize)) as MsgRobotSize; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgRobotSize create() => MsgRobotSize._();
  MsgRobotSize createEmptyInstance() => create();
  static $pb.PbList<MsgRobotSize> createRepeated() => $pb.PbList<MsgRobotSize>();
  @$core.pragma('dart2js:noInline')
  static MsgRobotSize getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgRobotSize>(create);
  static MsgRobotSize? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get leftThighLength => $_getIZ(0);
  @$pb.TagNumber(1)
  set leftThighLength($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLeftThighLength() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeftThighLength() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get leftShankLength => $_getIZ(1);
  @$pb.TagNumber(2)
  set leftShankLength($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLeftShankLength() => $_has(1);
  @$pb.TagNumber(2)
  void clearLeftShankLength() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get rightThighLength => $_getIZ(2);
  @$pb.TagNumber(3)
  set rightThighLength($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRightThighLength() => $_has(2);
  @$pb.TagNumber(3)
  void clearRightThighLength() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get rightShankLength => $_getIZ(3);
  @$pb.TagNumber(4)
  set rightShankLength($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRightShankLength() => $_has(3);
  @$pb.TagNumber(4)
  void clearRightShankLength() => clearField(4);
}

class HelloRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HelloRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mobile_transceiver'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  HelloRequest._() : super();
  factory HelloRequest({
    $core.String? name,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory HelloRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HelloRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HelloRequest clone() => HelloRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HelloRequest copyWith(void Function(HelloRequest) updates) => super.copyWith((message) => updates(message as HelloRequest)) as HelloRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HelloRequest create() => HelloRequest._();
  HelloRequest createEmptyInstance() => create();
  static $pb.PbList<HelloRequest> createRepeated() => $pb.PbList<HelloRequest>();
  @$core.pragma('dart2js:noInline')
  static HelloRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HelloRequest>(create);
  static HelloRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class HelloReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HelloReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mobile_transceiver'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  HelloReply._() : super();
  factory HelloReply({
    $core.String? message,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory HelloReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HelloReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HelloReply clone() => HelloReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HelloReply copyWith(void Function(HelloReply) updates) => super.copyWith((message) => updates(message as HelloReply)) as HelloReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HelloReply create() => HelloReply._();
  HelloReply createEmptyInstance() => create();
  static $pb.PbList<HelloReply> createRepeated() => $pb.PbList<HelloReply>();
  @$core.pragma('dart2js:noInline')
  static HelloReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HelloReply>(create);
  static HelloReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

