import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_viewdata.freezed.dart';//  ファイル名.freezed.dart!!



@freezed
class TodoViewData with _$TodoViewData {

  const factory TodoViewData({
    required int todoid,
    required int position,
    required DateTime date,
    @Default(null)DateTime? alarm,
    required String text,
    @Default(false) bool complete,
    @Default(null) Color? color,
  })  = _TodoViewData;

}
