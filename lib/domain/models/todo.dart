class Todo {
  final String id;
  final String text;
  final bool isCompleted;
  final String? projectId;

  Todo({
    required this.id,
    required this.text,
    this.isCompleted = false,
    this.projectId,
  });

  Todo copyWith({String? id, String? text, bool? isCompleted, String? projectId}) {
    return Todo(
      id: id ?? this.id,
      text: text ?? this.text,
      isCompleted: isCompleted ?? this.isCompleted,
      projectId: projectId ?? this.projectId,
    );
  }

  Todo toogleCompletion() {
    return copyWith(isCompleted: !isCompleted);
  }
}
