import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/presentation/bloc/todo_cubit.dart';
import 'package:todo_flutter/presentation/bloc/todo_state.dart';
import 'package:todo_flutter/presentation/widgets/todo_tile.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        if (state is TodoLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is TodoError) {
          return Center(child: Text(state.message));
        }

        if (state is TodoLoaded) {
          if (state.todos.isEmpty) {
            return const Center(child: Text('No todo yet'));
          }
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              final todo = state.todos[index];

              return TodoTile(todo: todo);
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
