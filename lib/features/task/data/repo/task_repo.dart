import 'dart:developer';

import 'package:todo2/core/shared/methods.dart';
import 'package:todo2/features/task/data/data_source/task_data_source.dart';
import 'package:todo2/features/task/data/model/task_model.dart';

class TaskRepo {
  final TaskDataSource dataSource;

  TaskRepo({required this.dataSource});

  Future<int> addNewModel(TaskModel model) async {
    return await dataSource.add(model);
  }

  Future<void> deleteModel(int taskId) async {
    log("TaskRepo : delete : taskId : $taskId");
    final int taskIndex =
        TaskBox.getTheCurrentTaskIndexInBox(dataSource.box, taskId);
    log("TaskRepo : delete : taskIndex : $taskIndex");

    await dataSource.delete(taskIndex);
  }

  List<TaskModel> getAllModels({int? modelIndex}) {
    return dataSource.getAll();
  }

  ///? get all Tasks and then filtered it depending on [category name]
  List<TaskModel> getFilteredData({required String categoryName}) {
    final List<TaskModel> filteredData = dataSource
        .getAll()
        .where(
          (taskModel) => taskModel.categoryName == categoryName,
        )
        .toList();

    return filteredData;
  }
}
