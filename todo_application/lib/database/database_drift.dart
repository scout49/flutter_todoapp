import 'package:drift/drift.dart';
import 'package:drift/native.dart';  //追加
import 'package:path/path.dart' as p;  //追加
import 'package:path_provider/path_provider.dart';  //追加
import 'dart:io';

part 'database_drift.g.dart';


//テーブルの定義を変更した時はこのコマンドを実行すること！
//flutter pub run build_runner build  

class Todos extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  DateTimeColumn get date => dateTime()();
  BoolColumn get iscomplete => boolean().withDefault(const Constant(false))();
  IntColumn get color => integer().withDefault(const Constant(0))();
}

class Positions extends Table{
  IntColumn get position => integer()();
  IntColumn get todoid => integer().references(Todos, #id)();
}

class Alarms extends Table{
  IntColumn get alarmid => integer().autoIncrement()();
  IntColumn get todoid => integer().references(Todos, #id)();
  DateTimeColumn get time => dateTime()();
  IntColumn get isalarm => integer()(); 
}

class TodoWithAlarm {
  TodoWithAlarm(this.todo, this.alarm);

  final Todo todo;
  final Alarm alarm;
}


@DriftDatabase(tables: [Todos, Positions, Alarms])
class LocalDatabase extends _$LocalDatabase{

  LocalDatabase(): super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {//マイグレーション処理
    return MigrationStrategy(
      onCreate: (Migrator m)async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to)async {
        if(from <2){//ver2未満の時
          await m.addColumn(todos, todos.color);
        }
      },
    );
  }

  Stream<List<Todo>> watchEntries(){
    return (select(todos)).watch();
  }

/*
  Stream<List<TodoWithAlarm>> todoWithAlarm(){
    final query = select(todos).join([
      leftOuterJoin(todos, todos.id.equalsExp(alarms.todoid)),
    ]);
  }
*/

  Future<List<Todo>> get allTodoEntries => select(todos).get();


  Future<List<Todo>> fetchTodos(){
    return (select(todos)).get();
  }

  Future<Todo> fetchTodoById(int todoid){
    return (select(todos)..where((tbl) => tbl.id.equals(todoid))).getSingle();
  }

  Future<List<Position>> fetchPositions(){
    return (select(positions)).get();
  }

  Future<Position> fetchPositionById(int todoid){
    return (select(positions)..where((tbl) => tbl.todoid.equals(todoid))).getSingle();
  }

  Future<List<Alarm>> fetchAlarms(){
    return (select(alarms)).get();
  }

  Future<Alarm?> fetchAlarmById(int todoid){
    return (select(alarms)..where((tbl) => tbl.todoid.equals(todoid))).getSingleOrNull();
  }

  Future<List<Alarm>> fetchAllAlarmById(int todoid){
    return (select(alarms)..where((tbl) => tbl.todoid.equals(todoid))).get();
  }

  Future<int> addTodo(String text, DateTime date, bool complete) async{
    final todoId = await into(todos).insert(TodosCompanion(title: Value(text), date: Value(date), iscomplete: Value(complete)));
    await into(positions).insert(PositionsCompanion(position: Value(todoId), todoid: Value(todoId)));
    return todoId;
  }

  Future<void> deleteTodo(int id) async{
    await (delete(todos)..where((tbl) => tbl.id.equals(id))).go();
    await (delete(positions)..where((tbl) => tbl.todoid.equals(id))).go();
    await (delete(alarms)..where((tbl) => tbl.todoid.equals(id))).go();
  }

  Future<void> updateTodo(int id, String text, DateTime date,bool complete, int color){
    return (update(todos)..where((tbl) => tbl.id.equals(id))).write(TodosCompanion(title: Value(text), date: Value(date), iscomplete: Value(complete), color: Value(color)));
  }

  Future<void> updateTodotext(int id, String text){
    return (update(todos)..where((tbl) => tbl.id.equals(id))).write(TodosCompanion(title: Value(text)));
  }

  Future<void> updateTodocomplete(int id, bool complete){
    return (update(todos)..where((tbl) => tbl.id.equals(id))).write(TodosCompanion(iscomplete: Value(complete)));
  }

  Future<void> updateTododate(int id, DateTime date){
    return (update(todos)..where((tbl) => tbl.id.equals(id))).write(TodosCompanion(date: Value(date)));
  }

  Future<void>updateTodoColor(int id, int color){
    return (update(todos)..where((tbl) => tbl.id.equals(id))).write(TodosCompanion(color: Value(color)));
  }

  Future<void> updatePosition(int id, int pos){
    return (update(positions)..where((tbl) => tbl.todoid.equals(id))).write(PositionsCompanion(position: Value(pos)));
  }

  Future<void> addAlarm(int id ,DateTime time, int isalarm){
    return into(alarms).insert(AlarmsCompanion(todoid: Value(id), time: Value(time), isalarm: Value(isalarm)));
  }

  Future<void> deleteAlarm(int id){
    return (delete(alarms)..where((tbl) => tbl.alarmid.equals(id))).go();
  }

  Future<void>updateAlarmTime(int id, DateTime time){
    return (update(alarms)..where((tbl) => tbl.alarmid.equals(id))).write(AlarmsCompanion(time: Value(time)));
  }


}


LazyDatabase _openConnection(){
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
});
}