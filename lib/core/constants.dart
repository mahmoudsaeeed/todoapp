import 'package:todo2/features/category/data/model/category_model.dart';

class Pages {
  static const String taskScreen = 'TaskScreen';
  static const String homeView = 'homeView';
  static const String noteScreen = 'noteScreen';
  static const String categoryScreen = 'categoryScreen';
}

CategoryModel defaultCategory = CategoryModel(name: 'none', color: 00000000);
const String themeKeyInPref = 'theme';
