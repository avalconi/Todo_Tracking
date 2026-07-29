
import 'package:todo_flutter/domain/models/todo.dart';

sealed class TodoState {
  const TodoState();
}

class TodoLoading extends TodoState {
  const TodoLoading();
}

class TodoLoaded extends TodoState {
  final List<Todo> todos;

  const TodoLoaded(this.todos);
}

class TodoError extends TodoState {
  final String message;
  
  const TodoError(this.message);
}

