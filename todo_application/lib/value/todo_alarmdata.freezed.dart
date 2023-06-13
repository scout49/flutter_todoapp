// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_alarmdata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoAlarmData {
  int get todoid => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime? get alarm => throw _privateConstructorUsedError;
  int? get alarmid => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  bool get complete => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoAlarmDataCopyWith<TodoAlarmData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoAlarmDataCopyWith<$Res> {
  factory $TodoAlarmDataCopyWith(
          TodoAlarmData value, $Res Function(TodoAlarmData) then) =
      _$TodoAlarmDataCopyWithImpl<$Res, TodoAlarmData>;
  @useResult
  $Res call(
      {int todoid,
      DateTime date,
      DateTime? alarm,
      int? alarmid,
      String text,
      bool complete});
}

/// @nodoc
class _$TodoAlarmDataCopyWithImpl<$Res, $Val extends TodoAlarmData>
    implements $TodoAlarmDataCopyWith<$Res> {
  _$TodoAlarmDataCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoAlarmDataCopyWith<$Res>
    implements $TodoAlarmDataCopyWith<$Res> {
  factory _$$_TodoAlarmDataCopyWith(
          _$_TodoAlarmData value, $Res Function(_$_TodoAlarmData) then) =
      __$$_TodoAlarmDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int todoid,
      DateTime date,
      DateTime? alarm,
      int? alarmid,
      String text,
      bool complete});
}

/// @nodoc
class __$$_TodoAlarmDataCopyWithImpl<$Res>
    extends _$TodoAlarmDataCopyWithImpl<$Res, _$_TodoAlarmData>
    implements _$$_TodoAlarmDataCopyWith<$Res> {
  __$$_TodoAlarmDataCopyWithImpl(
      _$_TodoAlarmData _value, $Res Function(_$_TodoAlarmData) _then)
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
  }) {
    return _then(_$_TodoAlarmData(
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
    ));
  }
}

/// @nodoc

class _$_TodoAlarmData implements _TodoAlarmData {
  const _$_TodoAlarmData(
      {required this.todoid,
      required this.date,
      this.alarm = null,
      this.alarmid = null,
      required this.text,
      this.complete = false});

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
  String toString() {
    return 'TodoAlarmData(todoid: $todoid, date: $date, alarm: $alarm, alarmid: $alarmid, text: $text, complete: $complete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoAlarmData &&
            (identical(other.todoid, todoid) || other.todoid == todoid) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.alarm, alarm) || other.alarm == alarm) &&
            (identical(other.alarmid, alarmid) || other.alarmid == alarmid) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.complete, complete) ||
                other.complete == complete));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, todoid, date, alarm, alarmid, text, complete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoAlarmDataCopyWith<_$_TodoAlarmData> get copyWith =>
      __$$_TodoAlarmDataCopyWithImpl<_$_TodoAlarmData>(this, _$identity);
}

abstract class _TodoAlarmData implements TodoAlarmData {
  const factory _TodoAlarmData(
      {required final int todoid,
      required final DateTime date,
      final DateTime? alarm,
      final int? alarmid,
      required final String text,
      final bool complete}) = _$_TodoAlarmData;

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
  @JsonKey(ignore: true)
  _$$_TodoAlarmDataCopyWith<_$_TodoAlarmData> get copyWith =>
      throw _privateConstructorUsedError;
}
