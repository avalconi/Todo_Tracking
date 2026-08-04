import 'package:flutter/material.dart';
import 'package:todo_flutter/domain/models/project.dart';
import 'package:todo_flutter/domain/models/todo_dialog_result.dart';

class TodoTextDialog extends StatefulWidget {
  final String? editText;
  final List<Project> projects;
  final String? initialProjectId;

  const TodoTextDialog({
    super.key,
    this.editText,
    required this.projects,
    this.initialProjectId,
  });

  @override
  State<TodoTextDialog> createState() => _TodoTextDialogState();
}

class _TodoTextDialogState extends State<TodoTextDialog> {
  late final TextEditingController textController;
  String? selectedProjectId;

  @override
  void initState() {
    super.initState();

    textController = TextEditingController(text: widget.editText ?? '');

    selectedProjectId = widget.initialProjectId;
  }

  @override
  Widget build(BuildContext context) {
    bool isUpdate = widget.editText != null;

    return AlertDialog(
      title: Text(isUpdate ? ' Update Todo' : 'Add Todo'),
      content: Column(
        mainAxisSize: .min,
        children: [
          TextField(
            controller: textController,
            decoration: const InputDecoration(hintText: 'here...'),
            autofocus: true,
            onSubmitted: (value) => Navigator.pop(context),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            initialValue: selectedProjectId,
            decoration: const InputDecoration(labelText: 'Project'),
            items: [
              const DropdownMenuItem(value: null, child: Text('No Project')),
              ...widget.projects.map(
                (project) => DropdownMenuItem(
                  value: project.id,
                  child: Text(project.name),
                ),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedProjectId = value;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(
              context,
              TodoDialogResult(
                text: textController.text.trim(),
                projectId: selectedProjectId,
              ),
            );
          },
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          child: Text(isUpdate ? 'Update' : 'Add'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
