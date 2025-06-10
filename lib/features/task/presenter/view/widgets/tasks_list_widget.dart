import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todo2/core/di/dependency_injection.dart';
import 'package:todo2/features/task/data/repo/task_repo.dart';
import 'package:todo2/features/task/presenter/view_model/cubit/delete_task/delete_task_cubit.dart';
import 'package:todo2/features/task/presenter/view_model/cubit/getTask/get_tasks_cubit.dart';
import 'package:todo2/features/task/presenter/view_model/provider/task_time_provider.dart';
import 'package:todo2/features/task/presenter/view/widgets/taskTile/task_dismissible_widget.dart';

class TasksListWidget extends StatefulWidget {
  const TasksListWidget({super.key});

  @override
  State<TasksListWidget> createState() => _TasksListWidgetState();
}

class _TasksListWidgetState extends State<TasksListWidget> {
  @override
  void initState() {
    super.initState();

    context.read<GetTasksCubit>().getFilteredData();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GetTasksCubit, GetTasksState>(
        builder: (context, state) {
          return state is GetTasksSuccess
              ? ListView.builder(
                  // shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  // itemExtent: 100,

                  itemCount: (state).tasks.length,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider(
                        key: ValueKey(state.tasks[index].id),
                        create: (context) => TaskTimeProvider(),
                        child: BlocProvider(
                          create: (context) =>
                              DeleteTaskCubit(repo: getIt<TaskRepo>()),
                          child: TaskWidget(
                            myTask: (state).tasks[index],
                            taskIndex: index,
                          ),
                        ));
                  },
                )
              : const CircularProgressIndicator();
        },
      ),
    );
  }
}
