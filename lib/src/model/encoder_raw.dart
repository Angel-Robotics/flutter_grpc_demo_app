import 'package:freezed_annotation/freezed_annotation.dart';

part 'encoder_raw.freezed.dart';

part 'encoder_raw.g.dart';

@freezed
class EncoderRaw with _$EncoderRaw {
  factory EncoderRaw({
    @JsonKey(name: "layout") required MsgDimensionBlock layout,
    @JsonKey(name: "data") @Default([]) List<int>? data,
  }) = _EncoderRaw;

  factory EncoderRaw.fromJson(Map<String, dynamic> json) => _$EncoderRawFromJson(json);
}

@freezed
class MsgDimensionBlock with _$MsgDimensionBlock {
  factory MsgDimensionBlock(
    @JsonKey(name: "dim") List<MsgDimension>? dim,
  ) = _MsgDimensionBlock;

  factory MsgDimensionBlock.fromJson(Map<String, dynamic> json) => _$MsgDimensionBlockFromJson(json);
}

@freezed
class MsgDimension with _$MsgDimension {
  factory MsgDimension(
    String? label,
    int? size,
    int? stride,
  ) = _MsgDimension;

  factory MsgDimension.fromJson(Map<String, dynamic> json) => _$MsgDimensionFromJson(json);
}
