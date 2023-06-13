import 'package:todo_application/database/database_drift.dart';
import 'package:todo_application/value/todo_editdata.dart';
import 'package:todo_application/value/todo_viewdata.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Color? getColorFromInt(int? colorval){
  final vis = 100;
  switch(colorval){   
    case 1:
    return Colors.green[vis];

    case 2:
      return Colors.yellow[vis];

    case 3:
      return Colors.red[vis];

    default:
      return null;
  }
}

int getIntFromColor(Color? color){

  switch(color){   
    case Colors.green:
    return 1;

    case Colors.yellow:
      return 2;

    case Colors.red:
      return 3;

    default:
      return 0;
  }
}

class TodoRepository{
  const TodoRepository({required this.database});
  final LocalDatabase database;

  Future<List<TodoViewData>> fetchTodos() async{
    final todos = await database.fetchTodos();
    final positions = await database.fetchPositions();
    final alarms = await database.fetchAlarms();

    return todos.map((todo) {
    final position = positions.firstWhere((pos) => pos.todoid == todo.id); // todoとpositionを結合
    final alarm = alarms.firstWhereOrNull((alarm) => alarm.todoid == todo.id)?.time;

      return TodoViewData(
        todoid: todo.id,
        position: position.position,
        date: todo.date,
        text: todo.title,
        complete: todo.iscomplete,
        alarm: alarm,
        color: getColorFromInt(todo.color),
      );
    }).toList();
  }

  Future<TodoEditData> fetchTodoById(int todoid) async{
    final todo = await database.fetchTodoById(todoid);
    //final alarm = await database.fetchAlarmById(todoid);
    final alarms = await database.fetchAlarms();
    final alarm = alarms.firstWhereOrNull((alarm) => alarm.todoid == todo.id)?.time;
    final alarmid = alarms.firstWhereOrNull((alarm) => alarm.todoid == todo.id)?.alarmid;

    print('fetchTodoList');

    return TodoEditData(
      todoid: todoid, 
      date: todo.date, 
      text: todo.title,
      alarm: alarm,
      alarmid: alarmid,
      complete: todo.iscomplete,
      color: getColorFromInt(todo.color),
    );
  }

  Future<void> addTodo(String text, DateTime date) async{
    await database.addTodo(text,date,false);
    await fetchTodos();
  }

  Future<void> deleteTodo(int id)async{
    await database.deleteTodo(id);
    await fetchTodos();
  }

  Future<void> deleteAlarm(int id)async{
    await database.deleteAlarm(id);
  }

  Future<void>updateTodotext(int id, String text)async{
    await database.updateTodotext(id, text);
  }

  Future<void>updateTodoColor(int id, Color? color)async{
    final colorval = getIntFromColor(color);
    await database.updateTodoColor(id, colorval);
  }

  Future<void>updateAlarmTime(int id, DateTime time)async{
    await database.updateAlarmTime(id, time);
    print('updatealarm');
  }

  Future<void>updateTodoComplete(int id, bool complete)async{
    await database.updateTodocomplete(id, !complete);
  }

  Future<void>updateTodoDate(int id, DateTime date)async{
    await database.updateTododate(id, date);
  }

  Future<void>addAlarm(int id, DateTime time)async{
    await database.addAlarm(id, time, 1);
    print('addAlarm');
  }

  Future<void> reorderTodos(int oldid, int newid)async{
    final newiddata = await database.fetchPositionById(newid);//position上書き前の値を取得
    final oldiddata = await database.fetchPositionById(oldid);
    print('todoReorder');
    await database.updatePosition(oldid, newiddata.position);
    await database.updatePosition(newid, oldiddata.position);
  }


}