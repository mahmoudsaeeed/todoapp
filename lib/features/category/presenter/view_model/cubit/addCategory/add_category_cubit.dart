
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/features/category/data/model/category_model.dart';
import 'package:todo2/features/category/data/repo/category_repo.dart';

part 'add_category_state.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit({required this.repo}) : super(AddCategoryInitial());
  final CategoryRepo repo;

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
