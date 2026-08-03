import 'package:hive_ce/hive_ce.dart';
import 'package:todo_flutter/data/models/hive_todo.dart';
import 'package:todo_flutter/domain/models/project.dart';
import 'package:todo_flutter/domain/models/todo.dart';
import 'package:todo_flutter/domain/repository/todo_repo.dart';

class HiveTodoRepo implements TodoRepo {
  final Box box;

  HiveTodoRepo(this.box);

  @override
  Future<List<Todo>> getTodos() async {
    return box.values
        .cast<HiveTodo>()
        .map((element) => element.toDomain())
        .toList();
  }

  @override
  Future<List<Todo>> getTodosByProject(project) async {
    return box.values
        .cast<HiveTodo>()
        .where((element) => element.projectId == project.id)
        .map((element) => element.toDomain())
        .toList();
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
  Future<void> deleteTodo(Todo todo) async {
    return box.delete(todo.id.toString());
  }

  @override
  Future<void> completeAllByProject(Project project) async {
    final projectTodos = await getTodosByProject(project);

    for (final todo in projectTodos) {
      await box.put(
        todo.id.toString(),
        HiveTodo(
          id: todo.id,
          text: todo.text,
          isCompleted: true,
          projectId: todo.projectId,
        ),
      );
    }
  }
}
