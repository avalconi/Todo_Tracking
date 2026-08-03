import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:todo_flutter/data/models/hive_project.dart';
import 'package:todo_flutter/data/models/hive_todo.dart';
import 'package:todo_flutter/hive/hive_registrar.g.dart';

class HiveDatabase {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapters();
    await Hive.openBox<HiveTodo>('todoBox');
    await Hive.openBox<HiveProject>('projectBox');
  }

  static Box<HiveTodo> get todoBox => Hive.box<HiveTodo>('todoBox');
  static Box<HiveProject> get projectBox => Hive.box<HiveProject>('projectBox');
}
