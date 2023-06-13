import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todolistpage_state.freezed.dart';

@freezed
class TodoListPageState with _$TodoListPageState{
  const factory TodoListPageState({
    required DateTime selecteddate,
  }) = _TodoListPageState;
}