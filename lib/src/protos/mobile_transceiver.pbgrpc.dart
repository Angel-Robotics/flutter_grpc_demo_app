///
//  Generated code. Do not modify.
//  source: mobile_transceiver.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'mobile_transceiver.pb.dart' as $0;
export 'mobile_transceiver.pb.dart';

class MobileTransceiverClient extends $grpc.Client {
  static final _$sayHello = $grpc.ClientMethod<$0.HelloRequest, $0.HelloReply>(
      '/mobile_transceiver.MobileTransceiver/SayHello',
      ($0.HelloRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HelloReply.fromBuffer(value));
  static final _$setMode = $grpc.ClientMethod<$0.ModeBlock, $0.HelloReply>(
      '/mobile_transceiver.MobileTransceiver/SetMode',
      ($0.ModeBlock value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HelloReply.fromBuffer(value));
  static final _$sendRobotControl =
      $grpc.ClientMethod<$0.RobotControl, $0.HelloReply>(
          '/mobile_transceiver.MobileTransceiver/SendRobotControl',
          ($0.RobotControl value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.HelloReply.fromBuffer(value));
  static final _$sendSystemOperationMode =
      $grpc.ClientMethod<$0.MsgSystemOpMode, $0.HelloReply>(
          '/mobile_transceiver.MobileTransceiver/SendSystemOperationMode',
          ($0.MsgSystemOpMode value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.HelloReply.fromBuffer(value));
  static final _$sendModeSettings =
      $grpc.ClientMethod<$0.MsgModeSettings, $0.HelloReply>(
          '/mobile_transceiver.MobileTransceiver/SendModeSettings',
          ($0.MsgModeSettings value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.HelloReply.fromBuffer(value));
  static final _$sendRhythmControl =
      $grpc.ClientMethod<$0.MsgRhythmPlayControl, $0.HelloReply>(
          '/mobile_transceiver.MobileTransceiver/SendRhythmControl',
          ($0.MsgRhythmPlayControl value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.HelloReply.fromBuffer(value));
  static final _$sendRobotSize =
      $grpc.ClientMethod<$0.MsgRobotSize, $0.HelloReply>(
          '/mobile_transceiver.MobileTransceiver/SendRobotSize',
          ($0.MsgRobotSize value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.HelloReply.fromBuffer(value));

  MobileTransceiverClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.HelloReply> sayHello($0.HelloRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sayHello, request, options: options);
  }

  $grpc.ResponseFuture<$0.HelloReply> setMode($0.ModeBlock request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setMode, request, options: options);
  }

  $grpc.ResponseFuture<$0.HelloReply> sendRobotControl($0.RobotControl request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendRobotControl, request, options: options);
  }

  $grpc.ResponseFuture<$0.HelloReply> sendSystemOperationMode(
      $0.MsgSystemOpMode request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendSystemOperationMode, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.HelloReply> sendModeSettings(
      $0.MsgModeSettings request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendModeSettings, request, options: options);
  }

  $grpc.ResponseFuture<$0.HelloReply> sendRhythmControl(
      $0.MsgRhythmPlayControl request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendRhythmControl, request, options: options);
  }

  $grpc.ResponseFuture<$0.HelloReply> sendRobotSize($0.MsgRobotSize request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendRobotSize, request, options: options);
  }
}

abstract class MobileTransceiverServiceBase extends $grpc.Service {
  $core.String get $name => 'mobile_transceiver.MobileTransceiver';

  MobileTransceiverServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.HelloRequest, $0.HelloReply>(
        'SayHello',
        sayHello_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.HelloRequest.fromBuffer(value),
        ($0.HelloReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ModeBlock, $0.HelloReply>(
        'SetMode',
        setMode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ModeBlock.fromBuffer(value),
        ($0.HelloReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RobotControl, $0.HelloReply>(
        'SendRobotControl',
        sendRobotControl_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RobotControl.fromBuffer(value),
        ($0.HelloReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MsgSystemOpMode, $0.HelloReply>(
        'SendSystemOperationMode',
        sendSystemOperationMode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MsgSystemOpMode.fromBuffer(value),
        ($0.HelloReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MsgModeSettings, $0.HelloReply>(
        'SendModeSettings',
        sendModeSettings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MsgModeSettings.fromBuffer(value),
        ($0.HelloReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MsgRhythmPlayControl, $0.HelloReply>(
        'SendRhythmControl',
        sendRhythmControl_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MsgRhythmPlayControl.fromBuffer(value),
        ($0.HelloReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MsgRobotSize, $0.HelloReply>(
        'SendRobotSize',
        sendRobotSize_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MsgRobotSize.fromBuffer(value),
        ($0.HelloReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.HelloReply> sayHello_Pre(
      $grpc.ServiceCall call, $async.Future<$0.HelloRequest> request) async {
    return sayHello(call, await request);
  }

  $async.Future<$0.HelloReply> setMode_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ModeBlock> request) async {
    return setMode(call, await request);
  }

  $async.Future<$0.HelloReply> sendRobotControl_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RobotControl> request) async {
    return sendRobotControl(call, await request);
  }

  $async.Future<$0.HelloReply> sendSystemOperationMode_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MsgSystemOpMode> request) async {
    return sendSystemOperationMode(call, await request);
  }

  $async.Future<$0.HelloReply> sendModeSettings_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MsgModeSettings> request) async {
    return sendModeSettings(call, await request);
  }

  $async.Future<$0.HelloReply> sendRhythmControl_Pre($grpc.ServiceCall call,
      $async.Future<$0.MsgRhythmPlayControl> request) async {
    return sendRhythmControl(call, await request);
  }

  $async.Future<$0.HelloReply> sendRobotSize_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MsgRobotSize> request) async {
    return sendRobotSize(call, await request);
  }

  $async.Future<$0.HelloReply> sayHello(
      $grpc.ServiceCall call, $0.HelloRequest request);
  $async.Future<$0.HelloReply> setMode(
      $grpc.ServiceCall call, $0.ModeBlock request);
  $async.Future<$0.HelloReply> sendRobotControl(
      $grpc.ServiceCall call, $0.RobotControl request);
  $async.Future<$0.HelloReply> sendSystemOperationMode(
      $grpc.ServiceCall call, $0.MsgSystemOpMode request);
  $async.Future<$0.HelloReply> sendModeSettings(
      $grpc.ServiceCall call, $0.MsgModeSettings request);
  $async.Future<$0.HelloReply> sendRhythmControl(
      $grpc.ServiceCall call, $0.MsgRhythmPlayControl request);
  $async.Future<$0.HelloReply> sendRobotSize(
      $grpc.ServiceCall call, $0.MsgRobotSize request);
}
