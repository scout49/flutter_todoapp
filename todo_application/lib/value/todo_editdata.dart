import 'package:flutter/material.dart';
import'package:freezed_annotation/freezed_annotation.dart';

part 'todo_editdata.freezed.dart';


@freezed
class TodoEditData with _$TodoEditData {

  const factory TodoEditData({
    required int todoid,
    required DateTime date,
    @Default(null)DateTime? alarm,
    @Default(null)int? alarmid,
    required String text,
    @Default(false) bool complete,
    @Default(Colors.transparent) Color color,
    @Default(false)bool setAlarm,
  }) = _TodoEditData;
}