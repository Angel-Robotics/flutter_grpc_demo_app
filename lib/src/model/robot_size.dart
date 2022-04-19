import 'package:freezed_annotation/freezed_annotation.dart';

part 'robot_size.freezed.dart';

@freezed
class RobotSize with _$RobotSize {
  factory RobotSize({
    int? lh,
    int? lk,
    int? rh,
    int? rk,
  }) = _RobotSize;
}