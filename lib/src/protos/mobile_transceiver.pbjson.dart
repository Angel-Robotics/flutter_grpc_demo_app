///
//  Generated code. Do not modify.
//  source: mobile_transceiver.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use systemOperationModeDescriptor instead')
const SystemOperationMode$json = const {
  '1': 'SystemOperationMode',
  '2': const [
    const {'1': 'NORMAL', '2': 0},
    const {'1': 'DEBUG', '2': 1},
    const {'1': 'TEST', '2': 2},
  ],
};

/// Descriptor for `SystemOperationMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List systemOperationModeDescriptor = $convert.base64Decode('ChNTeXN0ZW1PcGVyYXRpb25Nb2RlEgoKBk5PUk1BTBAAEgkKBURFQlVHEAESCAoEVEVTVBAC');
@$core.Deprecated('Use enumRobotControlDescriptor instead')
const EnumRobotControl$json = const {
  '1': 'EnumRobotControl',
  '2': const [
    const {'1': 'IDLE', '2': 0},
    const {'1': 'MODE_START', '2': 1},
    const {'1': 'MODE_PAUSE', '2': 2},
    const {'1': 'MODE_STOP', '2': 3},
    const {'1': 'FORCE_STOP', '2': 4},
  ],
};

/// Descriptor for `EnumRobotControl`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List enumRobotControlDescriptor = $convert.base64Decode('ChBFbnVtUm9ib3RDb250cm9sEggKBElETEUQABIOCgpNT0RFX1NUQVJUEAESDgoKTU9ERV9QQVVTRRACEg0KCU1PREVfU1RPUBADEg4KCkZPUkNFX1NUT1AQBA==');
@$core.Deprecated('Use enumModeDescriptor instead')
const EnumMode$json = const {
  '1': 'EnumMode',
  '2': const [
    const {'1': 'MODE_SIT', '2': 0},
    const {'1': 'MODE_STAND', '2': 1},
    const {'1': 'MODE_STANDING', '2': 2},
    const {'1': 'MODE_LEVEL_WALKING', '2': 3},
    const {'1': 'MODE_STAIRS', '2': 4},
    const {'1': 'MODE_SQUAT', '2': 5},
  ],
};

/// Descriptor for `EnumMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List enumModeDescriptor = $convert.base64Decode('CghFbnVtTW9kZRIMCghNT0RFX1NJVBAAEg4KCk1PREVfU1RBTkQQARIRCg1NT0RFX1NUQU5ESU5HEAISFgoSTU9ERV9MRVZFTF9XQUxLSU5HEAMSDwoLTU9ERV9TVEFJUlMQBBIOCgpNT0RFX1NRVUFUEAU=');
@$core.Deprecated('Use rhythmControlDescriptor instead')
const RhythmControl$json = const {
  '1': 'RhythmControl',
  '2': const [
    const {'1': 'PLAY_IDLE', '2': 0},
    const {'1': 'PLAY_START', '2': 1},
    const {'1': 'PLAY_PAUSE', '2': 2},
    const {'1': 'PLAY_STOP', '2': 3},
  ],
};

/// Descriptor for `RhythmControl`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List rhythmControlDescriptor = $convert.base64Decode('Cg1SaHl0aG1Db250cm9sEg0KCVBMQVlfSURMRRAAEg4KClBMQVlfU1RBUlQQARIOCgpQTEFZX1BBVVNFEAISDQoJUExBWV9TVE9QEAM=');
@$core.Deprecated('Use robotControlDescriptor instead')
const RobotControl$json = const {
  '1': 'RobotControl',
  '2': const [
    const {'1': 'robotControl', '3': 1, '4': 1, '5': 14, '6': '.mobile_transceiver.EnumRobotControl', '10': 'robotControl'},
  ],
};

