// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uint8_array_msg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Uint8ArrayMsg _$$_Uint8ArrayMsgFromJson(Map<String, dynamic> json) =>
    _$_Uint8ArrayMsg(
      layout: json['layout'] == null
          ? null
          : MsgDimensionBlock.fromJson(json['layout'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          const [],
    );

Map<String, dynamic> _$$_Uint8ArrayMsgToJson(_$_Uint8ArrayMsg instance) =>
    <String, dynamic>{
      'layout': instance.layout,
      'data': instance.data,
    };
