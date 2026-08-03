import 'package:flutter/material.dart';

class TodoTextDialog extends StatefulWidget {
  final String? editText;

  const TodoTextDialog({super.key, this.editText});

  @override
  State<TodoTextDialog> createState() => _TodoTextDialogState();
}

class _TodoTextDialogState extends State<TodoTextDialog> {
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: widget.editText ?? '');
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
          // DropdownButtonFormField(items: items, onChanged: onChanged)
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, textController.text.trim());
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
