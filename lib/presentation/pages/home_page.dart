import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/domain/repository/todo_repo.dart';
import 'package:todo_flutter/presentation/bloc/todo_cubit.dart';
import 'package:todo_flutter/presentation/widgets/app_drawer.dart';
import 'package:todo_flutter/presentation/widgets/todo_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes', style: TextStyle(fontSize: 40)),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: BlocProvider<TodoCubit>(
        create: (context) => TodoCubit(todoRepo: context.read<TodoRepo>()),
        child: const TodoView(),
      ),
    );
  }
}
