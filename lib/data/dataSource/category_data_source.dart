import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo2/core/keys.dart';
import 'package:todo2/data/dataSource/abstract_hive_data_source.dart';
import 'package:todo2/data/models/categoryModel/category_model.dart';

class CategoryDataSource implements HiveDataSource<CategoryModel> {
  late Box<CategoryModel> box;
  CategoryDataSource() {

    box = Hive.isBoxOpen(MyKeys.categoryBoxKey)
        ? Hive.box<CategoryModel>(MyKeys.categoryBoxKey)
        : Hive.openBox<CategoryModel>(MyKeys.categoryBoxKey) as Box<CategoryModel>;
  }
  @override
  Future<int> add(CategoryModel model) async {

    return await box.add(
      CategoryModel(
        id: box.values.last.id + 1,
        name: model.name,
        color: model.color,
      ),
    );
  }

  @override
  CategoryModel? getAt(int index) {
    return box.getAt(index);
  }

  @override
  List<CategoryModel> getAll() {
    return box.values.toList();
  }

  @override
  Future<void> deleteAt(int index) async {
    await box.deleteAt(index);
  }
}
