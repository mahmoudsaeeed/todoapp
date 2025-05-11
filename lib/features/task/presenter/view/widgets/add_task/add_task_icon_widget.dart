import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/core/di.dart';
import 'package:todo2/features/category/presenter/view_model/cubit/getCategories/get_categories_cubit.dart';
import 'package:todo2/features/task/data/repo/task_repo.dart';
import 'package:todo2/features/task/presenter/view/widgets/add_task/add_task_dialog.dart';
import 'package:todo2/features/task/presenter/view_model/cubit/getTask/get_tasks_cubit.dart';

import '../../../view_model/cubit/add_task/add_task_cubit.dart';

class AddTaskIconWidget extends StatelessWidget {
  const AddTaskIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final getCategoriesCubit = context.read<GetCategoriesCubit>();
    final getTasksCubit = context.read<GetTasksCubit>();
    return IconButton(
      onPressed: () {
        // showBigDialog(context);
        // showDatePicker(
        //   context: context,
        //   firstDate: DateTime.now().subtract(const Duration(days: 5)),
        //   lastDate: DateTime(2030),
        // );
        showDialog(
          context: context,
          builder: (context) => MultiBlocProvider(
            providers: [
              /// ? GetCategoriesCubit used here to
              /// ? display the list of categories in Category Field in adding Task
              /// ? used .value bc I created it before in another widget
              BlocProvider<GetCategoriesCubit>.value(
                value: getCategoriesCubit,
              ),

              ///? used to refresh the list of tasks after add the task
              /// ? used .value bc I created it before in another widget

              BlocProvider<GetTasksCubit>.value(
                value: getTasksCubit,
              ),
              BlocProvider<AddTaskCubit>(
                create: (context) => AddTaskCubit(
                  repo: getIt<TaskRepo>(),
                ),
              ),
            ],
            child: Builder(builder: (context) {
              return const AddTaskDialog();
            }),
          ),
        );
      },
      icon: const Icon(Icons.add),
    );
  }
}
