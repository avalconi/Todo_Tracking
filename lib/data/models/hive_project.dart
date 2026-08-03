import 'package:todo_flutter/domain/models/project.dart';

class HiveProject {
  final String id;
  final String name;

  HiveProject({required this.id, required this.name});

  Project toDomain() {
    return Project(id: id, name: name);
  }

  static HiveProject fromDomain(Project project) {
    return HiveProject(id: project.id, name: project.name);
  }
}
