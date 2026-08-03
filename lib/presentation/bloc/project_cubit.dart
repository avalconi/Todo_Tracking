import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanoid_plus/nanoid_plus.dart';
import 'package:todo_flutter/domain/models/project.dart';
import 'package:todo_flutter/domain/repository/project_repo.dart';

class ProjectCubit extends Cubit<List<Project>> {
  final ProjectRepo projectRepo;

  ProjectCubit({required this.projectRepo}) : super([]) {
    loadProjects();
  }

  Future<void> loadProjects() async {
    final projectList = await projectRepo.getProjects();
    emit(projectList);
  }

  Future<void> addProject(String name) async {
    if (name.isEmpty) return;

    final newProject = Project(id: const Nanoid().urlSafe(length: 10), name: name);

    await projectRepo.addProject(newProject);
    loadProjects();
  }

  Future<void> deleteProject(Project project) async {
    await projectRepo.deleteProject(project);
    loadProjects();
  }

  Future<void> renameProject(String id, String newName) async {
    Project project = Project(id: id, name: newName);

    await projectRepo.renameProject(project);
    loadProjects();
  }
  

  }
