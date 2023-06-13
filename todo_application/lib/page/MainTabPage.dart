import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:todo_application/page/TodoListPage.dart';
import 'package:todo_application/provider.dart';
import 'package:todo_application/page/CalenderPage.dart';
import 'package:todo_application/page/SchedulePage.dart';
import 'package:todo_application/ui/widget_button.dart';
import 'CompleteListPage.dart';

class MainTabPage extends HookConsumerWidget{
  const MainTabPage({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final selectDate = ref.watch(selectedDateProvider).selecteddate;

    return DefaultTabController(length: 4, child: Scaffold(
      appBar: AppBar(
        title: const Text('Todoアプリ'),
        actions:<Widget> [Icon(Icons.settings_applications)],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: const Icon(Icons.today_outlined),text: '${selectDate.month}/${selectDate.day}のTodo'),
              const Tab(icon: Icon(Icons.check_box), text: '完了したTodo'),
              const Tab(icon: Icon(Icons.calendar_month),text: '日付選択'),
              const Tab(icon: Icon(Icons.list_alt),text:'todo一覧')
            ],
            onTap: (int index){
              //ref.refresh(todoListProvider);
            },
          ),
        ),

        body: const TabBarView(children: [
          TodoListPage(),
          CompleteTodoListPage(),
          TodoCalenderPage(),
          TodoSchedulePage(),
        ]),

      ),
      );
  }


}