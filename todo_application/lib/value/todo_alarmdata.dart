import'package:freezed_annotation/freezed_annotation.dart';

part 'todo_alarmdata.freezed.dart';


@freezed
class TodoAlarmData with _$TodoAlarmData {//2023/6/9現在未使用、タスクに複数のアラームを設定した場合に使用予定

  const factory TodoAlarmData({
    required int todoid,
    required DateTime date,
    @Default(null)DateTime? alarm,
    @Default(null)int? alarmid,
    required String text,
    @Default(false) bool complete
  }) = _TodoAlarmData;
}