/// Descriptor for `RobotControl`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List robotControlDescriptor = $convert.base64Decode('CgxSb2JvdENvbnRyb2wSSAoMcm9ib3RDb250cm9sGAEgASgOMiQubW9iaWxlX3RyYW5zY2VpdmVyLkVudW1Sb2JvdENvbnRyb2xSDHJvYm90Q29udHJvbA==');
@$core.Deprecated('Use modeBlockDescriptor instead')
const ModeBlock$json = const {
  '1': 'ModeBlock',
  '2': const [
    const {'1': 'mode', '3': 1, '4': 1, '5': 14, '6': '.mobile_transceiver.EnumMode', '10': 'mode'},
  ],
};

/// Descriptor for `ModeBlock`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List modeBlockDescriptor = $convert.base64Decode('CglNb2RlQmxvY2sSMAoEbW9kZRgBIAEoDjIcLm1vYmlsZV90cmFuc2NlaXZlci5FbnVtTW9kZVIEbW9kZQ==');
@$core.Deprecated('Use msgSystemOpModeDescriptor instead')
const MsgSystemOpMode$json = const {
  '1': 'MsgSystemOpMode',
  '2': const [
    const {'1': 'mode', '3': 1, '4': 1, '5': 14, '6': '.mobile_transceiver.SystemOperationMode', '10': 'mode'},
  ],
};

/// Descriptor for `MsgSystemOpMode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgSystemOpModeDescriptor = $convert.base64Decode('Cg9Nc2dTeXN0ZW1PcE1vZGUSOwoEbW9kZRgBIAEoDjInLm1vYmlsZV90cmFuc2NlaXZlci5TeXN0ZW1PcGVyYXRpb25Nb2RlUgRtb2Rl');
@$core.Deprecated('Use msgModeSettingsDescriptor instead')
const MsgModeSettings$json = const {
  '1': 'MsgModeSettings',
  '2': const [
    const {'1': 'mode', '3': 1, '4': 1, '5': 14, '6': '.mobile_transceiver.EnumMode', '10': 'mode'},
    const {'1': 'op_control_algorithm', '3': 2, '4': 1, '5': 5, '10': 'opControlAlgorithm'},
    const {'1': 'left_torque_level', '3': 3, '4': 3, '5': 13, '10': 'leftTorqueLevel'},
    const {'1': 'right_torque_level', '3': 4, '4': 3, '5': 13, '10': 'rightTorqueLevel'},
    const {'1': 'support_duration', '3': 5, '4': 3, '5': 13, '10': 'supportDuration'},
    const {'1': 'sensitivity', '3': 6, '4': 3, '5': 13, '10': 'sensitivity'},
    const {'1': 'stance_support', '3': 7, '4': 3, '5': 13, '10': 'stanceSupport'},
    const {'1': 'terminal_support', '3': 8, '4': 3, '5': 8, '10': 'terminalSupport'},
    const {'1': 'button_control', '3': 9, '4': 3, '5': 8, '10': 'buttonControl'},
    const {'1': 'aim_hip_angle', '3': 10, '4': 3, '5': 17, '10': 'aimHipAngle'},
    const {'1': 'keep_standing_support', '3': 11, '4': 1, '5': 8, '10': 'keepStandingSupport'},
    const {'1': 'weight_bearing', '3': 12, '4': 1, '5': 8, '10': 'weightBearing'},
    const {'1': 'bpm', '3': 13, '4': 1, '5': 5, '10': 'bpm'},
  ],
};

