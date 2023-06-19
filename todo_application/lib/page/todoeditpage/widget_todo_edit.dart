import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_application/ui/widget_list.dart';
import 'package:todo_application/value/todo_editdata.dart';
import 'package:todo_application/ui/widget_button.dart';
import 'package:todo_application/provider.dart';


final editPageStateProvider = StateNotifierProvider.autoDispose<EditPageStateNotifier,TodoEditData>((ref) {
  return EditPageStateNotifier();
});

 class EditPageStateNotifier extends StateNotifier<TodoEditData>{
  EditPageStateNotifier(): super(TodoEditData(
    todoid: 1, date: DateTime.now(), text: ''));

    void setStates(TodoEditData data){
      state = data;
    }

    void setColor(Color color){
      print('${color}');
      state = state.copyWith(color: color);
    }

    void setAlarmState(DateTime? alarm){
      print('setalarmstate');
      state = state.copyWith(alarm: alarm);
    }

    void setDateState(DateTime date){
      state = state.copyWith(date: date);
    }
    
    void setAlarm(bool set){
      state = state.copyWith(setAlarm: set);
    }
 }

class TodoEditWidgets extends HookConsumerWidget{
  TodoEditWidgets({required this.todo});

  final TodoEditData todo;

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageState = ref.watch(editPageStateProvider);
    final setState = ref.watch(editPageStateProvider.notifier);

    textController.text = todo.text;

    return Scaffold(
      appBar: AppBar(
        title: Text('編集画面'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: textController,
          ),
          ButtonBar(
            children: [
                DatePickerButton(date: todo.date, onDateSelected: (pickedDate){
                  setState.setDateState(pickedDate);
                }),

                ColorPickerButton(color: PageState.color,onColorSelected: ((pickedColor) {
                  setState.setColor(pickedColor);
                  print('pressbutton');
                })),

                ElevatedButton(
                  child: const Text('保存'),
                    onPressed: (){
                      ref.watch(todoRepositoryProvider).updateTodotext(todo.todoid, textController.text);
                      ref.watch(todoRepositoryProvider).updateTodoDate(todo.todoid, PageState.date);
                      ref.watch(todoRepositoryProvider).updateTodoColor(todo.todoid, PageState.color);
                      if(PageState.setAlarm){

                        if(todo.alarmid != null){
                          print('setalarm');
                          ref.watch(todoRepositoryProvider).updateAlarmTime(todo.alarmid!, PageState.alarm!);
                        }else{
                          print('setalarm');
                          ref.watch(todoRepositoryProvider).addAlarm(todo.todoid, PageState.alarm!);
                        }
                      }else{
                        print('alarm_null');
                      }
                      ref.refresh(todoListProvider);
                      Navigator.of(//MyTodoApp内にMainTabPageを表示したページに移動
                        context).pop();
                  },
                ),
            ],
          ),

          ExpansionTileButton(title: Text('アラーム設定'), 
          widget: AlarmListTile(
            alarmid: todo.alarmid, 
            time: todo.alarm,
            onDateSelected: (pickedDate){
              setState.setAlarm(true);
              final newAlarmDate = DateTime(pickedDate.year, pickedDate.month, pickedDate.day, PageState.alarm!.hour, PageState.alarm!.minute);
              setState.setAlarmState(newAlarmDate);
            }, 
            onTimeSelected: (pickedTime){
              setState.setAlarm(true);
              setState.setAlarmState(pickedTime);
            },
            onDateTimeSelected: (pickedDateTime){
              setState.setAlarm(true);
              print('settime');
              setState.setAlarmState(pickedDateTime);
            },
            )

          ),
        ],
      )
    );
  }

}