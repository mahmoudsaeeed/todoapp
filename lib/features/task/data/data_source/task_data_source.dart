import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo2/core/keys.dart';
import 'package:todo2/features/task/data/model/task_model.dart';

class TaskDataSource {
  final Box<TaskModel> box = Hive.box<TaskModel>(MyKeys.taskBoxKey);

  Future<int> add(TaskModel model) async {
    return await box.add(model);
  }


  Future<void> deleteAt(int index) async {
    box.deleteAt(index);
  }


  List<TaskModel> getAll() {
    return box.values.toList();
  }


  TaskModel? getAt(int index) {
    return box.getAt(index);
  }
}
