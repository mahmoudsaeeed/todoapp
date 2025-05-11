
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todo2/features/task/presenter/view_model/cubit/getTask/get_tasks_cubit.dart';
import 'package:todo2/features/task/presenter/view_model/provider/task_time_provider.dart';
import 'package:todo2/features/task/presenter/view/widgets/taskTile/task_tile_widget.dart';

class TasksListWidget extends StatefulWidget {
  const TasksListWidget({super.key});

  @override
  State<TasksListWidget> createState() => _TasksListWidgetState();
}

class _TasksListWidgetState extends State<TasksListWidget> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (timeStamp) {
    //   },
    // );
    BlocProvider.of<GetTasksCubit>(context, listen: false).getFilteredData();
  }

  @override
  Widget build(BuildContext context) {
    //TODO get all tasks cubit
    return BlocBuilder<GetTasksCubit, GetTasksState>(
      builder: (context, state) {
        return state is GetTasksSuccess
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: (state).tasks.length,
                itemBuilder: (context, index) {
                  
                  return ChangeNotifierProvider(
                      create: (context) => TaskTimeProvider(),
                      child: TaskTileWidget(myTask: (state).tasks[index]));
                },
              )
            : const CircularProgressIndicator();
      },
    );
  }
}
