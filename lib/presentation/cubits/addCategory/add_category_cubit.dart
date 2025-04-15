import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/data/models/categoryModel/category_model.dart';
import 'package:todo2/data/repos/abstract_repo.dart';

part 'add_category_state.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit({required this.repo}) : super(AddCategoryInitial());
  final AbstractRepo<CategoryModel> repo;

  Future<void> addNewCategory(CategoryModel category) async {
    emit(AddCategoryLoading());
    try {
      int index = await repo.addNewModel(category);
      emit(AddCategorySuccess(lastIndex: index));

    } catch (e) {
      emit(AddCategoryFailed(e: e.runtimeType));
    }
  }
}
