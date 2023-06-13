// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_viewdata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoViewData {
  int get todoid => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime? get alarm => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  bool get complete => throw _privateConstructorUsedError;
  Color? get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoViewDataCopyWith<TodoViewData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoViewDataCopyWith<$Res> {
  factory $TodoViewDataCopyWith(
          TodoViewData value, $Res Function(TodoViewData) then) =
      _$TodoViewDataCopyWithImpl<$Res, TodoViewData>;
  @useResult
  $Res call(
      {int todoid,
      int position,
      DateTime date,
      DateTime? alarm,
      String text,
      bool complete,
      Color? color});
}

/// @nodoc
class _$TodoViewDataCopyWithImpl<$Res, $Val extends TodoViewData>
    implements $TodoViewDataCopyWith<$Res> {
  _$TodoViewDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoid = null,
    Object? position = null,
    Object? date = null,
    Object? alarm = freezed,
    Object? text = null,
    Object? complete = null,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      todoid: null == todoid
          ? _value.todoid
          : todoid // ignore: cast_nullable_to_non_nullable
              as int,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      alarm: freezed == alarm
          ? _value.alarm
          : alarm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$$_TodoViewDataCopyWith<$Res>
    implements $TodoViewDataCopyWith<$Res> {
  factory _$$_TodoViewDataCopyWith(
          _$_TodoViewData value, $Res Function(_$_TodoViewData) then) =
      __$$_TodoViewDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int todoid,
      int position,
      DateTime date,
      DateTime? alarm,
      String text,
      bool complete,
      Color? color});
}

/// @nodoc
class __$$_TodoViewDataCopyWithImpl<$Res>
    extends _$TodoViewDataCopyWithImpl<$Res, _$_TodoViewData>
    implements _$$_TodoViewDataCopyWith<$Res> {
  __$$_TodoViewDataCopyWithImpl(
      _$_TodoViewData _value, $Res Function(_$_TodoViewData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoid = null,
    Object? position = null,
    Object? date = null,
    Object? alarm = freezed,
    Object? text = null,
    Object? complete = null,
    Object? color = freezed,
  }) {
    return _then(_$_TodoViewData(
      todoid: null == todoid
          ? _value.todoid
          : todoid // ignore: cast_nullable_to_non_nullable
              as int,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      alarm: freezed == alarm
          ? _value.alarm
          : alarm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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

class _$_TodoViewData implements _TodoViewData {
  const _$_TodoViewData(
      {required this.todoid,
      required this.position,
      required this.date,
      this.alarm = null,
      required this.text,
      this.complete = false,
      this.color = null});

  @override
  final int todoid;
  @override
  final int position;
  @override
  final DateTime date;
  @override
  @JsonKey()
  final DateTime? alarm;
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
    return 'TodoViewData(todoid: $todoid, position: $position, date: $date, alarm: $alarm, text: $text, complete: $complete, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoViewData &&
            (identical(other.todoid, todoid) || other.todoid == todoid) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.alarm, alarm) || other.alarm == alarm) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.complete, complete) ||
                other.complete == complete) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, todoid, position, date, alarm, text, complete, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoViewDataCopyWith<_$_TodoViewData> get copyWith =>
      __$$_TodoViewDataCopyWithImpl<_$_TodoViewData>(this, _$identity);
}

abstract class _TodoViewData implements TodoViewData {
  const factory _TodoViewData(
      {required final int todoid,
      required final int position,
      required final DateTime date,
      final DateTime? alarm,
      required final String text,
      final bool complete,
      final Color? color}) = _$_TodoViewData;

  @override
  int get todoid;
  @override
  int get position;
  @override
  DateTime get date;
  @override
  DateTime? get alarm;
  @override
  String get text;
  @override
  bool get complete;
  @override
  Color? get color;
  @override
  @JsonKey(ignore: true)
  _$$_TodoViewDataCopyWith<_$_TodoViewData> get copyWith =>
      throw _privateConstructorUsedError;
}
