///
//  Generated code. Do not modify.
//  source: m30_backpack_stream.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use sayRequestDescriptor instead')
const SayRequest$json = const {
  '1': 'SayRequest',
  '2': const [
    const {'1': 'trigger', '3': 1, '4': 1, '5': 8, '10': 'trigger'},
  ],
};

/// Descriptor for `SayRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sayRequestDescriptor = $convert.base64Decode('CgpTYXlSZXF1ZXN0EhgKB3RyaWdnZXIYASABKAhSB3RyaWdnZXI=');
@$core.Deprecated('Use helloButtonDescriptor instead')
const HelloButton$json = const {
  '1': 'HelloButton',
  '2': const [
    const {'1': 'emrButton', '3': 1, '4': 1, '5': 8, '10': 'emrButton'},
  ],
};

/// Descriptor for `HelloButton`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helloButtonDescriptor = $convert.base64Decode('CgtIZWxsb0J1dHRvbhIcCgllbXJCdXR0b24YASABKAhSCWVtckJ1dHRvbg==');
@$core.Deprecated('Use helloBackpackButtonsDescriptor instead')
const HelloBackpackButtons$json = const {
  '1': 'HelloBackpackButtons',
  '2': const [
    const {'1': 'buttons', '3': 1, '4': 3, '5': 8, '10': 'buttons'},
  ],
};

/// Descriptor for `HelloBackpackButtons`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helloBackpackButtonsDescriptor = $convert.base64Decode('ChRIZWxsb0JhY2twYWNrQnV0dG9ucxIYCgdidXR0b25zGAEgAygIUgdidXR0b25z');
@$core.Deprecated('Use helloReplyDescriptor instead')
const HelloReply$json = const {
  '1': 'HelloReply',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `HelloReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helloReplyDescriptor = $convert.base64Decode('CgpIZWxsb1JlcGx5EhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2U=');
@$core.Deprecated('Use joyMessageDescriptor instead')
const JoyMessage$json = const {
  '1': 'JoyMessage',
  '2': const [
    const {'1': 'buttons', '3': 1, '4': 3, '5': 5, '10': 'buttons'},
    const {'1': 'axes', '3': 2, '4': 3, '5': 2, '10': 'axes'},
  ],
};

/// Descriptor for `JoyMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joyMessageDescriptor = $convert.base64Decode('CgpKb3lNZXNzYWdlEhgKB2J1dHRvbnMYASADKAVSB2J1dHRvbnMSEgoEYXhlcxgCIAMoAlIEYXhlcw==');
@$core.Deprecated('Use myResponseDescriptor instead')
const MyResponse$json = const {
  '1': 'MyResponse',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `MyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List myResponseDescriptor = $convert.base64Decode('CgpNeVJlc3BvbnNlEhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2U=');
