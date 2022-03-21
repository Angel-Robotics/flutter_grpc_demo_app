///
//  Generated code. Do not modify.
//  source: m30_backpack_stream.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SayRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SayRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'm30_backpack_stream'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trigger')
    ..hasRequiredFields = false
  ;

  SayRequest._() : super();
  factory SayRequest({
    $core.bool? trigger,
  }) {
    final _result = create();
    if (trigger != null) {
      _result.trigger = trigger;
    }
    return _result;
  }
  factory SayRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SayRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SayRequest clone() => SayRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SayRequest copyWith(void Function(SayRequest) updates) => super.copyWith((message) => updates(message as SayRequest)) as SayRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SayRequest create() => SayRequest._();
  SayRequest createEmptyInstance() => create();
  static $pb.PbList<SayRequest> createRepeated() => $pb.PbList<SayRequest>();
  @$core.pragma('dart2js:noInline')
  static SayRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SayRequest>(create);
  static SayRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get trigger => $_getBF(0);
  @$pb.TagNumber(1)
  set trigger($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTrigger() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrigger() => clearField(1);
}

class HelloButton extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HelloButton', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'm30_backpack_stream'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'emrButton', protoName: 'emrButton')
    ..hasRequiredFields = false
  ;

  HelloButton._() : super();
  factory HelloButton({
    $core.bool? emrButton,
  }) {
    final _result = create();
    if (emrButton != null) {
      _result.emrButton = emrButton;
    }
    return _result;
  }
  factory HelloButton.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HelloButton.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HelloButton clone() => HelloButton()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HelloButton copyWith(void Function(HelloButton) updates) => super.copyWith((message) => updates(message as HelloButton)) as HelloButton; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HelloButton create() => HelloButton._();
  HelloButton createEmptyInstance() => create();
  static $pb.PbList<HelloButton> createRepeated() => $pb.PbList<HelloButton>();
  @$core.pragma('dart2js:noInline')
  static HelloButton getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HelloButton>(create);
  static HelloButton? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get emrButton => $_getBF(0);
  @$pb.TagNumber(1)
  set emrButton($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmrButton() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmrButton() => clearField(1);
}

class HelloBackpackButtons extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HelloBackpackButtons', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'm30_backpack_stream'), createEmptyInstance: create)
    ..p<$core.bool>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buttons', $pb.PbFieldType.PB)
    ..hasRequiredFields = false
  ;

  HelloBackpackButtons._() : super();
  factory HelloBackpackButtons({
    $core.Iterable<$core.bool>? buttons,
  }) {
    final _result = create();
    if (buttons != null) {
      _result.buttons.addAll(buttons);
    }
    return _result;
  }
  factory HelloBackpackButtons.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HelloBackpackButtons.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HelloBackpackButtons clone() => HelloBackpackButtons()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HelloBackpackButtons copyWith(void Function(HelloBackpackButtons) updates) => super.copyWith((message) => updates(message as HelloBackpackButtons)) as HelloBackpackButtons; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HelloBackpackButtons create() => HelloBackpackButtons._();
  HelloBackpackButtons createEmptyInstance() => create();
  static $pb.PbList<HelloBackpackButtons> createRepeated() => $pb.PbList<HelloBackpackButtons>();
  @$core.pragma('dart2js:noInline')
  static HelloBackpackButtons getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HelloBackpackButtons>(create);
  static HelloBackpackButtons? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.bool> get buttons => $_getList(0);
}

class HelloReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HelloReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'm30_backpack_stream'), createEmptyInstance: create)
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

class JoyMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'JoyMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'm30_backpack_stream'), createEmptyInstance: create)
    ..p<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buttons', $pb.PbFieldType.P3)
    ..p<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'axes', $pb.PbFieldType.PF)
    ..hasRequiredFields = false
  ;

  JoyMessage._() : super();
  factory JoyMessage({
    $core.Iterable<$core.int>? buttons,
    $core.Iterable<$core.double>? axes,
  }) {
    final _result = create();
    if (buttons != null) {
      _result.buttons.addAll(buttons);
    }
    if (axes != null) {
      _result.axes.addAll(axes);
    }
    return _result;
  }
  factory JoyMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JoyMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JoyMessage clone() => JoyMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JoyMessage copyWith(void Function(JoyMessage) updates) => super.copyWith((message) => updates(message as JoyMessage)) as JoyMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JoyMessage create() => JoyMessage._();
  JoyMessage createEmptyInstance() => create();
  static $pb.PbList<JoyMessage> createRepeated() => $pb.PbList<JoyMessage>();
  @$core.pragma('dart2js:noInline')
  static JoyMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JoyMessage>(create);
  static JoyMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get buttons => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.double> get axes => $_getList(1);
}

class MyResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MyResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'm30_backpack_stream'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  MyResponse._() : super();
  factory MyResponse({
    $core.String? message,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory MyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MyResponse clone() => MyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MyResponse copyWith(void Function(MyResponse) updates) => super.copyWith((message) => updates(message as MyResponse)) as MyResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MyResponse create() => MyResponse._();
  MyResponse createEmptyInstance() => create();
  static $pb.PbList<MyResponse> createRepeated() => $pb.PbList<MyResponse>();
  @$core.pragma('dart2js:noInline')
  static MyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MyResponse>(create);
  static MyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

