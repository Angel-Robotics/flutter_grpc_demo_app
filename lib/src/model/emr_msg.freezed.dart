// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'emr_msg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BoolMsg _$BoolMsgFromJson(Map<String, dynamic> json) {
  return _BoolMsg.fromJson(json);
}

/// @nodoc
mixin _$BoolMsg {
  bool? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoolMsgCopyWith<BoolMsg> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoolMsgCopyWith<$Res> {
  factory $BoolMsgCopyWith(BoolMsg value, $Res Function(BoolMsg) then) =
      _$BoolMsgCopyWithImpl<$Res>;
  $Res call({bool? data});
}

/// @nodoc
class _$BoolMsgCopyWithImpl<$Res> implements $BoolMsgCopyWith<$Res> {
  _$BoolMsgCopyWithImpl(this._value, this._then);

  final BoolMsg _value;
  // ignore: unused_field
  final $Res Function(BoolMsg) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_BoolMsgCopyWith<$Res> implements $BoolMsgCopyWith<$Res> {
  factory _$$_BoolMsgCopyWith(
          _$_BoolMsg value, $Res Function(_$_BoolMsg) then) =
      __$$_BoolMsgCopyWithImpl<$Res>;
  @override
  $Res call({bool? data});
}

/// @nodoc
class __$$_BoolMsgCopyWithImpl<$Res> extends _$BoolMsgCopyWithImpl<$Res>
    implements _$$_BoolMsgCopyWith<$Res> {
  __$$_BoolMsgCopyWithImpl(_$_BoolMsg _value, $Res Function(_$_BoolMsg) _then)
      : super(_value, (v) => _then(v as _$_BoolMsg));

  @override
  _$_BoolMsg get _value => super._value as _$_BoolMsg;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_BoolMsg(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BoolMsg implements _BoolMsg {
  _$_BoolMsg({this.data});

  factory _$_BoolMsg.fromJson(Map<String, dynamic> json) =>
      _$$_BoolMsgFromJson(json);

  @override
  final bool? data;

  @override
  String toString() {
    return 'BoolMsg(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BoolMsg &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_BoolMsgCopyWith<_$_BoolMsg> get copyWith =>
      __$$_BoolMsgCopyWithImpl<_$_BoolMsg>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BoolMsgToJson(this);
  }
}

abstract class _BoolMsg implements BoolMsg {
  factory _BoolMsg({final bool? data}) = _$_BoolMsg;

  factory _BoolMsg.fromJson(Map<String, dynamic> json) = _$_BoolMsg.fromJson;

  @override
  bool? get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BoolMsgCopyWith<_$_BoolMsg> get copyWith =>
      throw _privateConstructorUsedError;
}
