// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'encoder_raw.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EncoderRaw _$EncoderRawFromJson(Map<String, dynamic> json) {
  return _EncoderRaw.fromJson(json);
}

/// @nodoc
mixin _$EncoderRaw {
  @JsonKey(name: "layout")
  MsgDimensionBlock get layout => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  List<int>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EncoderRawCopyWith<EncoderRaw> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EncoderRawCopyWith<$Res> {
  factory $EncoderRawCopyWith(
          EncoderRaw value, $Res Function(EncoderRaw) then) =
      _$EncoderRawCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "layout") MsgDimensionBlock layout,
      @JsonKey(name: "data") List<int>? data});

  $MsgDimensionBlockCopyWith<$Res> get layout;
}

/// @nodoc
class _$EncoderRawCopyWithImpl<$Res> implements $EncoderRawCopyWith<$Res> {
  _$EncoderRawCopyWithImpl(this._value, this._then);

  final EncoderRaw _value;
  // ignore: unused_field
  final $Res Function(EncoderRaw) _then;

  @override
  $Res call({
    Object? layout = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      layout: layout == freezed
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as MsgDimensionBlock,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }

  @override
  $MsgDimensionBlockCopyWith<$Res> get layout {
    return $MsgDimensionBlockCopyWith<$Res>(_value.layout, (value) {
      return _then(_value.copyWith(layout: value));
    });
  }
}

/// @nodoc
abstract class _$EncoderRawCopyWith<$Res> implements $EncoderRawCopyWith<$Res> {
  factory _$EncoderRawCopyWith(
          _EncoderRaw value, $Res Function(_EncoderRaw) then) =
      __$EncoderRawCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "layout") MsgDimensionBlock layout,
      @JsonKey(name: "data") List<int>? data});

  @override
  $MsgDimensionBlockCopyWith<$Res> get layout;
}

/// @nodoc
class __$EncoderRawCopyWithImpl<$Res> extends _$EncoderRawCopyWithImpl<$Res>
    implements _$EncoderRawCopyWith<$Res> {
  __$EncoderRawCopyWithImpl(
      _EncoderRaw _value, $Res Function(_EncoderRaw) _then)
      : super(_value, (v) => _then(v as _EncoderRaw));

  @override
  _EncoderRaw get _value => super._value as _EncoderRaw;

  @override
  $Res call({
    Object? layout = freezed,
    Object? data = freezed,
  }) {
    return _then(_EncoderRaw(
      layout: layout == freezed
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as MsgDimensionBlock,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EncoderRaw implements _EncoderRaw {
  _$_EncoderRaw(
      {@JsonKey(name: "layout") required this.layout,
      @JsonKey(name: "data") final List<int>? data = const []})
      : _data = data;

  factory _$_EncoderRaw.fromJson(Map<String, dynamic> json) =>
      _$$_EncoderRawFromJson(json);

  @override
  @JsonKey(name: "layout")
  final MsgDimensionBlock layout;
  @JsonKey(name: "data")
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
    return 'EncoderRaw(layout: $layout, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EncoderRaw &&
            const DeepCollectionEquality().equals(other.layout, layout) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(layout),
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$EncoderRawCopyWith<_EncoderRaw> get copyWith =>
      __$EncoderRawCopyWithImpl<_EncoderRaw>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EncoderRawToJson(this);
  }
}

abstract class _EncoderRaw implements EncoderRaw {
  factory _EncoderRaw(
      {@JsonKey(name: "layout") required final MsgDimensionBlock layout,
      @JsonKey(name: "data") final List<int>? data}) = _$_EncoderRaw;

  factory _EncoderRaw.fromJson(Map<String, dynamic> json) =
      _$_EncoderRaw.fromJson;

  @override
  @JsonKey(name: "layout")
  MsgDimensionBlock get layout => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "data")
  List<int>? get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EncoderRawCopyWith<_EncoderRaw> get copyWith =>
      throw _privateConstructorUsedError;
}

MsgDimensionBlock _$MsgDimensionBlockFromJson(Map<String, dynamic> json) {
  return _MsgDimensionBlock.fromJson(json);
}

/// @nodoc
mixin _$MsgDimensionBlock {
  @JsonKey(name: "dim")
  List<MsgDimension>? get dim => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MsgDimensionBlockCopyWith<MsgDimensionBlock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MsgDimensionBlockCopyWith<$Res> {
  factory $MsgDimensionBlockCopyWith(
          MsgDimensionBlock value, $Res Function(MsgDimensionBlock) then) =
      _$MsgDimensionBlockCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: "dim") List<MsgDimension>? dim});
}

/// @nodoc
class _$MsgDimensionBlockCopyWithImpl<$Res>
    implements $MsgDimensionBlockCopyWith<$Res> {
  _$MsgDimensionBlockCopyWithImpl(this._value, this._then);

  final MsgDimensionBlock _value;
  // ignore: unused_field
  final $Res Function(MsgDimensionBlock) _then;

  @override
  $Res call({
    Object? dim = freezed,
  }) {
    return _then(_value.copyWith(
      dim: dim == freezed
          ? _value.dim
          : dim // ignore: cast_nullable_to_non_nullable
              as List<MsgDimension>?,
    ));
  }
}

/// @nodoc
abstract class _$MsgDimensionBlockCopyWith<$Res>
    implements $MsgDimensionBlockCopyWith<$Res> {
  factory _$MsgDimensionBlockCopyWith(
          _MsgDimensionBlock value, $Res Function(_MsgDimensionBlock) then) =
      __$MsgDimensionBlockCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: "dim") List<MsgDimension>? dim});
}

