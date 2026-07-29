import 'package:hive_ce/hive_ce.dart';
import 'package:todo_flutter/data/models/hive_todo.dart';

@GenerateAdapters([AdapterSpec<HiveTodo>()])
part 'hive_adapters.g.dart';
