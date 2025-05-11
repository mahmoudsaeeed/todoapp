
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/features/task/data/model/task_model.dart';
import 'package:todo2/features/task/data/repo/task_repo.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit({required this.repo}) : super(AddTaskInitial());
  final TaskRepo repo;

  Future<void> addTask(TaskModel task) async {
    emit(AddTaskLoading());
    try {
      final index = await repo.addNewModel(task);
      emit(AddTaskSuccess(index: index));
    } catch (e) {
      emit(AddTaskFailed());
    }
  }
}
