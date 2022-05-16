// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'joint_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HeaderStamp _$HeaderStampFromJson(Map<String, dynamic> json) {
  return _HeaderStamp.fromJson(json);
}

/// @nodoc
mixin _$HeaderStamp {
  @JsonKey(name: "sec")
  int? get sec => throw _privateConstructorUsedError;
  @JsonKey(name: "nanosec")
  int? get nanosec => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HeaderStampCopyWith<HeaderStamp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeaderStampCopyWith<$Res> {
  factory $HeaderStampCopyWith(
          HeaderStamp value, $Res Function(HeaderStamp) then) =
      _$HeaderStampCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "sec") int? sec, @JsonKey(name: "nanosec") int? nanosec});
}

/// @nodoc
class _$HeaderStampCopyWithImpl<$Res> implements $HeaderStampCopyWith<$Res> {
  _$HeaderStampCopyWithImpl(this._value, this._then);

  final HeaderStamp _value;
  // ignore: unused_field
  final $Res Function(HeaderStamp) _then;

  @override
  $Res call({
    Object? sec = freezed,
    Object? nanosec = freezed,
  }) {
    return _then(_value.copyWith(
      sec: sec == freezed
          ? _value.sec
          : sec // ignore: cast_nullable_to_non_nullable
              as int?,
      nanosec: nanosec == freezed
          ? _value.nanosec
          : nanosec // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_HeaderStampCopyWith<$Res>
    implements $HeaderStampCopyWith<$Res> {
  factory _$$_HeaderStampCopyWith(
          _$_HeaderStamp value, $Res Function(_$_HeaderStamp) then) =
      __$$_HeaderStampCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "sec") int? sec, @JsonKey(name: "nanosec") int? nanosec});
}

/// @nodoc
class __$$_HeaderStampCopyWithImpl<$Res> extends _$HeaderStampCopyWithImpl<$Res>
    implements _$$_HeaderStampCopyWith<$Res> {
  __$$_HeaderStampCopyWithImpl(
      _$_HeaderStamp _value, $Res Function(_$_HeaderStamp) _then)
      : super(_value, (v) => _then(v as _$_HeaderStamp));

  @override
  _$_HeaderStamp get _value => super._value as _$_HeaderStamp;

  @override
  $Res call({
    Object? sec = freezed,
    Object? nanosec = freezed,
  }) {
    return _then(_$_HeaderStamp(
      sec: sec == freezed
          ? _value.sec
          : sec // ignore: cast_nullable_to_non_nullable
              as int?,
      nanosec: nanosec == freezed
          ? _value.nanosec
          : nanosec // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HeaderStamp implements _HeaderStamp {
  _$_HeaderStamp(
      {@JsonKey(name: "sec") this.sec, @JsonKey(name: "nanosec") this.nanosec});

  factory _$_HeaderStamp.fromJson(Map<String, dynamic> json) =>
      _$$_HeaderStampFromJson(json);

  @override
  @JsonKey(name: "sec")
  final int? sec;
  @override
  @JsonKey(name: "nanosec")
  final int? nanosec;

  @override
  String toString() {
    return 'HeaderStamp(sec: $sec, nanosec: $nanosec)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HeaderStamp &&
            const DeepCollectionEquality().equals(other.sec, sec) &&
            const DeepCollectionEquality().equals(other.nanosec, nanosec));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sec),
      const DeepCollectionEquality().hash(nanosec));

  @JsonKey(ignore: true)
  @override
  _$$_HeaderStampCopyWith<_$_HeaderStamp> get copyWith =>
      __$$_HeaderStampCopyWithImpl<_$_HeaderStamp>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HeaderStampToJson(this);
  }
}

abstract class _HeaderStamp implements HeaderStamp {
  factory _HeaderStamp(
      {@JsonKey(name: "sec") final int? sec,
      @JsonKey(name: "nanosec") final int? nanosec}) = _$_HeaderStamp;

  factory _HeaderStamp.fromJson(Map<String, dynamic> json) =
      _$_HeaderStamp.fromJson;

  @override
  @JsonKey(name: "sec")
  int? get sec => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "nanosec")
  int? get nanosec => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_HeaderStampCopyWith<_$_HeaderStamp> get copyWith =>
      throw _privateConstructorUsedError;
}

Header _$HeaderFromJson(Map<String, dynamic> json) {
  return _Header.fromJson(json);
}

/// @nodoc
mixin _$Header {
  @JsonKey(name: "stamp")
  HeaderStamp? get stamp => throw _privateConstructorUsedError;
  @JsonKey(name: "frame_id")
  String? get frameId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HeaderCopyWith<Header> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeaderCopyWith<$Res> {
  factory $HeaderCopyWith(Header value, $Res Function(Header) then) =
      _$HeaderCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "stamp") HeaderStamp? stamp,
      @JsonKey(name: "frame_id") String? frameId});

  $HeaderStampCopyWith<$Res>? get stamp;
}

