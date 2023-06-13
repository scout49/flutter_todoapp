import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_application/provider.dart';
import 'package:todo_application/ui/todo_editwidget.dart';
import 'package:todo_application/value/todo_editdata.dart';
import 'package:todo_application/ui/widget_button.dart';
import 'package:todo_application/ui/WidgetList.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:todo_application/todo_repository.dart';

class TodoEditPage extends HookConsumerWidget {
  TodoEditPage({required this.todoid});

  final int todoid;

  final List<Widget> color = const <Widget>[
    Text('なし'),
    Text('緑'),
    Text('黄'),
    Text('赤')
  ];


  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoEditDataAsync = ref.watch(todoProvider(todoid));

    return Scaffold(
      body: todoEditDataAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('エラーが発生しました')),
        data: (todo) {
          return TodoEditWidgets(todo: todo);
        },
      ),
    );
  }
}


/*
final todoEditData = snapshot.data!;
          textController.text = todoEditData.text;
          var selectDate = todoEditData.date;
          var setAlarm = false;
          var alarmTime = todoEditData.alarm;
          if(alarmTime == null){
            alarmTime = DateTime.now();
            print('alarmtime_null');
          }

          return Scaffold(
            appBar: AppBar(
              title: Text('編集画面'),
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: textController,
                    onChanged: (text) {
                      // テキスト変更時の処理
                    },
                  ),
                  // ボタンウィジェットなどの追加部分
                  ButtonBar(
                    children: [
                    ToggleButtons(
                      children: color, 
                      isSelected: _selectedColor,
                      onPressed: (int index){
                        getColorFromInt(index);
                      },
                    ),
                    ElevatedButton(
                      onPressed: (){
                        DatePicker.showDateTimePicker(context,
                          showTitleActions: true,
                          minTime: DateTime.now(),
                          onChanged: (date){
                            alarmTime = date;
                            },
                          onConfirm: (date){
                            alarmTime = date;
                            setAlarm = true;
                          },
                          currentTime: alarmTime,locale: LocaleType.jp,
                        );
                      }, 
                      child: const Icon(Icons.alarm_rounded)
                    ),

                    DatePickerButton(date: todoEditData.date, onDateSelected: (pickedDate){
                      selectDate = pickedDate;
                    }),



                    ElevatedButton(
                      child: const Text('保存'),
                      onPressed: (){
                        ref.watch(todoRepositoryProvider).updateTodotext(todoid, textController.text);
                        ref.watch(todoRepositoryProvider).updateTodoDate(todoid, selectDate);
                        if(setAlarm){
                          print('setalarm');
                          if(todoEditData.alarmid != null){
                            ref.watch(todoRepositoryProvider).updateAlarmTime(todoEditData.alarmid!, alarmTime!);
                          }else{
                            ref.watch(todoRepositoryProvider).addAlarm(todoid, alarmTime!);
                          }
                        }
                        ref.refresh(todoListProvider);
                        Navigator.of(//MyTodoApp内にMainTabPageを表示したページに移動
                          context).pop();
                      },
                    ),
                    ],
                  ),

                  ExpansionTileButton(title: Text('アラーム設定'), 
                  widget: AlarmListTile(alarmid: todoEditData.alarmid,
                                        time: todoEditData.alarm,
                                        onDateSelected: (pickedDate) {
                                          alarmTime = DateTime(pickedDate.year,pickedDate.month,pickedDate.day,alarmTime!.hour,alarmTime!.minute);
                                        },
                                        onTimeSelected: (pickedTime) {
                                          alarmTime = pickedTime;
                                        },
                                      )),
                ],
              ),
            ),
          );
        
*/