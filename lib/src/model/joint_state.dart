import 'package:freezed_annotation/freezed_annotation.dart';

part 'joint_state.freezed.dart';

part 'joint_state.g.dart';

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
class JointState with _$JointState {
  factory JointState({
    @JsonKey(name: "header") Header? header,
    @JsonKey(name: "name") @Default([]) List<String>? name,
    @JsonKey(name: "position") @Default([]) List<double>? position,
    @JsonKey(name: "velocity") @Default([]) List<double>? velocity,
    @JsonKey(name: "effort") @Default([]) List<double>? effort,
  }) = _JointState;

  factory JointState.fromJson(Map<String, dynamic> json) => _$JointStateFromJson(json);
}
