import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/features/task/data/repo/task_repo.dart';

part 'delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit({required this.repo}) : super(DeleteTaskInitial());
  final TaskRepo repo;

  deleteTask({required int taskId}) {
    
    repo.deleteModel(taskId);
  }
}
