import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/domain/models/todo_dialog_result.dart';
import 'package:todo_flutter/presentation/bloc/project_cubit.dart';
import 'package:todo_flutter/presentation/bloc/todo_cubit.dart';
import 'package:todo_flutter/presentation/widgets/todo_text_dialog.dart';

class TodoViewHeader extends StatelessWidget {
  const TodoViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          const Text(
            'Todos',
            style: TextStyle(fontWeight: .bold, fontSize: 30),
          ),
          IconButton(
            onPressed: () => _showAddTodoDialog(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context) async {
    final todoCubit = context.read<TodoCubit>();
    final projects = context.read<ProjectCubit>().state;
    final result = await showDialog<TodoDialogResult>(
      context: context,
      builder: (_) => TodoTextDialog(projects: projects),
    );
    if (result != null) {
      await todoCubit.addTodo(result.text.toString(), result.projectId);
    }
  }
}
