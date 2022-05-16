// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joint_state.dart';

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

_$_JointState _$$_JointStateFromJson(Map<String, dynamic> json) =>
    _$_JointState(
      header: json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      name:
          (json['name'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      position: (json['position'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [],
      velocity: (json['velocity'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [],
      effort: (json['effort'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_JointStateToJson(_$_JointState instance) =>
    <String, dynamic>{
      'header': instance.header,
      'name': instance.name,
      'position': instance.position,
      'velocity': instance.velocity,
      'effort': instance.effort,
    };
