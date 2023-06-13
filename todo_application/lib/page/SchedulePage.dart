import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_application/ui/SfCalender.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_application/provider.dart';
import 'package:todo_application/value/todo_viewdata.dart';

class TodoSchedulePage extends HookConsumerWidget{
  const TodoSchedulePage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final todoListAsync = ref.watch(todoListProvider);

      return Scaffold(
      body: todoListAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('エラーが発生しました')),
        
        data: (todos) {
          return TodoScheduleView(todos: todos);
        },
        
      ),
      );
  }

}