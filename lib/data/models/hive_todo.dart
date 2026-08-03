import 'package:todo_flutter/domain/models/todo.dart';

class HiveTodo {
  final String id;
  final String text;
  final bool isCompleted;
  final String? projectId;

  HiveTodo({required this.id, required this.text, required this.isCompleted, this.projectId});

  Todo toDomain() {
    return Todo(id: id, text: text, isCompleted: isCompleted, projectId: projectId);
  }

  static HiveTodo fromDomain(Todo todo) {
    return HiveTodo(
      id: todo.id,
      text: todo.text,
      isCompleted: todo.isCompleted,
      projectId: todo.projectId,
    );
  }
}
