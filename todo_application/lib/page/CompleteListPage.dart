import 'package:flutter/material.dart';
import 'package:todo_application/ui/widget_list.dart';
import 'package:todo_application/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CompleteTodoListPage extends HookConsumerWidget {
  const CompleteTodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoListAsync = ref.watch(completedTodoProvider);
    final listNotifier = ref.watch(selectedDateProvider);

    return Scaffold(
      body: todoListAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('エラーが発生しました')),
        data: (todos) {
          //final filteredTodos = filterTodoList(todos,listNotifier.selecteddate);
          return DismissibleReorderbleListView(todos: todos);
          //return DismissibleReorderbleListView_test();
          //return TodoCalenderView(todos: todos);
        },
      ),
    );
  }

}