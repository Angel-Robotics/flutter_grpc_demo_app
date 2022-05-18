// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'basic_msg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BasicMsg _$BasicMsgFromJson(Map<String, dynamic> json) {
  return _BasicMsg.fromJson(json);
}

/// @nodoc
mixin _$BasicMsg {
  @JsonKey(name: "msg")
  String? get msg => throw _privateConstructorUsedError;
  @JsonKey(name: "timestamp")
  double? get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: "msg_len")
  int? get msgLen => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasicMsgCopyWith<BasicMsg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicMsgCopyWith<$Res> {
  factory $BasicMsgCopyWith(BasicMsg value, $Res Function(BasicMsg) then) =
      _$BasicMsgCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "msg") String? msg,
      @JsonKey(name: "timestamp") double? timestamp,
      @JsonKey(name: "msg_len") int? msgLen});
}

/// @nodoc
class _$BasicMsgCopyWithImpl<$Res> implements $BasicMsgCopyWith<$Res> {
  _$BasicMsgCopyWithImpl(this._value, this._then);

  final BasicMsg _value;
  // ignore: unused_field
  final $Res Function(BasicMsg) _then;

  @override
  $Res call({
    Object? msg = freezed,
    Object? timestamp = freezed,
    Object? msgLen = freezed,
  }) {
    return _then(_value.copyWith(
      msg: msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as double?,
      msgLen: msgLen == freezed
          ? _value.msgLen
          : msgLen // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_BasicMsgCopyWith<$Res> implements $BasicMsgCopyWith<$Res> {
  factory _$$_BasicMsgCopyWith(
          _$_BasicMsg value, $Res Function(_$_BasicMsg) then) =
      __$$_BasicMsgCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "msg") String? msg,
      @JsonKey(name: "timestamp") double? timestamp,
      @JsonKey(name: "msg_len") int? msgLen});
}

/// @nodoc
class __$$_BasicMsgCopyWithImpl<$Res> extends _$BasicMsgCopyWithImpl<$Res>
    implements _$$_BasicMsgCopyWith<$Res> {
  __$$_BasicMsgCopyWithImpl(
      _$_BasicMsg _value, $Res Function(_$_BasicMsg) _then)
      : super(_value, (v) => _then(v as _$_BasicMsg));

  @override
  _$_BasicMsg get _value => super._value as _$_BasicMsg;

  @override
  $Res call({
    Object? msg = freezed,
    Object? timestamp = freezed,
    Object? msgLen = freezed,
  }) {
    return _then(_$_BasicMsg(
      msg: msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as double?,
      msgLen: msgLen == freezed
          ? _value.msgLen
          : msgLen // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BasicMsg implements _BasicMsg {
  _$_BasicMsg(
      {@JsonKey(name: "msg") this.msg,
      @JsonKey(name: "timestamp") this.timestamp,
      @JsonKey(name: "msg_len") this.msgLen});

  factory _$_BasicMsg.fromJson(Map<String, dynamic> json) =>
      _$$_BasicMsgFromJson(json);

  @override
  @JsonKey(name: "msg")
  final String? msg;
  @override
  @JsonKey(name: "timestamp")
  final double? timestamp;
  @override
  @JsonKey(name: "msg_len")
  final int? msgLen;

  @override
  String toString() {
    return 'BasicMsg(msg: $msg, timestamp: $timestamp, msgLen: $msgLen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BasicMsg &&
            const DeepCollectionEquality().equals(other.msg, msg) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other.msgLen, msgLen));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(msg),
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(msgLen));

  @JsonKey(ignore: true)
  @override
  _$$_BasicMsgCopyWith<_$_BasicMsg> get copyWith =>
      __$$_BasicMsgCopyWithImpl<_$_BasicMsg>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BasicMsgToJson(this);
  }
}

abstract class _BasicMsg implements BasicMsg {
  factory _BasicMsg(
      {@JsonKey(name: "msg") final String? msg,
      @JsonKey(name: "timestamp") final double? timestamp,
      @JsonKey(name: "msg_len") final int? msgLen}) = _$_BasicMsg;

  factory _BasicMsg.fromJson(Map<String, dynamic> json) = _$_BasicMsg.fromJson;

  @override
  @JsonKey(name: "msg")
  String? get msg => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "timestamp")
  double? get timestamp => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "msg_len")
  int? get msgLen => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BasicMsgCopyWith<_$_BasicMsg> get copyWith =>
      throw _privateConstructorUsedError;
}
