import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_application/database/database_drift.dart';
import 'package:todo_application/todo_repository.dart';
import 'package:todo_application/value/todo_editdata.dart';
import 'package:todo_application/value/todo_viewdata.dart';
import 'package:todo_application/value/todolistpage_state.dart';


final localDatabaseProvider = Provider<LocalDatabase>((ref) => LocalDatabase());

final todoRepositoryProvider = Provider<TodoRepository>((ref) => TodoRepository(database: ref.watch(localDatabaseProvider)));

final todoListProvider = FutureProvider<List<TodoViewData>>((ref) => ref.watch(todoRepositoryProvider).fetchTodos());

final todoProvider = FutureProvider.autoDispose.family<TodoEditData,int>((ref, todoid) async {
   return ref.watch(todoRepositoryProvider).fetchTodoById(todoid);
  });

final selectedDateProvider = StateNotifierProvider<TodoListPageNotifier,TodoListPageState>((ref) {return TodoListPageNotifier();});

final SelectedTodoProvider = ChangeNotifierProvider((ref) => TodoSelectedNotifier());

final filteredTodoProvider = FutureProvider<List<TodoViewData>>((ref) async {
  final todos = await ref.watch(todoListProvider.future);
  final selectedDate = ref.watch(selectedDateProvider).selecteddate;

  final list1 = <TodoViewData>[];
  final list2 = <TodoViewData>[];

  // 条件に基づいてリストをフィルタリング
  for (final todo in todos) {
    final todoDate = DateTime(todo.date.year, todo.date.month, todo.date.day);
    final selectedDateWithoutTime = DateTime(selectedDate.year, selectedDate.month, selectedDate.day);

    if (todoDate.isAtSameMomentAs(selectedDateWithoutTime) && todo.complete == false) {
      list1.add(todo);
    } else if (todoDate.isBefore(selectedDateWithoutTime) && todo.complete == false) {
      list1.add(todo);
    } else if (todoDate.isAtSameMomentAs(selectedDateWithoutTime) && todo.complete == true) {
      list2.add(todo);
    }
  }

  // リストをソート
  list1.sort((a, b) => a.position.compareTo(b.position));
  list2.sort((a, b) => a.position.compareTo(b.position));

  print('filterList');

  // フィルタリングされたリストを結合して返す
  return [...list1, ...list2];
});


final completedTodoProvider = FutureProvider<List<TodoViewData>>((ref) async {
  final todos = await ref.watch(todoListProvider.future);

  final list1 = <TodoViewData>[];
  final list2 = <TodoViewData>[];

  // 条件に基づいてリストをフィルタリング
  for (final todo in todos) {
    if (todo.complete == true) {
      list1.add(todo);
    }
  }

  // リストをソート
  list1.sort((a, b) => a.date.compareTo(b.date));

  print('filterList');

  // フィルタリングされたリストを結合して返す
  return list1;
});

class TodoListPageNotifier extends StateNotifier<TodoListPageState>{
  TodoListPageNotifier() : super(TodoListPageState(selecteddate : DateTime.now()));

  void selectDate(DateTime? date){
    if(date != null){
      state = state.copyWith(selecteddate: date); 
      print('changeDate:$date');
    }
  }
}

class TodoSelectedNotifier extends ChangeNotifier{
  var count = -1;
  int get selectId => count;

  void setId(int id){
    count = id;
    notifyListeners();
  }
  
  void deleteId(){
    count = -1;
    notifyListeners();
  }
}



/*
@Riverpod(keepAlive: true)
LocalDatabase localDataBase(LocalDatabaseRef ref){
  return LocalDatabase();
}

@riverpod
TodoRepository todoRepository(TodoRepositoryRef ref){
  return TodoRepository(database: ref.read(localDataBaseProvider));
}

@riverpod
Future<List<TodoViewData>> todoList(TodoListRef ref){
  return ref.read(todoRepositoryProvider);
}
*/