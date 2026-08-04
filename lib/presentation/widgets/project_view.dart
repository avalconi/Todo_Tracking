import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/domain/models/project.dart';
import 'package:todo_flutter/presentation/bloc/project_cubit.dart';
import 'package:todo_flutter/presentation/widgets/project_view_header.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        const ProjectViewHeader(),

        const Divider(indent: 20, endIndent: 20),

        BlocBuilder<ProjectCubit, List<Project>>(
          builder: (context, projects) {
            if (projects.isEmpty) {
              return const Center(child: Text('No projects created'));
            } else {
              return Expanded(
                child: ListView.builder(
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    final project = projects[index];

                    return Text(project.name);
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}

