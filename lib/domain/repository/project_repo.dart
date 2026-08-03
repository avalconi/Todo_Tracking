import 'package:todo_flutter/domain/models/project.dart';

abstract class ProjectRepo {
  Future<List<Project>> getProjects();

  Future<void> addProject(Project newProject);

  Future<void> renameProject(Project project);

  Future<void> deleteProject(Project project);
}
