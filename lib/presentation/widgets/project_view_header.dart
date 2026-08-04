import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/presentation/bloc/project_cubit.dart';
import 'package:todo_flutter/presentation/widgets/project_text_dialog.dart';

class ProjectViewHeader extends StatelessWidget {
  const ProjectViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          const Text(
            'Project',
            style: TextStyle(fontWeight: .bold, fontSize: 30),
          ),
          IconButton(
            onPressed: () => _showProjectDialog(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  void _showProjectDialog(BuildContext context) async {
    final projectCubit = context.read<ProjectCubit>();
    final result = await showDialog<String>(
      context: context,
      builder: (_) => const ProjectTextDialog(),
    );
    if (result != null) {
      await projectCubit.addProject(result);
    }
  }
}
