import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:todo_flutter/data/repository/hive_todo_repo.dart';
import 'package:todo_flutter/domain/repository/todo_repo.dart';
import 'package:todo_flutter/hive/hive_registrar.g.dart';
import 'package:todo_flutter/presentation/pages/home_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapters();

  await Hive.openBox('todoBox');
  final todoRepo = HiveTodoRepo(Hive.box('todoBox'));

  runApp(MyApp(todoRepo: todoRepo));
}

class MyApp extends StatelessWidget {
  final TodoRepo todoRepo;

  const MyApp({super.key, required this.todoRepo});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage(todoRepo: todoRepo));
  }
}
