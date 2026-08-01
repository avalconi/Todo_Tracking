import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/domain/models/todo.dart';
import 'package:todo_flutter/presentation/bloc/todo_cubit.dart';
import 'package:todo_flutter/presentation/widgets/todo_text_dialog.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    return ListTile(
      title: Text(
        todo.text,
        style: TextStyle(decoration: todo.isCompleted ? .lineThrough : .none),
      ),
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (value) => todoCubit.toggleCompletion(todo),
      ),
      trailing: Row(
        mainAxisSize: .min,
        children: [
          IconButton(
            onPressed: () async {
              final text = await showDialog(
                context: context,
                builder: (_) => TodoTextDialog(editText: todo.text),
              );
              if (text != null) {
                await todoCubit.updateTodo(todo.id, text);
              }
            },
            icon: const Icon(Icons.mode_edit_outline),
          ),
          IconButton(
            onPressed: () => todoCubit.deleteTodo(todo),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
