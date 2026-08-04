import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanoid_plus/nanoid_plus.dart';
import 'package:todo_flutter/domain/models/todo.dart';
import 'package:todo_flutter/domain/repository/todo_repo.dart';
import 'package:todo_flutter/presentation/bloc/todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepo todoRepo;

  TodoCubit({required this.todoRepo}) : super(const TodoLoading()) {
    loadTodos();
  }

  Future<void> loadTodos() async {
    try {
      final todoList = await todoRepo.getTodos();

      emit(TodoLoaded(todoList));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> addTodo(String text, String? projectId) async {
    if (text.isEmpty) return;

    try {
      final newTodo = Todo(
        id: const Nanoid().urlSafe(length: 10),
        text: text,
        projectId: projectId,
      );

      await todoRepo.addTodo(newTodo);
      loadTodos();
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> deleteTodo(Todo todo) async {
    try {
      await todoRepo.deleteTodo(todo);

      loadTodos();
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> updateTodo(String id, String text, [String? projectId]) async {
    Todo todo = Todo(id: id, text: text, projectId: projectId);

    try {
      await todoRepo.updateTodo(todo);

      loadTodos();
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> toggleCompletion(Todo todo) async {
    try {
      final updateTodo = todo.toogleCompletion();

      await todoRepo.updateTodo(updateTodo);

      loadTodos();
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }
}
