class TaskModel {
  final int id;
  final String title;
  final String? description;
  final String? dueDate;
  final bool isCompleted;
  final String createdAt;
  final String? categoryId; // التصنيف المرتبط بالمهمة
  final int? taskColor;

  TaskModel({
    required this.id,
    required this.title,
    this.description,
    this.dueDate,
    this.isCompleted = false,
    required this.createdAt,
    this.categoryId,
    this.taskColor,
  });
}
