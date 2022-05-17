// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joy_msg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HeaderStamp _$$_HeaderStampFromJson(Map<String, dynamic> json) =>
    _$_HeaderStamp(
      sec: json['sec'] as int?,
      nanosec: json['nanosec'] as int?,
    );

Map<String, dynamic> _$$_HeaderStampToJson(_$_HeaderStamp instance) =>
    <String, dynamic>{
      'sec': instance.sec,
      'nanosec': instance.nanosec,
    };

_$_Header _$$_HeaderFromJson(Map<String, dynamic> json) => _$_Header(
      stamp: json['stamp'] == null
          ? null
          : HeaderStamp.fromJson(json['stamp'] as Map<String, dynamic>),
      frameId: json['frame_id'] as String?,
    );

Map<String, dynamic> _$$_HeaderToJson(_$_Header instance) => <String, dynamic>{
      'stamp': instance.stamp,
      'frame_id': instance.frameId,
    };

_$_JoyMsg _$$_JoyMsgFromJson(Map<String, dynamic> json) => _$_JoyMsg(
      head: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      axes: (json['axes'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          [],
      buttons:
          (json['buttons'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              [],
    );

Map<String, dynamic> _$$_JoyMsgToJson(_$_JoyMsg instance) => <String, dynamic>{
      'header': instance.head,
      'axes': instance.axes,
      'buttons': instance.buttons,
    };
