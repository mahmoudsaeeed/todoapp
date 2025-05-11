
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/features/category/data/repo/category_repo.dart';

part 'get_custom_tasks_state.dart';

class GetCustomTasksCubit extends Cubit<GetCustomTasksState> {
  GetCustomTasksCubit({required this.repo}) : super(GetCustomTasksInitial());
  final CategoryRepo repo;

  getTasks(String? categoryChoised){
    
  }
}
