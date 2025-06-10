import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo2/features/category/data/model/category_model.dart';

class CategoryModelAdapter extends TypeAdapter<CategoryModel> {
  @override
  CategoryModel read(BinaryReader reader) {
    return CategoryModel(
        id: reader.readString(),
        name: reader.readString(),
        color: reader.readInt());
  }

  @override
  int get typeId => 2;

  @override
  void write(BinaryWriter writer, CategoryModel obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.name);
    writer.writeInt(obj.color);
  }
}
