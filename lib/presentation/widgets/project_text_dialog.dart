import 'package:flutter/material.dart';

class ProjectTextDialog extends StatefulWidget {
  final String? editName;

  const ProjectTextDialog({super.key, this.editName});

  @override
  State<ProjectTextDialog> createState() => _ProjectTextDialogState();
}

class _ProjectTextDialogState extends State<ProjectTextDialog> {
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();

    textController = TextEditingController(text: widget.editName ?? '');
  }

  @override
  Widget build(BuildContext context) {
    bool isUpdate = widget.editName != null;

    return AlertDialog(
      title: Text(isUpdate ? ' Update Project' : 'Add Project'),
      content: Column(
        mainAxisSize: .min,
        children: [
          TextField(
            controller: textController,
            decoration: const InputDecoration(hintText: 'here...'),
            autofocus: true,
            onSubmitted: (value) => Navigator.pop(context),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, textController.text.trim()),

          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          child: Text(isUpdate ? 'Update' : 'Add'),
        ),
      ],
    );
  }
}
