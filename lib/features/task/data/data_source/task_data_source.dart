import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo2/core/keys.dart';
import 'package:todo2/features/task/data/model/task_model.dart';

class TaskDataSource {
  final Box<TaskModel> box = Hive.box<TaskModel>(MyKeys.taskBoxKey);

  Future<int> add(TaskModel model) async {
    return await box.add(model);
  }

  Future<void> delete(int taskIndex) async {
    final int taskKey = box.keyAt(taskIndex);
    box.delete(taskKey);
  }

  List<TaskModel> getAll() {
    return box.values.toList();
  }

  TaskModel? getAt(int index) {
    return box.getAt(index);
  }

  Future<void> deleteWhere({
    required String categoryName,
  }) async {
    final keys = box.keys.where(
      (key) {
        final task = box.get(key);
        return task?.categoryName == categoryName;
      },
    ).toList();

    log("You will remove tasks that has keys $keys");
    await box.deleteAll(keys);
  }
}
