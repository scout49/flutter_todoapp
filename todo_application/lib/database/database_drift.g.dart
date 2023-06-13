// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_drift.dart';

// ignore_for_file: type=lint
class $TodosTable extends Todos with TableInfo<$TodosTable, Todo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _iscompleteMeta =
      const VerificationMeta('iscomplete');
  @override
  late final GeneratedColumn<bool> iscomplete =
      GeneratedColumn<bool>('iscomplete', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("iscomplete" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
      'color', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [id, title, date, iscomplete, color];
  @override
  String get aliasedName => _alias ?? 'todos';
  @override
  String get actualTableName => 'todos';
  @override
  VerificationContext validateIntegrity(Insertable<Todo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('iscomplete')) {
      context.handle(
          _iscompleteMeta,
          iscomplete.isAcceptableOrUnknown(
              data['iscomplete']!, _iscompleteMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Todo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Todo(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      iscomplete: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}iscomplete'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color'])!,
    );
  }

  @override
  $TodosTable createAlias(String alias) {
    return $TodosTable(attachedDatabase, alias);
  }
}

class Todo extends DataClass implements Insertable<Todo> {
  final int id;
  final String title;
  final DateTime date;
  final bool iscomplete;
  final int color;
  const Todo(
      {required this.id,
      required this.title,
      required this.date,
      required this.iscomplete,
      required this.color});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['date'] = Variable<DateTime>(date);
    map['iscomplete'] = Variable<bool>(iscomplete);
    map['color'] = Variable<int>(color);
    return map;
  }

  TodosCompanion toCompanion(bool nullToAbsent) {
    return TodosCompanion(
      id: Value(id),
      title: Value(title),
      date: Value(date),
      iscomplete: Value(iscomplete),
      color: Value(color),
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Todo(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      date: serializer.fromJson<DateTime>(json['date']),
      iscomplete: serializer.fromJson<bool>(json['iscomplete']),
      color: serializer.fromJson<int>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'date': serializer.toJson<DateTime>(date),
      'iscomplete': serializer.toJson<bool>(iscomplete),
      'color': serializer.toJson<int>(color),
    };
  }

  Todo copyWith(
          {int? id,
          String? title,
          DateTime? date,
          bool? iscomplete,
          int? color}) =>
      Todo(
        id: id ?? this.id,
        title: title ?? this.title,
        date: date ?? this.date,
        iscomplete: iscomplete ?? this.iscomplete,
        color: color ?? this.color,
      );
  @override
  String toString() {
    return (StringBuffer('Todo(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('date: $date, ')
          ..write('iscomplete: $iscomplete, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, date, iscomplete, color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          other.id == this.id &&
          other.title == this.title &&
          other.date == this.date &&
          other.iscomplete == this.iscomplete &&
          other.color == this.color);
}

class TodosCompanion extends UpdateCompanion<Todo> {
  final Value<int> id;
  final Value<String> title;
  final Value<DateTime> date;
  final Value<bool> iscomplete;
  final Value<int> color;
  const TodosCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.date = const Value.absent(),
    this.iscomplete = const Value.absent(),
    this.color = const Value.absent(),
  });
  TodosCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required DateTime date,
    this.iscomplete = const Value.absent(),
    this.color = const Value.absent(),
  })  : title = Value(title),
        date = Value(date);
  static Insertable<Todo> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<DateTime>? date,
    Expression<bool>? iscomplete,
    Expression<int>? color,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (date != null) 'date': date,
      if (iscomplete != null) 'iscomplete': iscomplete,
      if (color != null) 'color': color,
    });
  }

  TodosCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<DateTime>? date,
      Value<bool>? iscomplete,
      Value<int>? color}) {
    return TodosCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      iscomplete: iscomplete ?? this.iscomplete,
      color: color ?? this.color,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (iscomplete.present) {
      map['iscomplete'] = Variable<bool>(iscomplete.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('date: $date, ')
          ..write('iscomplete: $iscomplete, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }
}

class $PositionsTable extends Positions
    with TableInfo<$PositionsTable, Position> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PositionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _positionMeta =
      const VerificationMeta('position');
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _todoidMeta = const VerificationMeta('todoid');
  @override
  late final GeneratedColumn<int> todoid = GeneratedColumn<int>(
      'todoid', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES todos (id)'));
  @override
  List<GeneratedColumn> get $columns => [position, todoid];
  @override
  String get aliasedName => _alias ?? 'positions';
  @override
  String get actualTableName => 'positions';
  @override
  VerificationContext validateIntegrity(Insertable<Position> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('todoid')) {
      context.handle(_todoidMeta,
          todoid.isAcceptableOrUnknown(data['todoid']!, _todoidMeta));
    } else if (isInserting) {
      context.missing(_todoidMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Position map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Position(
      position: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}position'])!,
      todoid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}todoid'])!,
    );
  }

  @override
  $PositionsTable createAlias(String alias) {
    return $PositionsTable(attachedDatabase, alias);
  }
}

class Position extends DataClass implements Insertable<Position> {
  final int position;
  final int todoid;
  const Position({required this.position, required this.todoid});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['position'] = Variable<int>(position);
    map['todoid'] = Variable<int>(todoid);
    return map;
  }

  PositionsCompanion toCompanion(bool nullToAbsent) {
    return PositionsCompanion(
      position: Value(position),
      todoid: Value(todoid),
    );
  }

  factory Position.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Position(
      position: serializer.fromJson<int>(json['position']),
      todoid: serializer.fromJson<int>(json['todoid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'position': serializer.toJson<int>(position),
      'todoid': serializer.toJson<int>(todoid),
    };
  }

  Position copyWith({int? position, int? todoid}) => Position(
        position: position ?? this.position,
        todoid: todoid ?? this.todoid,
      );
  @override
  String toString() {
    return (StringBuffer('Position(')
          ..write('position: $position, ')
          ..write('todoid: $todoid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(position, todoid);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Position &&
          other.position == this.position &&
          other.todoid == this.todoid);
}

class PositionsCompanion extends UpdateCompanion<Position> {
  final Value<int> position;
  final Value<int> todoid;
  final Value<int> rowid;
  const PositionsCompanion({
    this.position = const Value.absent(),
    this.todoid = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PositionsCompanion.insert({
    required int position,
    required int todoid,
    this.rowid = const Value.absent(),
  })  : position = Value(position),
        todoid = Value(todoid);
  static Insertable<Position> custom({
    Expression<int>? position,
    Expression<int>? todoid,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (position != null) 'position': position,
      if (todoid != null) 'todoid': todoid,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PositionsCompanion copyWith(
      {Value<int>? position, Value<int>? todoid, Value<int>? rowid}) {
    return PositionsCompanion(
      position: position ?? this.position,
      todoid: todoid ?? this.todoid,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (todoid.present) {
      map['todoid'] = Variable<int>(todoid.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PositionsCompanion(')
          ..write('position: $position, ')
          ..write('todoid: $todoid, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AlarmsTable extends Alarms with TableInfo<$AlarmsTable, Alarm> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlarmsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _alarmidMeta =
      const VerificationMeta('alarmid');
  @override
  late final GeneratedColumn<int> alarmid = GeneratedColumn<int>(
      'alarmid', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _todoidMeta = const VerificationMeta('todoid');
  @override
  late final GeneratedColumn<int> todoid = GeneratedColumn<int>(
      'todoid', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES todos (id)'));
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<DateTime> time = GeneratedColumn<DateTime>(
      'time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isalarmMeta =
      const VerificationMeta('isalarm');
  @override
  late final GeneratedColumn<int> isalarm = GeneratedColumn<int>(
      'isalarm', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [alarmid, todoid, time, isalarm];
  @override
  String get aliasedName => _alias ?? 'alarms';
  @override
  String get actualTableName => 'alarms';
  @override
  VerificationContext validateIntegrity(Insertable<Alarm> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('alarmid')) {
      context.handle(_alarmidMeta,
          alarmid.isAcceptableOrUnknown(data['alarmid']!, _alarmidMeta));
    }
    if (data.containsKey('todoid')) {
      context.handle(_todoidMeta,
          todoid.isAcceptableOrUnknown(data['todoid']!, _todoidMeta));
    } else if (isInserting) {
      context.missing(_todoidMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('isalarm')) {
      context.handle(_isalarmMeta,
          isalarm.isAcceptableOrUnknown(data['isalarm']!, _isalarmMeta));
    } else if (isInserting) {
      context.missing(_isalarmMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {alarmid};
  @override
  Alarm map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Alarm(
      alarmid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}alarmid'])!,
      todoid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}todoid'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}time'])!,
      isalarm: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}isalarm'])!,
    );
  }

  @override
  $AlarmsTable createAlias(String alias) {
    return $AlarmsTable(attachedDatabase, alias);
  }
}

class Alarm extends DataClass implements Insertable<Alarm> {
  final int alarmid;
  final int todoid;
  final DateTime time;
  final int isalarm;
  const Alarm(
      {required this.alarmid,
      required this.todoid,
      required this.time,
      required this.isalarm});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['alarmid'] = Variable<int>(alarmid);
    map['todoid'] = Variable<int>(todoid);
    map['time'] = Variable<DateTime>(time);
    map['isalarm'] = Variable<int>(isalarm);
    return map;
  }

  AlarmsCompanion toCompanion(bool nullToAbsent) {
    return AlarmsCompanion(
      alarmid: Value(alarmid),
      todoid: Value(todoid),
      time: Value(time),
      isalarm: Value(isalarm),
    );
  }

  factory Alarm.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Alarm(
      alarmid: serializer.fromJson<int>(json['alarmid']),
      todoid: serializer.fromJson<int>(json['todoid']),
      time: serializer.fromJson<DateTime>(json['time']),
      isalarm: serializer.fromJson<int>(json['isalarm']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'alarmid': serializer.toJson<int>(alarmid),
      'todoid': serializer.toJson<int>(todoid),
      'time': serializer.toJson<DateTime>(time),
      'isalarm': serializer.toJson<int>(isalarm),
    };
  }

  Alarm copyWith({int? alarmid, int? todoid, DateTime? time, int? isalarm}) =>
      Alarm(
        alarmid: alarmid ?? this.alarmid,
        todoid: todoid ?? this.todoid,
        time: time ?? this.time,
        isalarm: isalarm ?? this.isalarm,
      );
  @override
  String toString() {
    return (StringBuffer('Alarm(')
          ..write('alarmid: $alarmid, ')
          ..write('todoid: $todoid, ')
          ..write('time: $time, ')
          ..write('isalarm: $isalarm')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(alarmid, todoid, time, isalarm);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Alarm &&
          other.alarmid == this.alarmid &&
          other.todoid == this.todoid &&
          other.time == this.time &&
          other.isalarm == this.isalarm);
}

class AlarmsCompanion extends UpdateCompanion<Alarm> {
  final Value<int> alarmid;
  final Value<int> todoid;
  final Value<DateTime> time;
  final Value<int> isalarm;
  const AlarmsCompanion({
    this.alarmid = const Value.absent(),
    this.todoid = const Value.absent(),
    this.time = const Value.absent(),
    this.isalarm = const Value.absent(),
  });
  AlarmsCompanion.insert({
    this.alarmid = const Value.absent(),
    required int todoid,
    required DateTime time,
    required int isalarm,
  })  : todoid = Value(todoid),
        time = Value(time),
        isalarm = Value(isalarm);
  static Insertable<Alarm> custom({
    Expression<int>? alarmid,
    Expression<int>? todoid,
    Expression<DateTime>? time,
    Expression<int>? isalarm,
  }) {
    return RawValuesInsertable({
      if (alarmid != null) 'alarmid': alarmid,
      if (todoid != null) 'todoid': todoid,
      if (time != null) 'time': time,
      if (isalarm != null) 'isalarm': isalarm,
    });
  }

  AlarmsCompanion copyWith(
      {Value<int>? alarmid,
      Value<int>? todoid,
      Value<DateTime>? time,
      Value<int>? isalarm}) {
    return AlarmsCompanion(
      alarmid: alarmid ?? this.alarmid,
      todoid: todoid ?? this.todoid,
      time: time ?? this.time,
      isalarm: isalarm ?? this.isalarm,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (alarmid.present) {
      map['alarmid'] = Variable<int>(alarmid.value);
    }
    if (todoid.present) {
      map['todoid'] = Variable<int>(todoid.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    if (isalarm.present) {
      map['isalarm'] = Variable<int>(isalarm.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlarmsCompanion(')
          ..write('alarmid: $alarmid, ')
          ..write('todoid: $todoid, ')
          ..write('time: $time, ')
          ..write('isalarm: $isalarm')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  late final $TodosTable todos = $TodosTable(this);
  late final $PositionsTable positions = $PositionsTable(this);
  late final $AlarmsTable alarms = $AlarmsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [todos, positions, alarms];
}
