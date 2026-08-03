import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/domain/repository/project_repo.dart';
import 'package:todo_flutter/domain/repository/todo_repo.dart';
import 'package:todo_flutter/presentation/bloc/project_cubit.dart';
import 'package:todo_flutter/presentation/bloc/todo_cubit.dart';
import 'package:todo_flutter/presentation/widgets/app_drawer.dart';
import 'package:todo_flutter/presentation/widgets/project_view.dart';
import 'package:todo_flutter/presentation/widgets/todo_text_dialog.dart';
import 'package:todo_flutter/presentation/widgets/todo_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoCubit>(
          create: (_) => TodoCubit(todoRepo: context.read<TodoRepo>()),
        ),
        BlocProvider<ProjectCubit>(
          create: (_) => ProjectCubit(projectRepo: context.read<ProjectRepo>()),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Tracking Todo', style: TextStyle(fontSize: 40)),
              centerTitle: true,
            ),
            floatingActionButton: FloatingActionButton(
              foregroundColor: Theme.of(context).colorScheme.inversePrimary,
              shape: const CircleBorder(),
              onPressed: () async {
                final todoCubit = context.read<TodoCubit>();
                final text = await showDialog(
                  context: context,
                  builder: (_) => const TodoTextDialog(),
                );
                if (text != null) {
                  await todoCubit.addTodo(text);
                }
              },
              child: const Icon(Icons.add),
            ),
          
            drawer: const AppDrawer(),
            body: const Column(
              children: [
                Expanded(child: TodoView()),
                Expanded(child: ProjectView()),
              ],
            ),
          );
        }
      ),
    );
  }
}