/// @nodoc
class __$MsgDimensionBlockCopyWithImpl<$Res>
    extends _$MsgDimensionBlockCopyWithImpl<$Res>
    implements _$MsgDimensionBlockCopyWith<$Res> {
  __$MsgDimensionBlockCopyWithImpl(
      _MsgDimensionBlock _value, $Res Function(_MsgDimensionBlock) _then)
      : super(_value, (v) => _then(v as _MsgDimensionBlock));

  @override
  _MsgDimensionBlock get _value => super._value as _MsgDimensionBlock;

  @override
  $Res call({
    Object? dim = freezed,
  }) {
    return _then(_MsgDimensionBlock(
      dim == freezed
          ? _value.dim
          : dim // ignore: cast_nullable_to_non_nullable
              as List<MsgDimension>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MsgDimensionBlock implements _MsgDimensionBlock {
  _$_MsgDimensionBlock(@JsonKey(name: "dim") final List<MsgDimension>? dim)
      : _dim = dim;

  factory _$_MsgDimensionBlock.fromJson(Map<String, dynamic> json) =>
      _$$_MsgDimensionBlockFromJson(json);

  @JsonKey(name: "dim")
  final List<MsgDimension>? _dim;
  @override
  @JsonKey(name: "dim")
  List<MsgDimension>? get dim {
    final value = _dim;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MsgDimensionBlock(dim: $dim)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MsgDimensionBlock &&
            const DeepCollectionEquality().equals(other.dim, dim));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(dim));

  @JsonKey(ignore: true)
  @override
  _$MsgDimensionBlockCopyWith<_MsgDimensionBlock> get copyWith =>
      __$MsgDimensionBlockCopyWithImpl<_MsgDimensionBlock>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MsgDimensionBlockToJson(this);
  }
}

abstract class _MsgDimensionBlock implements MsgDimensionBlock {
  factory _MsgDimensionBlock(
          @JsonKey(name: "dim") final List<MsgDimension>? dim) =
      _$_MsgDimensionBlock;

  factory _MsgDimensionBlock.fromJson(Map<String, dynamic> json) =
      _$_MsgDimensionBlock.fromJson;

  @override
  @JsonKey(name: "dim")
  List<MsgDimension>? get dim => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MsgDimensionBlockCopyWith<_MsgDimensionBlock> get copyWith =>
      throw _privateConstructorUsedError;
}

MsgDimension _$MsgDimensionFromJson(Map<String, dynamic> json) {
  return _MsgDimension.fromJson(json);
}

/// @nodoc
mixin _$MsgDimension {
  String? get label => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  int? get stride => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MsgDimensionCopyWith<MsgDimension> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MsgDimensionCopyWith<$Res> {
  factory $MsgDimensionCopyWith(
          MsgDimension value, $Res Function(MsgDimension) then) =
      _$MsgDimensionCopyWithImpl<$Res>;
  $Res call({String? label, int? size, int? stride});
}

/// @nodoc
class _$MsgDimensionCopyWithImpl<$Res> implements $MsgDimensionCopyWith<$Res> {
  _$MsgDimensionCopyWithImpl(this._value, this._then);

  final MsgDimension _value;
  // ignore: unused_field
  final $Res Function(MsgDimension) _then;

  @override
  $Res call({
    Object? label = freezed,
    Object? size = freezed,
    Object? stride = freezed,
  }) {
    return _then(_value.copyWith(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      stride: stride == freezed
          ? _value.stride
          : stride // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$MsgDimensionCopyWith<$Res>
    implements $MsgDimensionCopyWith<$Res> {
  factory _$MsgDimensionCopyWith(
          _MsgDimension value, $Res Function(_MsgDimension) then) =
      __$MsgDimensionCopyWithImpl<$Res>;
  @override
  $Res call({String? label, int? size, int? stride});
}

/// @nodoc
class __$MsgDimensionCopyWithImpl<$Res> extends _$MsgDimensionCopyWithImpl<$Res>
    implements _$MsgDimensionCopyWith<$Res> {
  __$MsgDimensionCopyWithImpl(
      _MsgDimension _value, $Res Function(_MsgDimension) _then)
      : super(_value, (v) => _then(v as _MsgDimension));

  @override
  _MsgDimension get _value => super._value as _MsgDimension;

  @override
  $Res call({
    Object? label = freezed,
    Object? size = freezed,
    Object? stride = freezed,
  }) {
    return _then(_MsgDimension(
      label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      stride == freezed
          ? _value.stride
          : stride // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MsgDimension implements _MsgDimension {
  _$_MsgDimension(this.label, this.size, this.stride);

  factory _$_MsgDimension.fromJson(Map<String, dynamic> json) =>
      _$$_MsgDimensionFromJson(json);

  @override
  final String? label;
  @override
  final int? size;
  @override
  final int? stride;

  @override
  String toString() {
    return 'MsgDimension(label: $label, size: $size, stride: $stride)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MsgDimension &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality().equals(other.stride, stride));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(stride));

  @JsonKey(ignore: true)
  @override
  _$MsgDimensionCopyWith<_MsgDimension> get copyWith =>
      __$MsgDimensionCopyWithImpl<_MsgDimension>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MsgDimensionToJson(this);
  }
}

abstract class _MsgDimension implements MsgDimension {
  factory _MsgDimension(
          final String? label, final int? size, final int? stride) =
      _$_MsgDimension;

  factory _MsgDimension.fromJson(Map<String, dynamic> json) =
      _$_MsgDimension.fromJson;

  @override
  String? get label => throw _privateConstructorUsedError;
  @override
  int? get size => throw _privateConstructorUsedError;
  @override
  int? get stride => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MsgDimensionCopyWith<_MsgDimension> get copyWith =>
      throw _privateConstructorUsedError;
}
