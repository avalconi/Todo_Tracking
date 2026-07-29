import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/domain/models/todo.dart';
import 'package:todo_flutter/presentation/bloc/todo_cubit.dart';
import 'package:todo_flutter/presentation/widgets/todo_tile.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  void _showAddTodoBox(BuildContext context) {
    final textController = TextEditingController();
    final todoCubit = context.read<TodoCubit>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(hintText: 'Enter Todo'),
        ),
        title: const Text('Add Todo'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              textController.clear();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final text = textController.text.trim();
              if (text.isEmpty) return;

              await todoCubit.addTodo(textController.text);

              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
            style: TextButton.styleFrom(backgroundColor: Theme.of(context).highlightColor),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTodoBox(context),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          if (todos.isEmpty) {
            return const Center(child: Text('No todo yet'));
          }
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return TodoTile(todo: todo);
            },
          );
        },
      ),
    );
  }
}
