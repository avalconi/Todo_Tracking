import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/domain/models/todo.dart';
import 'package:todo_flutter/presentation/bloc/todo_cubit.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.text, style: TextStyle(decoration: todo.isCompleted ? .lineThrough : .none)),
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (value) => context.read<TodoCubit>().toggleCompletion(todo),
      ),
      trailing: IconButton(
        onPressed: () => context.read<TodoCubit>().deleteTodo(todo),
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
