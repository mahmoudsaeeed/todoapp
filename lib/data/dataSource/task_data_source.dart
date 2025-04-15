import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo2/core/keys.dart';
import 'package:todo2/data/dataSource/abstract_hive_data_source.dart';
import 'package:todo2/data/models/taskModel/task_model.dart';

class TaskDataSource implements HiveDataSource<TaskModel> {
  final Box<TaskModel> box = Hive.box<TaskModel>(MyKeys.taskBoxKey);
  @override
  Future<int> add(TaskModel model) async {
    return await box.add(model);
  }

  @override
  Future<void> deleteAt(int index) async {
    box.deleteAt(index);
  }

  @override
  List<TaskModel> getAll() {
    return box.values.toList();
  }

  @override
  TaskModel? getAt(int index) {
    return box.getAt(index);
  }
}
