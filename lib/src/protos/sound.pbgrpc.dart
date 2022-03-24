///
//  Generated code. Do not modify.
//  source: sound.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'sound.pb.dart' as $0;
export 'sound.pb.dart';

class SoundClient extends $grpc.Client {
  static final _$sayHello = $grpc.ClientMethod<$0.HelloRequest, $0.HelloReply>(
      '/sound.Sound/SayHello',
      ($0.HelloRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HelloReply.fromBuffer(value));
  static final _$playSound = $grpc.ClientMethod<$0.PlayRequest, $0.HelloReply>(
      '/sound.Sound/PlaySound',
      ($0.PlayRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HelloReply.fromBuffer(value));
  static final _$setVolume = $grpc.ClientMethod<$0.Volume, $0.HelloReply>(
      '/sound.Sound/SetVolume',
      ($0.Volume value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HelloReply.fromBuffer(value));

  SoundClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.HelloReply> sayHello($0.HelloRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sayHello, request, options: options);
  }

  $grpc.ResponseFuture<$0.HelloReply> playSound($0.PlayRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$playSound, request, options: options);
  }

  $grpc.ResponseFuture<$0.HelloReply> setVolume($0.Volume request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setVolume, request, options: options);
  }
}

abstract class SoundServiceBase extends $grpc.Service {
  $core.String get $name => 'sound.Sound';

  SoundServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.HelloRequest, $0.HelloReply>(
        'SayHello',
        sayHello_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.HelloRequest.fromBuffer(value),
        ($0.HelloReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PlayRequest, $0.HelloReply>(
        'PlaySound',
        playSound_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PlayRequest.fromBuffer(value),
        ($0.HelloReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Volume, $0.HelloReply>(
        'SetVolume',
        setVolume_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Volume.fromBuffer(value),
        ($0.HelloReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.HelloReply> sayHello_Pre(
      $grpc.ServiceCall call, $async.Future<$0.HelloRequest> request) async {
    return sayHello(call, await request);
  }

  $async.Future<$0.HelloReply> playSound_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PlayRequest> request) async {
    return playSound(call, await request);
  }

  $async.Future<$0.HelloReply> setVolume_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Volume> request) async {
    return setVolume(call, await request);
  }

  $async.Future<$0.HelloReply> sayHello(
      $grpc.ServiceCall call, $0.HelloRequest request);
  $async.Future<$0.HelloReply> playSound(
      $grpc.ServiceCall call, $0.PlayRequest request);
  $async.Future<$0.HelloReply> setVolume(
      $grpc.ServiceCall call, $0.Volume request);
}
