import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/data/models/categoryModel/category_model.dart';
import 'package:todo2/data/repos/abstract_repo.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit({required this.repo}) : super(GetCategoriesInitial());
  final AbstractRepo<CategoryModel> repo;

  void getAllCategories() {
    emit(GetCategoriesLoading());
    try {
      List<CategoryModel> cates = repo.getAllModels();
      emit(GetCategoriesSuccess(categories: cates));
    } catch (e) {
      emit(GetCategoriesFailed(e: e.runtimeType));
    }
  }
}
