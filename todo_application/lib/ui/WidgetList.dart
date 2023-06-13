import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_application/provider.dart';
import 'package:todo_application/value/todo_viewdata.dart';
import 'package:todo_application/page/TodoEditPage.dart';
import 'widget_button.dart';
import 'widget_show.dart';





class TodoListTile extends HookConsumerWidget {
  const TodoListTile({
    required this.todo,
  });

  final TodoViewData todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectProvider = ref.watch(SelectedTodoProvider);

    return Column(
      children: [
        ListTile(
          leading: Visibility(visible : todo.complete , child: todo.complete == true? const Icon(Icons.done): const SizedBox.shrink()),
          title: todo.complete
              ? Text(todo.text, style: const TextStyle(decoration: TextDecoration.lineThrough))
              : Text(todo.text),
          subtitle: todo.alarm == null
              ? Row(children: [const Text('予定日:'), DateText(time: todo.date)])
              : Row(children: [
                  Text('予定日:'),
                  DateText(time: todo.date),
                  Text(' アラーム:'),
                  DateTimeText(time: todo.alarm!),
                ]),
          trailing: ifAlarm(todo.alarm),
          tileColor: todo.color,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TodoEditPage(todoid: todo.todoid),
              ),
            );
          },
          selected: selectProvider.selectId == todo.todoid,
        ),
        const Divider(height:0,), // Dividerを追加
      ],
    );
  }

  Widget ifAlarm(DateTime? alarm){
    if(alarm != null){
      if(alarm.compareTo(DateTime.now()) == -1){
        return const Icon(Icons.notification_important);
      }else{
        return const Icon(Icons.alarm);
      }
    }else{
      return const Icon(Icons.alarm_off_outlined);
    }
  }
}


class DismissibleReorderbleListView extends HookConsumerWidget {
  const DismissibleReorderbleListView({
    required this.todos
  });

  final List<TodoViewData> todos;

  @override
  Widget build(BuildContext context, WidgetRef ref){
    return ReorderableListView.builder(
        padding: const EdgeInsets.symmetric(horizontal:10),
        itemCount: todos.length,
        itemBuilder: (_, int index) {
          return Dismissible(
            key: Key('${todos[index].todoid}:${todos[index].complete}'),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                // 完了状態をトグルする処理を実装してください
                ref.watch(todoRepositoryProvider).updateTodoComplete(todos[index].todoid, todos[index].complete);
              } else {
                // Todoを削除する処理を実装してください
                ref.watch(todoRepositoryProvider).deleteTodo(todos[index].todoid);
              }

              ref.refresh(todoListProvider);//変更を反映
            },
            direction: DismissDirection.horizontal,
            background: Container(
              alignment: Alignment.centerLeft,
              color: Colors.green,
              child: const Icon(Icons.check, color: Colors.white,),
            ),
            secondaryBackground: Container(
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: TodoListTile(todo: todos[index]),
            //child: ListTile.divideTiles(context: context, tiles : TodoListTile(todo: todos[index])).
          );
        },
        onReorder: (int oldIndex, int newIndex) {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final oldId = todos[oldIndex].todoid;
          final newId = todos[newIndex].todoid;
          ref.watch(todoRepositoryProvider).reorderTodos(oldId, newId);

          print('onReorder');

          final TodoViewData item = todos.removeAt(oldIndex);
          todos.insert(newIndex,item);
          ref.watch(SelectedTodoProvider).deleteId();
        },
        onReorderStart: (int index){
          print('startReorder');
          final id = todos[index].todoid;
          ref.watch(SelectedTodoProvider).setId(id);
        },
      );
  }
}

class AlarmListTile extends HookConsumerWidget{
  const AlarmListTile({
    required this.alarmid,
    required this.time,
    required this.onDateSelected,
    required this.onTimeSelected,
    required this.onDateTimeSelected,
  });

  final int? alarmid;
  final DateTime? time;
  final Function(DateTime pickedDate) onDateSelected;
  final Function(DateTime pickedTime) onTimeSelected;
  final Function(DateTime pickedDateTime) onDateTimeSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    //final state = useState(0);    
    return Card(
      child: time == null ? 
      Column(children: <Widget>[
        const ListTile(title: Text('アラーム未設定です')),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            //Switch(value: state, onChanged: onChanged)
            DateTimePickerButton(alarm: DateTime.now(), onDateTimeSelected: onDateTimeSelected)
          ],
        ),
        ]):
      Column(children: <Widget>[
        ListTile(title: Text('アラーム設定時間 : $time')),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            DatePickerButton(date: time!, onDateSelected: onDateSelected),
            TimePickerButton(time: time!, onTimeSelected: onTimeSelected),
          ],
        ),

      ]),
    );
  }
}

class AnimatedListView extends HookConsumerWidget {
  const AnimatedListView({
    required this.todos
  });

  final List<TodoViewData> todos;

  @override
  Widget build(BuildContext context, WidgetRef ref){
    return AnimatedList(
        padding: const EdgeInsets.symmetric(horizontal:20),
        initialItemCount: todos.length,
        itemBuilder: (_, int index, Animation<double> animation) {
            return ListTile(title:Text('$todos'));
        },
      );
  }
}

class DismissibleReorderbleListView_test extends HookConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final todo = ref.watch(filteredTodoProvider);

    return todo.when(
      loading :() => const CircularProgressIndicator(),
      error: (err,stack) => Text('Error: $err'),
      data: (todos)     
      {return ReorderableListView.builder(
        padding: const EdgeInsets.symmetric(horizontal:20),
        itemCount: todos.length,
        itemBuilder: (_, int index) {
          return Dismissible(
            key: Key('${todos[index].todoid}:${todos[index].complete}'),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                // 完了状態をトグルする処理を実装してください
                ref.watch(todoRepositoryProvider).updateTodoComplete(todos[index].todoid, todos[index].complete);
              } else {
                // Todoを削除する処理を実装してください
                ref.watch(todoRepositoryProvider).deleteTodo(todos[index].todoid);
              }

              ref.refresh(todoRepositoryProvider);//変更を反映
            },
            direction: DismissDirection.horizontal,
            background: Container(
              alignment: Alignment.centerLeft,
              color: Colors.green,
              child: const Icon(Icons.check, color: Colors.white,),
            ),
            secondaryBackground: Container(
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: TodoListTile(todo: todos[index])
          );
        },
        onReorder: (int oldIndex, int newIndex) {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final oldId = todos[oldIndex].todoid;
          final newId = todos[newIndex].todoid;
          ref.watch(todoRepositoryProvider).reorderTodos(oldId, newId);

          print('onReorder');

          final TodoViewData item = todos.removeAt(oldIndex);
          todos.insert(newIndex,item);
          ref.watch(SelectedTodoProvider).deleteId();
        },
        onReorderStart: (int index){
          print('startReorder');
          final id = todos[index].todoid;
          ref.watch(SelectedTodoProvider).setId(id);
        },);
        },
      );
  }
}