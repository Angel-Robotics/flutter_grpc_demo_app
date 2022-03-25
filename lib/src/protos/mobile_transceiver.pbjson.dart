///
//  Generated code. Do not modify.
//  source: mobile_transceiver.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
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