/// @nodoc
class _$HeaderCopyWithImpl<$Res> implements $HeaderCopyWith<$Res> {
  _$HeaderCopyWithImpl(this._value, this._then);

  final Header _value;
  // ignore: unused_field
  final $Res Function(Header) _then;

  @override
  $Res call({
    Object? stamp = freezed,
    Object? frameId = freezed,
  }) {
    return _then(_value.copyWith(
      stamp: stamp == freezed
          ? _value.stamp
          : stamp // ignore: cast_nullable_to_non_nullable
              as HeaderStamp?,
      frameId: frameId == freezed
          ? _value.frameId
          : frameId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $HeaderStampCopyWith<$Res>? get stamp {
    if (_value.stamp == null) {
      return null;
    }

    return $HeaderStampCopyWith<$Res>(_value.stamp!, (value) {
      return _then(_value.copyWith(stamp: value));
    });
  }
}

/// @nodoc
abstract class _$$_HeaderCopyWith<$Res> implements $HeaderCopyWith<$Res> {
  factory _$$_HeaderCopyWith(_$_Header value, $Res Function(_$_Header) then) =
      __$$_HeaderCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "stamp") HeaderStamp? stamp,
      @JsonKey(name: "frame_id") String? frameId});

  @override
  $HeaderStampCopyWith<$Res>? get stamp;
}

/// @nodoc
class __$$_HeaderCopyWithImpl<$Res> extends _$HeaderCopyWithImpl<$Res>
    implements _$$_HeaderCopyWith<$Res> {
  __$$_HeaderCopyWithImpl(_$_Header _value, $Res Function(_$_Header) _then)
      : super(_value, (v) => _then(v as _$_Header));

  @override
  _$_Header get _value => super._value as _$_Header;

  @override
  $Res call({
    Object? stamp = freezed,
    Object? frameId = freezed,
  }) {
    return _then(_$_Header(
      stamp: stamp == freezed
          ? _value.stamp
          : stamp // ignore: cast_nullable_to_non_nullable
              as HeaderStamp?,
      frameId: frameId == freezed
          ? _value.frameId
          : frameId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Header implements _Header {
  _$_Header(
      {@JsonKey(name: "stamp") this.stamp,
      @JsonKey(name: "frame_id") this.frameId});

  factory _$_Header.fromJson(Map<String, dynamic> json) =>
      _$$_HeaderFromJson(json);

  @override
  @JsonKey(name: "stamp")
  final HeaderStamp? stamp;
  @override
  @JsonKey(name: "frame_id")
  final String? frameId;

  @override
  String toString() {
    return 'Header(stamp: $stamp, frameId: $frameId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Header &&
            const DeepCollectionEquality().equals(other.stamp, stamp) &&
            const DeepCollectionEquality().equals(other.frameId, frameId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(stamp),
      const DeepCollectionEquality().hash(frameId));

  @JsonKey(ignore: true)
  @override
  _$$_HeaderCopyWith<_$_Header> get copyWith =>
      __$$_HeaderCopyWithImpl<_$_Header>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HeaderToJson(this);
  }
}

abstract class _Header implements Header {
  factory _Header(
      {@JsonKey(name: "stamp") final HeaderStamp? stamp,
      @JsonKey(name: "frame_id") final String? frameId}) = _$_Header;

  factory _Header.fromJson(Map<String, dynamic> json) = _$_Header.fromJson;

  @override
  @JsonKey(name: "stamp")
  HeaderStamp? get stamp => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "frame_id")
  String? get frameId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_HeaderCopyWith<_$_Header> get copyWith =>
      throw _privateConstructorUsedError;
}

JointState _$JointStateFromJson(Map<String, dynamic> json) {
  return _JointState.fromJson(json);
}

/// @nodoc
mixin _$JointState {
  @JsonKey(name: "header")
  Header? get header => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  List<String>? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "position")
  List<double>? get position => throw _privateConstructorUsedError;
  @JsonKey(name: "velocity")
  List<double>? get velocity => throw _privateConstructorUsedError;
  @JsonKey(name: "effort")
  List<double>? get effort => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JointStateCopyWith<JointState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JointStateCopyWith<$Res> {
  factory $JointStateCopyWith(
          JointState value, $Res Function(JointState) then) =
      _$JointStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "header") Header? header,
      @JsonKey(name: "name") List<String>? name,
      @JsonKey(name: "position") List<double>? position,
      @JsonKey(name: "velocity") List<double>? velocity,
      @JsonKey(name: "effort") List<double>? effort});

  $HeaderCopyWith<$Res>? get header;
}

/// @nodoc
class _$JointStateCopyWithImpl<$Res> implements $JointStateCopyWith<$Res> {
  _$JointStateCopyWithImpl(this._value, this._then);

  final JointState _value;
  // ignore: unused_field
  final $Res Function(JointState) _then;

