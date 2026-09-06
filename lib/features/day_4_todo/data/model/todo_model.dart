class TodoModel {
  final String id;
  final String title;
  final String subTitle;
  final bool isCompleted;

  const TodoModel({
    required this.id,
    required this.title,
    required this.subTitle,
    this.isCompleted = false,
  });

  TodoModel copyWith({String? id, String? title, String? subTitle, bool? isCompleted}) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
