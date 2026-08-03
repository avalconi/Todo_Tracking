import 'package:hive_ce/hive_ce.dart';
import 'package:todo_flutter/data/models/hive_project.dart';
import 'package:todo_flutter/data/models/hive_todo.dart';

@GenerateAdapters([AdapterSpec<HiveTodo>(), AdapterSpec<HiveProject>()])
part 'hive_adapters.g.dart';
