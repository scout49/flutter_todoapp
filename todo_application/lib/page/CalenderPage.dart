import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_application/ui/SfCalender.dart';
import 'package:flutter/material.dart';
import 'package:todo_application/provider.dart';


class TodoCalenderPage extends HookConsumerWidget{
  const TodoCalenderPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final todoListAsync = ref.watch(todoListProvider);
    final selectDate = ref.watch(selectedDateProvider).selecteddate;

      return Scaffold(
      body: SafeArea(
        child: todoListAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('エラーが発生しました')),
        
        data: (todos) {
          return TodoCalendarView(todos: todos,selectdate: selectDate);
        },
        
      ),)
      );
  }

}