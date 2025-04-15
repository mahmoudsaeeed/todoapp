import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo2/data/models/taskModel/task_model.dart';

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  TaskModel read(BinaryReader reader) {
    return TaskModel(
      id: reader.readInt(),
      title: reader.readString(),
      description: reader.readString(),
      categoryId: reader.readString(),
      createdAt: reader.readString(),
      isCompleted: reader.readBool(),
      dueDate: reader.readString(),
      taskColor: reader.readInt(),
    );
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.title);
    writer.write(obj.description);
    writer.write(obj.categoryId);
    writer.writeString(obj.createdAt);
    writer.writeBool(obj.isCompleted);
    writer.write(obj.dueDate);
    writer.write(obj.taskColor);
  }
}