/// Descriptor for `MsgModeSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgModeSettingsDescriptor = $convert.base64Decode('Cg9Nc2dNb2RlU2V0dGluZ3MSMAoEbW9kZRgBIAEoDjIcLm1vYmlsZV90cmFuc2NlaXZlci5FbnVtTW9kZVIEbW9kZRIwChRvcF9jb250cm9sX2FsZ29yaXRobRgCIAEoBVISb3BDb250cm9sQWxnb3JpdGhtEioKEWxlZnRfdG9ycXVlX2xldmVsGAMgAygNUg9sZWZ0VG9ycXVlTGV2ZWwSLAoScmlnaHRfdG9ycXVlX2xldmVsGAQgAygNUhByaWdodFRvcnF1ZUxldmVsEikKEHN1cHBvcnRfZHVyYXRpb24YBSADKA1SD3N1cHBvcnREdXJhdGlvbhIgCgtzZW5zaXRpdml0eRgGIAMoDVILc2Vuc2l0aXZpdHkSJQoOc3RhbmNlX3N1cHBvcnQYByADKA1SDXN0YW5jZVN1cHBvcnQSKQoQdGVybWluYWxfc3VwcG9ydBgIIAMoCFIPdGVybWluYWxTdXBwb3J0EiUKDmJ1dHRvbl9jb250cm9sGAkgAygIUg1idXR0b25Db250cm9sEiIKDWFpbV9oaXBfYW5nbGUYCiADKBFSC2FpbUhpcEFuZ2xlEjIKFWtlZXBfc3RhbmRpbmdfc3VwcG9ydBgLIAEoCFITa2VlcFN0YW5kaW5nU3VwcG9ydBIlCg53ZWlnaHRfYmVhcmluZxgMIAEoCFINd2VpZ2h0QmVhcmluZxIQCgNicG0YDSABKAVSA2JwbQ==');
@$core.Deprecated('Use msgRhythmPlayControlDescriptor instead')
const MsgRhythmPlayControl$json = const {
  '1': 'MsgRhythmPlayControl',
  '2': const [
    const {'1': 'rhythmControl', '3': 1, '4': 1, '5': 14, '6': '.mobile_transceiver.RhythmControl', '10': 'rhythmControl'},
  ],
};

/// Descriptor for `MsgRhythmPlayControl`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgRhythmPlayControlDescriptor = $convert.base64Decode('ChRNc2dSaHl0aG1QbGF5Q29udHJvbBJHCg1yaHl0aG1Db250cm9sGAEgASgOMiEubW9iaWxlX3RyYW5zY2VpdmVyLlJoeXRobUNvbnRyb2xSDXJoeXRobUNvbnRyb2w=');
@$core.Deprecated('Use msgRobotSizeDescriptor instead')
const MsgRobotSize$json = const {
  '1': 'MsgRobotSize',
  '2': const [
    const {'1': 'leftThighLength', '3': 1, '4': 1, '5': 5, '10': 'leftThighLength'},
    const {'1': 'leftShankLength', '3': 2, '4': 1, '5': 5, '10': 'leftShankLength'},
    const {'1': 'rightThighLength', '3': 3, '4': 1, '5': 5, '10': 'rightThighLength'},
    const {'1': 'rightShankLength', '3': 4, '4': 1, '5': 5, '10': 'rightShankLength'},
  ],
};

/// Descriptor for `MsgRobotSize`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgRobotSizeDescriptor = $convert.base64Decode('CgxNc2dSb2JvdFNpemUSKAoPbGVmdFRoaWdoTGVuZ3RoGAEgASgFUg9sZWZ0VGhpZ2hMZW5ndGgSKAoPbGVmdFNoYW5rTGVuZ3RoGAIgASgFUg9sZWZ0U2hhbmtMZW5ndGgSKgoQcmlnaHRUaGlnaExlbmd0aBgDIAEoBVIQcmlnaHRUaGlnaExlbmd0aBIqChByaWdodFNoYW5rTGVuZ3RoGAQgASgFUhByaWdodFNoYW5rTGVuZ3Ro');
@$core.Deprecated('Use helloRequestDescriptor instead')
const HelloRequest$json = const {
  '1': 'HelloRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `HelloRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helloRequestDescriptor = $convert.base64Decode('CgxIZWxsb1JlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZQ==');
@$core.Deprecated('Use helloReplyDescriptor instead')
const HelloReply$json = const {
  '1': 'HelloReply',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `HelloReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helloReplyDescriptor = $convert.base64Decode('CgpIZWxsb1JlcGx5EhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2U=');
