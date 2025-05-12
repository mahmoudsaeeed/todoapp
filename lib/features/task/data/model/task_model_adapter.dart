import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo2/features/task/data/model/task_model.dart';

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  TaskModel read(BinaryReader reader) {
    return TaskModel(
      id: reader.readInt(),
      title: reader.readString(),
      description: reader.read(),
      categoryName: reader.read(),
      createdAt: reader.readString(),
      isCompleted: reader.readBool(),
      dueDate: reader.read(),
    );
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.title);
    writer.write(obj.description);
    writer.write(obj.categoryName);
    writer.writeString(obj.createdAt);
    writer.writeBool(obj.isCompleted);
    writer.write(obj.dueDate);
  }
}
