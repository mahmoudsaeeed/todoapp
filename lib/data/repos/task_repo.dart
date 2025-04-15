import 'package:todo2/data/dataSource/abstract_hive_data_source.dart';
import 'package:todo2/data/models/taskModel/task_model.dart';
import 'package:todo2/data/repos/abstract_repo.dart';

class TaskRepo implements AbstractRepo<TaskModel> {
  @override
  final HiveDataSource<TaskModel> dataSource;

  TaskRepo({required this.dataSource});

  @override
  Future<int> addNewModel(TaskModel model) async {
    return await dataSource.add(model);
  }

  @override
  Future<void> deleteModelAt(int index) async {
    await dataSource.deleteAt(index);
  }

  @override
  List<TaskModel> getAllModels() {
    return dataSource.getAll();
  }
}
