

import 'package:freezed_annotation/freezed_annotation.dart';

part 'battery_state_msg.freezed.dart';
part 'battery_state_msg.g.dart';

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
class BatteryStateMsg with _$BatteryStateMsg{
  factory BatteryStateMsg({
    @JsonKey(name: "header") Header? header,
    @JsonKey(name: "percentage") double? percentage,
  }) = _BatteryStateMsg;

  factory BatteryStateMsg.fromJson(Map<String, dynamic> json) => _$BatteryStateMsgFromJson(json);
}