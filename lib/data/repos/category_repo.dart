import 'package:todo2/data/dataSource/abstract_hive_data_source.dart';
import 'package:todo2/data/models/categoryModel/category_model.dart';
import 'package:todo2/data/repos/abstract_repo.dart';

class CategoryRepo implements AbstractRepo<CategoryModel> {
  
  @override
  final HiveDataSource<CategoryModel> dataSource;

  CategoryRepo({required this.dataSource});

  @override
  Future<int> addNewModel(CategoryModel model) async {
    return await dataSource.add(model);
  }

  @override
  List<CategoryModel> getAllModels() {
    return dataSource.getAll();
  }
  @override
  Future<void> deleteModelAt(int index) async{
    await dataSource.deleteAt(index);
  }
}
