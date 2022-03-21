///
//  Generated code. Do not modify.
//  source: m30_backpack_stream.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'm30_backpack_stream.pb.dart' as $0;
export 'm30_backpack_stream.pb.dart';

class M30BackpackIOStreamClient extends $grpc.Client {
  static final _$streamEmergencyButton =
      $grpc.ClientMethod<$0.SayRequest, $0.HelloButton>(
          '/m30_backpack_stream.M30BackpackIOStream/StreamEmergencyButton',
          ($0.SayRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.HelloButton.fromBuffer(value));
  static final _$streamBackpackButtons =
      $grpc.ClientMethod<$0.SayRequest, $0.HelloBackpackButtons>(
          '/m30_backpack_stream.M30BackpackIOStream/StreamBackpackButtons',
          ($0.SayRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.HelloBackpackButtons.fromBuffer(value));
  static final _$streamJoystick =
      $grpc.ClientMethod<$0.SayRequest, $0.JoyMessage>(
          '/m30_backpack_stream.M30BackpackIOStream/StreamJoystick',
          ($0.SayRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.JoyMessage.fromBuffer(value));

  M30BackpackIOStreamClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.HelloButton> streamEmergencyButton(
      $0.SayRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$streamEmergencyButton, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.HelloBackpackButtons> streamBackpackButtons(
      $0.SayRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$streamBackpackButtons, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.JoyMessage> streamJoystick($0.SayRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$streamJoystick, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class M30BackpackIOStreamServiceBase extends $grpc.Service {
  $core.String get $name => 'm30_backpack_stream.M30BackpackIOStream';

  M30BackpackIOStreamServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SayRequest, $0.HelloButton>(
        'StreamEmergencyButton',
        streamEmergencyButton_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.SayRequest.fromBuffer(value),
        ($0.HelloButton value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SayRequest, $0.HelloBackpackButtons>(
        'StreamBackpackButtons',
        streamBackpackButtons_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.SayRequest.fromBuffer(value),
        ($0.HelloBackpackButtons value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SayRequest, $0.JoyMessage>(
        'StreamJoystick',
        streamJoystick_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.SayRequest.fromBuffer(value),
        ($0.JoyMessage value) => value.writeToBuffer()));
  }

  $async.Stream<$0.HelloButton> streamEmergencyButton_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SayRequest> request) async* {
    yield* streamEmergencyButton(call, await request);
  }

  $async.Stream<$0.HelloBackpackButtons> streamBackpackButtons_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SayRequest> request) async* {
    yield* streamBackpackButtons(call, await request);
  }

  $async.Stream<$0.JoyMessage> streamJoystick_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SayRequest> request) async* {
    yield* streamJoystick(call, await request);
  }

  $async.Stream<$0.HelloButton> streamEmergencyButton(
      $grpc.ServiceCall call, $0.SayRequest request);
  $async.Stream<$0.HelloBackpackButtons> streamBackpackButtons(
      $grpc.ServiceCall call, $0.SayRequest request);
  $async.Stream<$0.JoyMessage> streamJoystick(
      $grpc.ServiceCall call, $0.SayRequest request);
}
