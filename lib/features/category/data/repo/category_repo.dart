import 'package:todo2/features/category/data/model/category_model.dart';
import 'package:todo2/features/category/data/data_source/category_data_source.dart';

class CategoryRepo {
  
  final CategoryDataSource dataSource;

  CategoryRepo({required this.dataSource});

  Future<int> addNewModel(CategoryModel model) async {
    return await dataSource.add(model);
  }

  List<CategoryModel> getAllModels() {
    return dataSource.getAll();
  }



  
  Future<void> deleteModel(int index) async{
    await dataSource.delete(index);
  }
}
