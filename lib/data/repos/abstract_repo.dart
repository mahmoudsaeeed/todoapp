import 'package:todo2/data/dataSource/abstract_hive_data_source.dart';

abstract class AbstractRepo<T> {
  
  final HiveDataSource<T> dataSource;

  AbstractRepo({required this.dataSource});

  Future<int> addNewModel(T model) async {
    return await dataSource.add(model);
  }

  List<T> getAllModels() {
    return dataSource.getAll();
  }

  Future<void> deleteModelAt(int index) async{
    await dataSource.deleteAt(index);
  }
}
