import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/domain/repository/todo_repo.dart';
import 'package:todo_flutter/presentation/bloc/todo_cubit.dart';
import 'package:todo_flutter/presentation/widgets/todo_view.dart';

class HomePage extends StatelessWidget {
  final TodoRepo todoRepo;

  const HomePage({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => TodoCubit(todoRepo: todoRepo),
      child: const TodoView(),
    );
  }
}
