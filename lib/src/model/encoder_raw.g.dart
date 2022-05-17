// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encoder_raw.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EncoderRaw _$$_EncoderRawFromJson(Map<String, dynamic> json) =>
    _$_EncoderRaw(
      layout:
          MsgDimensionBlock.fromJson(json['layout'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          const [],
    );

Map<String, dynamic> _$$_EncoderRawToJson(_$_EncoderRaw instance) =>
    <String, dynamic>{
      'layout': instance.layout,
      'data': instance.data,
    };

_$_MsgDimensionBlock _$$_MsgDimensionBlockFromJson(Map<String, dynamic> json) =>
    _$_MsgDimensionBlock(
      (json['dim'] as List<dynamic>?)
              ?.map((e) => MsgDimension.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_MsgDimensionBlockToJson(
        _$_MsgDimensionBlock instance) =>
    <String, dynamic>{
      'dim': instance.dim,
    };

_$_MsgDimension _$$_MsgDimensionFromJson(Map<String, dynamic> json) =>
    _$_MsgDimension(
      json['label'] as String?,
      json['size'] as int?,
      json['stride'] as int?,
    );

Map<String, dynamic> _$$_MsgDimensionToJson(_$_MsgDimension instance) =>
    <String, dynamic>{
      'label': instance.label,
      'size': instance.size,
      'stride': instance.stride,
    };
