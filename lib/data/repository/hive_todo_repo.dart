import 'package:hive_ce/hive_ce.dart';
import 'package:todo_flutter/data/models/hive_todo.dart';
import 'package:todo_flutter/domain/models/todo.dart';
import 'package:todo_flutter/domain/repository/todo_repo.dart';

class HiveTodoRepo implements TodoRepo {
  final Box box;

  HiveTodoRepo(this.box);

  @override
  Future<List<Todo>> getTodos() async {
    // final List<HiveTodo> todoList = (box.get('todo_list') as List?)?.cast<HiveTodo>() ?? [];

    return box.values.cast<HiveTodo>().map((e) => e.toDomain()).toList();
  }

  @override
  Future<void> addTodo(Todo newTodo) async {
    return box.put(newTodo.id.toString(), HiveTodo.fromDomain(newTodo));
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    return box.put(todo.id.toString(), HiveTodo.fromDomain(todo));
  }

  @override
  Future<void> deleteTodo(Todo todo) {
    return box.delete(todo.id.toString());
  }
}
