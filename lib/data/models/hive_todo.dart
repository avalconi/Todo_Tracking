import 'package:todo_flutter/domain/models/todo.dart';

class HiveTodo {
  final int id;
  final String text;
  final bool isCompleted;

  HiveTodo({required this.id, required this.text, required this.isCompleted});

  Todo toDomain() {
    return Todo(id: id, text: text, isCompleted: isCompleted);
  }

  static HiveTodo fromDomain(Todo todo) {
    return HiveTodo(id: todo.id, text: todo.text, isCompleted: todo.isCompleted);
  }
}
