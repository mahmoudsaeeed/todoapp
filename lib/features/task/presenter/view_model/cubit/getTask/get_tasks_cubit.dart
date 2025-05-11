import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/features/task/data/model/task_model.dart';
import 'package:todo2/features/task/data/repo/task_repo.dart';

part 'get_tasks_state.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  GetTasksCubit({required this.repo}) : super(GetTasksInitial());
  final TaskRepo repo;

  getFilteredData({String? categoryName}) {
    emit(GetTasksLoading());
    try {
      if (categoryName == null) {
        emit(GetTasksSuccess(tasks: repo.getAllModels()));
      }
      else {
        final tasks = repo.getFilteredData(categoryName: categoryName);
        emit(GetTasksSuccess(tasks: tasks));
      }
    } catch (e) {
      emit(GetTasksFailed());
    }
  }
}
