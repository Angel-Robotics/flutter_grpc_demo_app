// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'joy_msg.dart';

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

JoyMsg _$JoyMsgFromJson(Map<String, dynamic> json) {
  return _JoyMsg.fromJson(json);
}

/// @nodoc
mixin _$JoyMsg {
  @JsonKey(name: "header")
  Header? get head => throw _privateConstructorUsedError;
  @JsonKey(name: "axes", defaultValue: [])
  List<double>? get axes => throw _privateConstructorUsedError;
  @JsonKey(name: "buttons", defaultValue: [])
  List<int>? get buttons => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JoyMsgCopyWith<JoyMsg> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoyMsgCopyWith<$Res> {
  factory $JoyMsgCopyWith(JoyMsg value, $Res Function(JoyMsg) then) =
      _$JoyMsgCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "header") Header? head,
      @JsonKey(name: "axes", defaultValue: []) List<double>? axes,
      @JsonKey(name: "buttons", defaultValue: []) List<int>? buttons});

  $HeaderCopyWith<$Res>? get head;
}

/// @nodoc
class _$JoyMsgCopyWithImpl<$Res> implements $JoyMsgCopyWith<$Res> {
  _$JoyMsgCopyWithImpl(this._value, this._then);

  final JoyMsg _value;
  // ignore: unused_field
  final $Res Function(JoyMsg) _then;

  @override
  $Res call({
    Object? head = freezed,
    Object? axes = freezed,
    Object? buttons = freezed,
  }) {
    return _then(_value.copyWith(
      head: head == freezed
          ? _value.head
          : head // ignore: cast_nullable_to_non_nullable
              as Header?,
      axes: axes == freezed
          ? _value.axes
          : axes // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      buttons: buttons == freezed
          ? _value.buttons
          : buttons // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }

  @override
  $HeaderCopyWith<$Res>? get head {
    if (_value.head == null) {
      return null;
    }

    return $HeaderCopyWith<$Res>(_value.head!, (value) {
      return _then(_value.copyWith(head: value));
    });
  }
}

/// @nodoc
abstract class _$$_JoyMsgCopyWith<$Res> implements $JoyMsgCopyWith<$Res> {
  factory _$$_JoyMsgCopyWith(_$_JoyMsg value, $Res Function(_$_JoyMsg) then) =
      __$$_JoyMsgCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "header") Header? head,
      @JsonKey(name: "axes", defaultValue: []) List<double>? axes,
      @JsonKey(name: "buttons", defaultValue: []) List<int>? buttons});

  @override
  $HeaderCopyWith<$Res>? get head;
}

/// @nodoc
class __$$_JoyMsgCopyWithImpl<$Res> extends _$JoyMsgCopyWithImpl<$Res>
    implements _$$_JoyMsgCopyWith<$Res> {
  __$$_JoyMsgCopyWithImpl(_$_JoyMsg _value, $Res Function(_$_JoyMsg) _then)
      : super(_value, (v) => _then(v as _$_JoyMsg));

  @override
  _$_JoyMsg get _value => super._value as _$_JoyMsg;

  @override
  $Res call({
    Object? head = freezed,
    Object? axes = freezed,
    Object? buttons = freezed,
  }) {
    return _then(_$_JoyMsg(
      head: head == freezed
          ? _value.head
          : head // ignore: cast_nullable_to_non_nullable
              as Header?,
      axes: axes == freezed
          ? _value._axes
          : axes // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      buttons: buttons == freezed
          ? _value._buttons
          : buttons // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JoyMsg implements _JoyMsg {
  _$_JoyMsg(
      {@JsonKey(name: "header") this.head,
      @JsonKey(name: "axes", defaultValue: []) final List<double>? axes,
      @JsonKey(name: "buttons", defaultValue: []) final List<int>? buttons})
      : _axes = axes,
        _buttons = buttons;

  factory _$_JoyMsg.fromJson(Map<String, dynamic> json) =>
      _$$_JoyMsgFromJson(json);

  @override
  @JsonKey(name: "header")
  final Header? head;
  final List<double>? _axes;
  @override
  @JsonKey(name: "axes", defaultValue: [])
  List<double>? get axes {
    final value = _axes;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _buttons;
  @override
  @JsonKey(name: "buttons", defaultValue: [])
  List<int>? get buttons {
    final value = _buttons;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'JoyMsg(head: $head, axes: $axes, buttons: $buttons)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JoyMsg &&
            const DeepCollectionEquality().equals(other.head, head) &&
            const DeepCollectionEquality().equals(other._axes, _axes) &&
            const DeepCollectionEquality().equals(other._buttons, _buttons));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(head),
      const DeepCollectionEquality().hash(_axes),
      const DeepCollectionEquality().hash(_buttons));

  @JsonKey(ignore: true)
  @override
  _$$_JoyMsgCopyWith<_$_JoyMsg> get copyWith =>
      __$$_JoyMsgCopyWithImpl<_$_JoyMsg>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JoyMsgToJson(this);
  }
}

abstract class _JoyMsg implements JoyMsg {
  factory _JoyMsg(
      {@JsonKey(name: "header")
          final Header? head,
      @JsonKey(name: "axes", defaultValue: [])
          final List<double>? axes,
      @JsonKey(name: "buttons", defaultValue: [])
          final List<int>? buttons}) = _$_JoyMsg;

  factory _JoyMsg.fromJson(Map<String, dynamic> json) = _$_JoyMsg.fromJson;

  @override
  @JsonKey(name: "header")
  Header? get head => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "axes", defaultValue: [])
  List<double>? get axes => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "buttons", defaultValue: [])
  List<int>? get buttons => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_JoyMsgCopyWith<_$_JoyMsg> get copyWith =>
      throw _privateConstructorUsedError;
}
