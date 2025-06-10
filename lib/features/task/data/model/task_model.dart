class TaskModel {
  final String id;
  final String title;
  final String? description;
  final String? dueDate;
  bool isCompleted;
  final String createdAt;
  final String? categoryName;
  // final int categoryColor;

  TaskModel( {
    required this.id,
    required this.title,
    this.description,
    this.dueDate,
    this.isCompleted = false,
    required this.createdAt,
    required this.categoryName,
    // required this.categoryColor,
  });
}
