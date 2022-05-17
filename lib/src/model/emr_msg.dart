import 'package:freezed_annotation/freezed_annotation.dart';
part 'emr_msg.freezed.dart';
part 'emr_msg.g.dart';
@freezed
class BoolMsg with _$BoolMsg {
  factory BoolMsg({bool? data}) = _BoolMsg;
  factory BoolMsg.fromJson(Map<String, dynamic> json) => _$BoolMsgFromJson(json);
}
