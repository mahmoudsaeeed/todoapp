import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/features/task/data/repo/task_repo.dart';


part 'delete_tasks_where_category_state.dart';

class DeleteTasksWhereCategoryCubit
    extends Cubit<DeleteTasksWhereCategoryState> {
  DeleteTasksWhereCategoryCubit({required this.repo})
      : super(DeleteTasksWhereCategoryInitial());
  final TaskRepo repo;

 Future<void> deleteWhere({required String categoryName}) async{
    await repo.deleteWhere(categoryName: categoryName);
  }
}
