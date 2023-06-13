// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_editdata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoEditData {
  int get todoid => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime? get alarm => throw _privateConstructorUsedError;
  int? get alarmid => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  bool get complete => throw _privateConstructorUsedError;
  Color? get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoEditDataCopyWith<TodoEditData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoEditDataCopyWith<$Res> {
  factory $TodoEditDataCopyWith(
          TodoEditData value, $Res Function(TodoEditData) then) =
      _$TodoEditDataCopyWithImpl<$Res, TodoEditData>;
  @useResult
  $Res call(
      {int todoid,
      DateTime date,
      DateTime? alarm,
      int? alarmid,
      String text,
      bool complete,
      Color? color});
}

/// @nodoc
class _$TodoEditDataCopyWithImpl<$Res, $Val extends TodoEditData>
    implements $TodoEditDataCopyWith<$Res> {
  _$TodoEditDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoid = null,
    Object? date = null,
    Object? alarm = freezed,
    Object? alarmid = freezed,
    Object? text = null,
    Object? complete = null,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      todoid: null == todoid
          ? _value.todoid
          : todoid // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      alarm: freezed == alarm
          ? _value.alarm
          : alarm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      alarmid: freezed == alarmid
          ? _value.alarmid
          : alarmid // ignore: cast_nullable_to_non_nullable
              as int?,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      complete: null == complete
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as bool,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoEditDataCopyWith<$Res>
    implements $TodoEditDataCopyWith<$Res> {
  factory _$$_TodoEditDataCopyWith(
          _$_TodoEditData value, $Res Function(_$_TodoEditData) then) =
      __$$_TodoEditDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int todoid,
      DateTime date,
      DateTime? alarm,
      int? alarmid,
      String text,
      bool complete,
      Color? color});
}

/// @nodoc
class __$$_TodoEditDataCopyWithImpl<$Res>
    extends _$TodoEditDataCopyWithImpl<$Res, _$_TodoEditData>
    implements _$$_TodoEditDataCopyWith<$Res> {
  __$$_TodoEditDataCopyWithImpl(
      _$_TodoEditData _value, $Res Function(_$_TodoEditData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoid = null,
    Object? date = null,
    Object? alarm = freezed,
    Object? alarmid = freezed,
    Object? text = null,
    Object? complete = null,
    Object? color = freezed,
  }) {
    return _then(_$_TodoEditData(
      todoid: null == todoid
          ? _value.todoid
          : todoid // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      alarm: freezed == alarm
          ? _value.alarm
          : alarm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      alarmid: freezed == alarmid
          ? _value.alarmid
          : alarmid // ignore: cast_nullable_to_non_nullable
              as int?,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      complete: null == complete
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as bool,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc

class _$_TodoEditData implements _TodoEditData {
  const _$_TodoEditData(
      {required this.todoid,
      required this.date,
      this.alarm = null,
      this.alarmid = null,
      required this.text,
      this.complete = false,
      this.color = null});

  @override
  final int todoid;
  @override
  final DateTime date;
  @override
  @JsonKey()
  final DateTime? alarm;
  @override
  @JsonKey()
  final int? alarmid;
  @override
  final String text;
  @override
  @JsonKey()
  final bool complete;
  @override
  @JsonKey()
  final Color? color;

  @override
  String toString() {
    return 'TodoEditData(todoid: $todoid, date: $date, alarm: $alarm, alarmid: $alarmid, text: $text, complete: $complete, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoEditData &&
            (identical(other.todoid, todoid) || other.todoid == todoid) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.alarm, alarm) || other.alarm == alarm) &&
            (identical(other.alarmid, alarmid) || other.alarmid == alarmid) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.complete, complete) ||
                other.complete == complete) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, todoid, date, alarm, alarmid, text, complete, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoEditDataCopyWith<_$_TodoEditData> get copyWith =>
      __$$_TodoEditDataCopyWithImpl<_$_TodoEditData>(this, _$identity);
}

abstract class _TodoEditData implements TodoEditData {
  const factory _TodoEditData(
      {required final int todoid,
      required final DateTime date,
      final DateTime? alarm,
      final int? alarmid,
      required final String text,
      final bool complete,
      final Color? color}) = _$_TodoEditData;

  @override
  int get todoid;
  @override
  DateTime get date;
  @override
  DateTime? get alarm;
  @override
  int? get alarmid;
  @override
  String get text;
  @override
  bool get complete;
  @override
  Color? get color;
  @override
  @JsonKey(ignore: true)
  _$$_TodoEditDataCopyWith<_$_TodoEditData> get copyWith =>
      throw _privateConstructorUsedError;
}
