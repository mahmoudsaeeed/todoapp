import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/features/category/data/model/category_model.dart';
import 'package:todo2/features/category/data/repo/category_repo.dart';

import '../../../../../../core/constants.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit({required this.repo}) : super(GetCategoriesInitial());
  final CategoryRepo repo;

   List<CategoryModel> getAllCategories() {
    emit(GetCategoriesLoading());
    List<CategoryModel> cates = [defaultCategory];
    try {
      cates.addAll(repo.getAllModels());
      emit(GetCategoriesSuccess(categories: cates));
      return cates;
    } catch (e) {
      emit(GetCategoriesFailed(e: e.runtimeType));
      return cates;
    }
  }
}
