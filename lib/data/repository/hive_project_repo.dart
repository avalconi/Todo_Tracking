import 'package:hive_ce/hive_ce.dart';
import 'package:todo_flutter/data/models/hive_project.dart';
import 'package:todo_flutter/domain/models/project.dart';
import 'package:todo_flutter/domain/repository/project_repo.dart';

class HiveProjectRepo implements ProjectRepo {
  final Box box;

  HiveProjectRepo(this.box);

  @override
  Future<List<Project>> getProjects() async {
    return box.values.cast<HiveProject>().map((e) => e.toDomain()).toList();
  }

  @override
  Future<void> addProject(Project newProject) async {
    return box.put(
      newProject.id.toString(),
      HiveProject.fromDomain(newProject),
    );
  }

  @override
  Future<void> renameProject(Project project) async {
    return box.put(project.id.toString(), HiveProject.fromDomain(project));
  }

  @override
  Future<void> deleteProject(Project project) async {
    return box.delete(project.id.toString());
  }
}
