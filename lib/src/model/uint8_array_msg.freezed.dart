// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'uint8_array_msg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Uint8ArrayMsg _$Uint8ArrayMsgFromJson(Map<String, dynamic> json) {
  return _Uint8ArrayMsg.fromJson(json);
}

/// @nodoc
mixin _$Uint8ArrayMsg {
  @JsonKey(name: "layout")
  MsgDimensionBlock? get layout => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  List<int>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Uint8ArrayMsgCopyWith<Uint8ArrayMsg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Uint8ArrayMsgCopyWith<$Res> {
  factory $Uint8ArrayMsgCopyWith(
          Uint8ArrayMsg value, $Res Function(Uint8ArrayMsg) then) =
      _$Uint8ArrayMsgCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "layout") MsgDimensionBlock? layout,
      @JsonKey(name: "data") List<int>? data});

  $MsgDimensionBlockCopyWith<$Res>? get layout;
}

/// @nodoc
class _$Uint8ArrayMsgCopyWithImpl<$Res>
    implements $Uint8ArrayMsgCopyWith<$Res> {
  _$Uint8ArrayMsgCopyWithImpl(this._value, this._then);

  final Uint8ArrayMsg _value;
  // ignore: unused_field
  final $Res Function(Uint8ArrayMsg) _then;

  @override
  $Res call({
    Object? layout = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      layout: layout == freezed
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as MsgDimensionBlock?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }

  @override
  $MsgDimensionBlockCopyWith<$Res>? get layout {
    if (_value.layout == null) {
      return null;
    }

    return $MsgDimensionBlockCopyWith<$Res>(_value.layout!, (value) {
      return _then(_value.copyWith(layout: value));
    });
  }
}

/// @nodoc
abstract class _$$_Uint8ArrayMsgCopyWith<$Res>
    implements $Uint8ArrayMsgCopyWith<$Res> {
  factory _$$_Uint8ArrayMsgCopyWith(
          _$_Uint8ArrayMsg value, $Res Function(_$_Uint8ArrayMsg) then) =
      __$$_Uint8ArrayMsgCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "layout") MsgDimensionBlock? layout,
      @JsonKey(name: "data") List<int>? data});

  @override
  $MsgDimensionBlockCopyWith<$Res>? get layout;
}

/// @nodoc
class __$$_Uint8ArrayMsgCopyWithImpl<$Res>
    extends _$Uint8ArrayMsgCopyWithImpl<$Res>
    implements _$$_Uint8ArrayMsgCopyWith<$Res> {
  __$$_Uint8ArrayMsgCopyWithImpl(
      _$_Uint8ArrayMsg _value, $Res Function(_$_Uint8ArrayMsg) _then)
      : super(_value, (v) => _then(v as _$_Uint8ArrayMsg));

  @override
  _$_Uint8ArrayMsg get _value => super._value as _$_Uint8ArrayMsg;

  @override
  $Res call({
    Object? layout = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_Uint8ArrayMsg(
      layout: layout == freezed
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as MsgDimensionBlock?,
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Uint8ArrayMsg implements _Uint8ArrayMsg {
  _$_Uint8ArrayMsg(
      {@JsonKey(name: "layout") this.layout,
      @JsonKey(name: "data") final List<int>? data = const []})
      : _data = data;

  factory _$_Uint8ArrayMsg.fromJson(Map<String, dynamic> json) =>
      _$$_Uint8ArrayMsgFromJson(json);

  @override
  @JsonKey(name: "layout")
  final MsgDimensionBlock? layout;
  final List<int>? _data;
  @override
  @JsonKey(name: "data")
  List<int>? get data {
    final value = _data;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Uint8ArrayMsg(layout: $layout, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Uint8ArrayMsg &&
            const DeepCollectionEquality().equals(other.layout, layout) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(layout),
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$_Uint8ArrayMsgCopyWith<_$_Uint8ArrayMsg> get copyWith =>
      __$$_Uint8ArrayMsgCopyWithImpl<_$_Uint8ArrayMsg>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_Uint8ArrayMsgToJson(this);
  }
}

abstract class _Uint8ArrayMsg implements Uint8ArrayMsg {
  factory _Uint8ArrayMsg(
      {@JsonKey(name: "layout") final MsgDimensionBlock? layout,
      @JsonKey(name: "data") final List<int>? data}) = _$_Uint8ArrayMsg;

  factory _Uint8ArrayMsg.fromJson(Map<String, dynamic> json) =
      _$_Uint8ArrayMsg.fromJson;

  @override
  @JsonKey(name: "layout")
  MsgDimensionBlock? get layout => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "data")
  List<int>? get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_Uint8ArrayMsgCopyWith<_$_Uint8ArrayMsg> get copyWith =>
      throw _privateConstructorUsedError;
}
