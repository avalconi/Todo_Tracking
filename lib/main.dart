import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/core/database/hive_database.dart';
import 'package:todo_flutter/core/theme/theme.dart';
import 'package:todo_flutter/core/theme/theme_cubit.dart';
import 'package:todo_flutter/data/repository/hive_todo_repo.dart';
import 'package:todo_flutter/domain/repository/todo_repo.dart';
import 'package:todo_flutter/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDatabase.init();

  runApp(
    RepositoryProvider<TodoRepo>(
      create: (_) => HiveTodoRepo(HiveDatabase.todoBox),
      child: BlocProvider(create: (_) => ThemeCubit(), child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightMode,
          darkTheme: darkMode,
          themeMode: themeMode,
          home: const HomePage(),
        );
      },
    );
  }
}
