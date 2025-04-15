import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo2/data/models/categoryModel/category_model.dart';

class CategoryModelAdapter extends TypeAdapter<CategoryModel> {
  @override
  CategoryModel read(BinaryReader reader) {
    return CategoryModel(
        id: reader.readInt(),
        name: reader.readString(),
        color: reader.readInt());
  }

  @override
  int get typeId => 2;

  @override
  void write(BinaryWriter writer, CategoryModel obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.name);
    writer.write(obj.color);
  }
}
