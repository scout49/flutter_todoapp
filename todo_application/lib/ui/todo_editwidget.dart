import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_application/todo_repository.dart';
import 'package:todo_application/ui/WidgetList.dart';
import 'package:todo_application/value/todo_editdata.dart';
import 'package:todo_application/ui/widget_button.dart';
import 'package:todo_application/provider.dart';


final selectColorProvider = StateNotifierProvider<SelectColorNotifier,Color?>((ref) {
  return SelectColorNotifier();
});

class SelectColorNotifier extends StateNotifier<Color?>{
  SelectColorNotifier() : super(null);

  void selectColor(Color? color){
    state = color;
  }
}


class TodoEditWidgets extends HookConsumerWidget{
  TodoEditWidgets({required this.todo});

  final TodoEditData todo;

  final colors = [
    getColorFromInt(0),
    getColorFromInt(1),
    getColorFromInt(2),
    getColorFromInt(3),
  ];


  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectColorAsync = ref.watch(selectColorProvider);
    textController.text = todo.text;
    var newtodo = todo;
    var setAlarm = false;
    if(newtodo.alarm == null){
      newtodo = newtodo.copyWith(alarm: DateTime.now());
      print('alarmtime_null');
    }

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
              /*
              DropdownButton(
                isExpanded: true,
                value: selectColorAsync,
                items: colors.asMap().entries.map((entry) {
                  final index = entry.key;
                  final color = entry.value;
                  return DropdownMenuItem(
                    value: color,
                    child: Text(colors[index].toString()), // 色の名前を表示
                  );
                }).toList(),
                onChanged: (selectedValue) {
                  ref.watch(selectColorProvider.notifier).selectColor(selectedValue);
                  newtodo = newtodo.copyWith(color: selectedValue);
                },
              ),
              */

                DatePickerButton(date: todo.date, onDateSelected: (pickedDate){
                  newtodo = newtodo.copyWith(date: pickedDate);
                }),

                ElevatedButton(
                  child: const Text('保存'),
                    onPressed: (){
                      ref.watch(todoRepositoryProvider).updateTodotext(todo.todoid, textController.text);
                      ref.watch(todoRepositoryProvider).updateTodoDate(todo.todoid, newtodo.date);
                      if(setAlarm){
                        print('setalarm');
                        if(todo.alarmid != null){
                          ref.watch(todoRepositoryProvider).updateAlarmTime(todo.alarmid!, newtodo.alarm!);
                        }else{
                          ref.watch(todoRepositoryProvider).addAlarm(todo.todoid, newtodo.alarm!);
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
          widget: AlarmListTile(
            alarmid: todo.alarmid, 
            time: todo.alarm, 
            onDateSelected: (pickedDate){
              final newAlarmDate = DateTime(pickedDate.year, pickedDate.month, pickedDate.day, newtodo.alarm!.hour, newtodo.alarm!.minute);
              newtodo = newtodo.copyWith(alarm: newAlarmDate);
            }, 
            onTimeSelected: (pickedTime){
              newtodo = newtodo.copyWith(alarm: pickedTime);
            },
            onDateTimeSelected: (pickedDateTime){
              setAlarm = true;
              newtodo = newtodo.copyWith(alarm: pickedDateTime);
            },
            )

          ),
        ],
      )
    );
  }

}