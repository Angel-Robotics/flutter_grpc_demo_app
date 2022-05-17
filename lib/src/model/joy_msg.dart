
import 'package:freezed_annotation/freezed_annotation.dart';
part 'joy_msg.freezed.dart';
part 'joy_msg.g.dart';


@freezed
class HeaderStamp with _$HeaderStamp {
  factory HeaderStamp({
    @JsonKey(name: "sec") int? sec,
    @JsonKey(name: "nanosec") int? nanosec,
  }) = _HeaderStamp;

  factory HeaderStamp.fromJson(Map<String, dynamic> json) => _$HeaderStampFromJson(json);
}

@freezed
class Header with _$Header {
  factory Header({
    @JsonKey(name: "stamp") HeaderStamp? stamp,
    @JsonKey(name: "frame_id") String? frameId,
  }) = _Header;

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
}
@freezed
class JoyMsg with _$JoyMsg {
  factory JoyMsg({
    @JsonKey(name: "header" ) Header? head,
    @JsonKey(name: "axes", defaultValue: []) List<double>? axes,
    @JsonKey(name: "buttons", defaultValue: [])  List<int>? buttons,

  }) = _JoyMsg;

  factory JoyMsg.fromJson(Map<String, dynamic> json) => _$JoyMsgFromJson(json);
}