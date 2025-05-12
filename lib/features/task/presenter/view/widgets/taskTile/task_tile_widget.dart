import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo2/core/constants.dart';
import 'package:todo2/core/di/dependency_injection.dart';
import 'package:todo2/core/methods/task_box_methods.dart';
import 'package:todo2/features/task/data/data_source/task_data_source.dart';
import 'package:todo2/features/task/data/model/task_model.dart';
import 'package:todo2/features/task/presenter/view_model/cubit/delete_task/delete_task_cubit.dart';
import 'package:todo2/features/task/presenter/view_model/cubit/getTask/get_tasks_cubit.dart';
import 'package:todo2/features/task/presenter/view_model/provider/task_time_provider.dart';
import 'package:todo2/features/task/presenter/view/widgets/taskTile/task_tile_time_widget.dart';

import '../../../../../../core/theme/custom_decorations.dart';

class TaskTileWidget extends StatefulWidget {
  const TaskTileWidget({super.key, required this.myTask});
  final TaskModel myTask;

  @override
  State<TaskTileWidget> createState() => _TaskTileWidgetState();
}

class _TaskTileWidgetState extends State<TaskTileWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TaskTimeProvider>(context, listen: false)
          .setDueDate(widget.myTask.dueDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log("TaskId : ${widget.myTask.id}");
        log("TaskIndex in box : ${TaskBox.getTheCurrentTaskIndexInBox(getIt<TaskDataSource>().box, widget.myTask.id)}");
      },
      child: Dismissible(
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) async {
          //? if direction is endToStart
          return await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title:  Text(
                "Are you sure ? ",
              style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              content: Text(
                "You want to delete the task [ ${widget.myTask.title} ]",
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                ElevatedButton(
                  // style: ButtonsStyle.buttonInDialog,
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text("delete"),
                ),
                ElevatedButton(
                  // style: ButtonsStyle.cancleInDialog,
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text("Cancle"),
                ),
              ],
            ),
          );
        },
        onDismissed: (direction) {
          context.read<DeleteTaskCubit>().deleteTask(taskId: widget.myTask.id);
          context.read<GetTasksCubit>().getFilteredData();

        },
        background: Container(
          color: Colors.red,
          child: const Icon(Icons.delete_forever_outlined),
        ),
        key: ObjectKey(widget.myTask),
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration:( Theme.of(context).extension<CustomDecorations>()!).taskTileBox,
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.myTask.categoryName ?? defaultCategory.name,
                ),
                Text(widget.myTask.isCompleted ? "Done" : "inProgress"),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.myTask.title),
                //TODO changeNotifier
                const TaskTileTimeWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
