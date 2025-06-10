import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo2/core/keys.dart';
import 'package:todo2/features/category/data/model/category_model.dart';

class CategoryDataSource {
  late Box<CategoryModel> box;
  CategoryDataSource() {
    box = Hive.isBoxOpen(MyKeys.categoryBoxKey)
        ? Hive.box<CategoryModel>(MyKeys.categoryBoxKey)
        : Hive.openBox<CategoryModel>(MyKeys.categoryBoxKey)
            as Box<CategoryModel>;

    // box.clear();
  }
  Future<int> add(CategoryModel model) async {
    // final lastIndex = box.values.length;
    // log("categoryDataSource: color = ${model.color}");
    return await box.add(
      CategoryModel(
        id: model.id,
        name: model.name,
        color: model.color,
      ),
    );
  }

  CategoryModel? getAt(int index) {
    return box.getAt(index);
  }

  List<CategoryModel> getAll() {
    List<CategoryModel> categories = box.values.toList();

    return categories;
  }

Future<void> delete(int index) async {
  if (index <= 0) return; // منع حذف العنصر الثابت

  final catKey = box.keyAt(index - 1);
  await box.delete(catKey);
}
}
