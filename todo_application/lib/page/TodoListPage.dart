import 'package:flutter/material.dart';
import 'package:todo_application/ui/widget_list.dart';
import 'package:todo_application/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../ui/widget_button.dart';


class TodoListPage extends HookConsumerWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoListAsync = ref.watch(filteredTodoProvider);
    final listNotifier = ref.watch(selectedDateProvider);
    final selectDate = ref.watch(selectedDateProvider).selecteddate;

    return Scaffold(
      body: todoListAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('エラーが発生しました')),
        data: (todos) {
          //final filteredTodos = filterTodoList(todos,listNotifier.selecteddate);
          //return DismissibleReorderbleListView(todos: todos);
          return DismissibleReorderbleListView(todos : todos);
          //return TodoCalenderView(todos: todos);
        },
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // フローティングアクションボタンが押されたときの処理
          // Todoを追加する処理を実装してください
          ref.watch(todoRepositoryProvider).addTodo('', listNotifier.selecteddate);
          ref.refresh(todoListProvider);
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(child: Row(children: 
          <Widget>[
            DatePickerButton(
              date : selectDate,
              onDateSelected: (pickedDate) {
                ref.watch(selectedDateProvider.notifier).selectDate(pickedDate);
              },
            ),
            
          ],
          
        ),

        ),
    );
  }
}


/*
class _TodoListPageState extends State<TodoListPage> {
  List<String> items = List<String>.generate(20, (index) => 'アイテム $index');
  List<TodoViewData> todos = List<TodoViewData>.empty();
  var select = null;
  var count = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todoリスト'),
        /*bottom: const TabBar(
          tabs: <Widget>[
            Tab(
              text: '今日の予定',
            ),
            Tab(
              text: '直近の予定',
            ),

          ],
        ),
        */
      ),
      body: ReorderableListView(
        children: <Widget>[
          for (int index = 0; index < items.length; index += 1)
            TodoListTile(index)
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final String item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // フローティングアクションボタンが押されたときの処理
          setState(() {
            items.add('アイテム$count');
            count += 1;
          });

        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget TodoListTile(int index) {
    return Dismissible(
      key: ObjectKey(items[index]), // Dismissibleのキーは一意なものを指定すること！！
      onDismissed: (DismissDirection direction) {
        if(direction == DismissDirection.startToEnd){
          setState(() {
          items.removeAt(index);
          });
        }else{
          setState(() {
          items.removeAt(index);
          });
        }

      },
      direction: DismissDirection.horizontal,
      background: Container(
        color: Colors.green,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
              Icon(Icons.check)
          ],
          ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.delete)
            ],
          ),
      ),
      child: ListTile(
        title: Text(items[index]),
        subtitle: Text('Index[$index]'),
        trailing: const Icon(Icons.access_alarms),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TodoEditPage(index: index)
            ),
          );
        },

        selectedTileColor: Colors.lightBlue,
      ),
    );
  }
}
*/
/*
class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key, required this.title}): super(key:key);

  final String title;
  @override
  _TodoListPageState createState() => _TodoListPageState();

}

class _TodoListPageState extends State<TodoListPage> {
  List<String> items = List<String>.generate(20, (index) => 'アイテム $index');
  List<TodoViewData> todos = List<TodoViewData>.empty();
  var select = null;
  var count = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todoリスト'),
        /*bottom: const TabBar(
          tabs: <Widget>[
            Tab(
              text: '今日の予定',
            ),
            Tab(
              text: '直近の予定',
            ),

          ],
        ),
        */
      ),
      body: ReorderableListView(
        children: <Widget>[
          for (int index = 0; index < items.length; index += 1)
            TodoListTile(index)
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final String item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // フローティングアクションボタンが押されたときの処理
          setState(() {
            items.add('アイテム$count');
            count += 1;
          });

        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget TodoListTile(int index) {
    return Dismissible(
      key: ObjectKey(items[index]), // Dismissibleのキーは一意なものを指定すること！！
      onDismissed: (DismissDirection direction) {
        if(direction == DismissDirection.startToEnd){
          setState(() {
          items.removeAt(index);
          });
        }else{
          setState(() {
          items.removeAt(index);
          });
        }

      },
      direction: DismissDirection.horizontal,
      background: Container(
        color: Colors.green,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
              Icon(Icons.check)
          ],
          ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.delete)
            ],
          ),
      ),
      child: ListTile(
        title: Text(items[index]),
        subtitle: Text('Index[$index]'),
        trailing: const Icon(Icons.access_alarms),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TodoEditPage(index: index)
            ),
          );
        },

        selectedTileColor: Colors.lightBlue,
      ),
    );
  }
}


*/