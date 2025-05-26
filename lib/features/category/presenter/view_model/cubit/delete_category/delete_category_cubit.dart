
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/features/category/data/repo/category_repo.dart';

part 'delete_category_state.dart';

class DeleteCategoryCubit extends Cubit<DeleteCategoryState> {
  DeleteCategoryCubit({required this.repo}) : super(DeleteCategoryInitial());
  final CategoryRepo repo;
  deleteCategory({required int categoryId}) async {
   
      await repo.deleteModel(categoryId);
     
  }
}
