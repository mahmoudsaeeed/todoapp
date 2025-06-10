import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo2/features/task/data/model/task_model.dart';
import 'package:todo2/features/task/presenter/view/widgets/taskTile/task_tile_widget.dart';
import 'package:todo2/features/task/presenter/view_model/cubit/delete_task/delete_task_cubit.dart';
import 'package:todo2/features/task/presenter/view_model/cubit/getTask/get_tasks_cubit.dart';
import 'package:todo2/features/task/presenter/view_model/provider/task_time_provider.dart';

import '../../../../../../core/theme/custom_decorations.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget(
      {super.key, required this.myTask, required this.taskIndex});
  final TaskModel myTask;
  final int taskIndex;

  @override
  State<TaskWidget> createState() => _TaskTileWidgetState();
}

class _TaskTileWidgetState extends State<TaskWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // context.read<TaskTimeProvider>().setDueDate(widget.myTask.dueDate);
      Provider.of<TaskTimeProvider>(context, listen: false)
          .setDueDate(widget.myTask.dueDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: InkWell(
        onTap: () {
          log("task index : ${widget.taskIndex}");
          log("task Key : ${widget.myTask.id}");
        },
        child: Dismissible(
          direction: DismissDirection.endToStart,

//////////////////////////////////////////////////////////////////////////

          confirmDismiss: (direction) async {
            //? if direction is endToStart
            return await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
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

//////////////////////////////////////////////////////////////////////////

          onDismissed: (direction) {
            context
                .read<DeleteTaskCubit>()
                .deleteTask(taskId: widget.taskIndex);
            context.read<GetTasksCubit>().getFilteredData();
          },
          
//////////////////////////////////////////////////////////////////////////
          
          background: Container(
            color: Colors.red,
            child: const Icon(Icons.delete_forever_outlined),
          ),

//////////////////////////////////////////////////////////////////////////

          key: ObjectKey(widget.myTask),
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration:
                (Theme.of(context).extension<CustomDecorations>()!).taskTileBox,
            child: TaskTileWidget(myTask: widget.myTask,)
          ),
        ),
      ),
    );
  }
}
