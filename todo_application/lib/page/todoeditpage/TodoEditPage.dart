import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_application/provider.dart';
import 'package:todo_application/page/todoeditpage/widget_todo_edit.dart';
import 'package:todo_application/value/todo_editdata.dart';
import 'package:todo_application/ui/widget_button.dart';
import 'package:todo_application/ui/widget_list.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:todo_application/todo_repository.dart';

class TodoEditPage extends HookConsumerWidget {
  TodoEditPage({required this.todoid});

  final int todoid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoEditDataAsync = ref.watch(todoProvider(todoid));
    final setState = ref.watch(editPageStateProvider.notifier);

    Future.microtask((){
      todoEditDataAsync.when(data: (todo){
          setState.setStates(todo);
          if(todo.alarm == null){
            setState.setAlarmState(DateTime.now());
           print('alarmtime_null');
          }
      }, 
      error: ((error, stackTrace) {}), 
      loading: (){});
    });


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