  @override
  $Res call({
    Object? header = freezed,
    Object? name = freezed,
    Object? position = freezed,
    Object? velocity = freezed,
    Object? effort = freezed,
  }) {
    return _then(_value.copyWith(
      header: header == freezed
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as Header?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      velocity: velocity == freezed
          ? _value.velocity
          : velocity // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      effort: effort == freezed
          ? _value.effort
          : effort // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ));
  }

  @override
  $HeaderCopyWith<$Res>? get header {
    if (_value.header == null) {
      return null;
    }

    return $HeaderCopyWith<$Res>(_value.header!, (value) {
      return _then(_value.copyWith(header: value));
    });
  }
}

/// @nodoc
abstract class _$$_JointStateCopyWith<$Res>
    implements $JointStateCopyWith<$Res> {
  factory _$$_JointStateCopyWith(
          _$_JointState value, $Res Function(_$_JointState) then) =
      __$$_JointStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "header") Header? header,
      @JsonKey(name: "name") List<String>? name,
      @JsonKey(name: "position") List<double>? position,
      @JsonKey(name: "velocity") List<double>? velocity,
      @JsonKey(name: "effort") List<double>? effort});

  @override
  $HeaderCopyWith<$Res>? get header;
}

/// @nodoc
class __$$_JointStateCopyWithImpl<$Res> extends _$JointStateCopyWithImpl<$Res>
    implements _$$_JointStateCopyWith<$Res> {
  __$$_JointStateCopyWithImpl(
      _$_JointState _value, $Res Function(_$_JointState) _then)
      : super(_value, (v) => _then(v as _$_JointState));

  @override
  _$_JointState get _value => super._value as _$_JointState;

  @override
  $Res call({
    Object? header = freezed,
    Object? name = freezed,
    Object? position = freezed,
    Object? velocity = freezed,
    Object? effort = freezed,
  }) {
    return _then(_$_JointState(
      header: header == freezed
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as Header?,
      name: name == freezed
          ? _value._name
          : name // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      position: position == freezed
          ? _value._position
          : position // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      velocity: velocity == freezed
          ? _value._velocity
          : velocity // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      effort: effort == freezed
          ? _value._effort
          : effort // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JointState implements _JointState {
  _$_JointState(
      {@JsonKey(name: "header") this.header,
      @JsonKey(name: "name") final List<String>? name = const [],
      @JsonKey(name: "position") final List<double>? position = const [],
      @JsonKey(name: "velocity") final List<double>? velocity = const [],
      @JsonKey(name: "effort") final List<double>? effort = const []})
      : _name = name,
        _position = position,
        _velocity = velocity,
        _effort = effort;

  factory _$_JointState.fromJson(Map<String, dynamic> json) =>
      _$$_JointStateFromJson(json);

  @override
  @JsonKey(name: "header")
  final Header? header;
  final List<String>? _name;
  @override
  @JsonKey(name: "name")
  List<String>? get name {
    final value = _name;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double>? _position;
  @override
  @JsonKey(name: "position")
  List<double>? get position {
    final value = _position;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double>? _velocity;
  @override
  @JsonKey(name: "velocity")
  List<double>? get velocity {
    final value = _velocity;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double>? _effort;
  @override
  @JsonKey(name: "effort")
  List<double>? get effort {
    final value = _effort;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'JointState(header: $header, name: $name, position: $position, velocity: $velocity, effort: $effort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JointState &&
            const DeepCollectionEquality().equals(other.header, header) &&
            const DeepCollectionEquality().equals(other._name, _name) &&
            const DeepCollectionEquality().equals(other._position, _position) &&
            const DeepCollectionEquality().equals(other._velocity, _velocity) &&
            const DeepCollectionEquality().equals(other._effort, _effort));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(header),
      const DeepCollectionEquality().hash(_name),
      const DeepCollectionEquality().hash(_position),
      const DeepCollectionEquality().hash(_velocity),
      const DeepCollectionEquality().hash(_effort));

  @JsonKey(ignore: true)
  @override
  _$$_JointStateCopyWith<_$_JointState> get copyWith =>
      __$$_JointStateCopyWithImpl<_$_JointState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JointStateToJson(this);
  }
}

abstract class _JointState implements JointState {
  factory _JointState(
      {@JsonKey(name: "header") final Header? header,
      @JsonKey(name: "name") final List<String>? name,
      @JsonKey(name: "position") final List<double>? position,
      @JsonKey(name: "velocity") final List<double>? velocity,
      @JsonKey(name: "effort") final List<double>? effort}) = _$_JointState;

  factory _JointState.fromJson(Map<String, dynamic> json) =
      _$_JointState.fromJson;

  @override
  @JsonKey(name: "header")
  Header? get header => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "name")
  List<String>? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "position")
  List<double>? get position => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "velocity")
  List<double>? get velocity => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "effort")
  List<double>? get effort => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_JointStateCopyWith<_$_JointState> get copyWith =>
      throw _privateConstructorUsedError;
}
