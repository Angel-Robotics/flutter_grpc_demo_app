// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'robot_size.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RobotSizeTearOff {
  const _$RobotSizeTearOff();

  _RobotSize call({int? lh, int? lk, int? rh, int? rk}) {
    return _RobotSize(
      lh: lh,
      lk: lk,
      rh: rh,
      rk: rk,
    );
  }
}

/// @nodoc
const $RobotSize = _$RobotSizeTearOff();

/// @nodoc
mixin _$RobotSize {
  int? get lh => throw _privateConstructorUsedError;
  int? get lk => throw _privateConstructorUsedError;
  int? get rh => throw _privateConstructorUsedError;
  int? get rk => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RobotSizeCopyWith<RobotSize> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RobotSizeCopyWith<$Res> {
  factory $RobotSizeCopyWith(RobotSize value, $Res Function(RobotSize) then) =
      _$RobotSizeCopyWithImpl<$Res>;
  $Res call({int? lh, int? lk, int? rh, int? rk});
}

/// @nodoc
class _$RobotSizeCopyWithImpl<$Res> implements $RobotSizeCopyWith<$Res> {
  _$RobotSizeCopyWithImpl(this._value, this._then);

  final RobotSize _value;
  // ignore: unused_field
  final $Res Function(RobotSize) _then;

  @override
  $Res call({
    Object? lh = freezed,
    Object? lk = freezed,
    Object? rh = freezed,
    Object? rk = freezed,
  }) {
    return _then(_value.copyWith(
      lh: lh == freezed
          ? _value.lh
          : lh // ignore: cast_nullable_to_non_nullable
              as int?,
      lk: lk == freezed
          ? _value.lk
          : lk // ignore: cast_nullable_to_non_nullable
              as int?,
      rh: rh == freezed
          ? _value.rh
          : rh // ignore: cast_nullable_to_non_nullable
              as int?,
      rk: rk == freezed
          ? _value.rk
          : rk // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$RobotSizeCopyWith<$Res> implements $RobotSizeCopyWith<$Res> {
  factory _$RobotSizeCopyWith(
          _RobotSize value, $Res Function(_RobotSize) then) =
      __$RobotSizeCopyWithImpl<$Res>;
  @override
  $Res call({int? lh, int? lk, int? rh, int? rk});
}

/// @nodoc
class __$RobotSizeCopyWithImpl<$Res> extends _$RobotSizeCopyWithImpl<$Res>
    implements _$RobotSizeCopyWith<$Res> {
  __$RobotSizeCopyWithImpl(_RobotSize _value, $Res Function(_RobotSize) _then)
      : super(_value, (v) => _then(v as _RobotSize));

  @override
  _RobotSize get _value => super._value as _RobotSize;

  @override
  $Res call({
    Object? lh = freezed,
    Object? lk = freezed,
    Object? rh = freezed,
    Object? rk = freezed,
  }) {
    return _then(_RobotSize(
      lh: lh == freezed
          ? _value.lh
          : lh // ignore: cast_nullable_to_non_nullable
              as int?,
      lk: lk == freezed
          ? _value.lk
          : lk // ignore: cast_nullable_to_non_nullable
              as int?,
      rh: rh == freezed
          ? _value.rh
          : rh // ignore: cast_nullable_to_non_nullable
              as int?,
      rk: rk == freezed
          ? _value.rk
          : rk // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_RobotSize implements _RobotSize {
  _$_RobotSize({this.lh, this.lk, this.rh, this.rk});

  @override
  final int? lh;
  @override
  final int? lk;
  @override
  final int? rh;
  @override
  final int? rk;

  @override
  String toString() {
    return 'RobotSize(lh: $lh, lk: $lk, rh: $rh, rk: $rk)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RobotSize &&
            const DeepCollectionEquality().equals(other.lh, lh) &&
            const DeepCollectionEquality().equals(other.lk, lk) &&
            const DeepCollectionEquality().equals(other.rh, rh) &&
            const DeepCollectionEquality().equals(other.rk, rk));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lh),
      const DeepCollectionEquality().hash(lk),
      const DeepCollectionEquality().hash(rh),
      const DeepCollectionEquality().hash(rk));

  @JsonKey(ignore: true)
  @override
  _$RobotSizeCopyWith<_RobotSize> get copyWith =>
      __$RobotSizeCopyWithImpl<_RobotSize>(this, _$identity);
}

abstract class _RobotSize implements RobotSize {
  factory _RobotSize({int? lh, int? lk, int? rh, int? rk}) = _$_RobotSize;

  @override
  int? get lh;
  @override
  int? get lk;
  @override
  int? get rh;
  @override
  int? get rk;
  @override
  @JsonKey(ignore: true)
  _$RobotSizeCopyWith<_RobotSize> get copyWith =>
      throw _privateConstructorUsedError;
}
