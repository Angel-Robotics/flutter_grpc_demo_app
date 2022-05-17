
import 'package:flutter_grpc_demo_app/src/model/encoder_raw.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'uint8_array_msg.freezed.dart';
part 'uint8_array_msg.g.dart';

@freezed
class Uint8ArrayMsg with _$Uint8ArrayMsg {
  factory Uint8ArrayMsg({
    @JsonKey(name: "layout") MsgDimensionBlock? layout,
    @JsonKey(name: "data") @Default([]) List<int>? data,
  }) = _Uint8ArrayMsg;

  factory Uint8ArrayMsg.fromJson(Map<String, dynamic> json) => _$Uint8ArrayMsgFromJson(json);
}