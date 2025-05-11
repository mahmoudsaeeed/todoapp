import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo2/core/constants.dart';
import 'package:todo2/features/task/data/model/task_model.dart';
import 'package:todo2/features/task/presenter/view_model/provider/task_time_provider.dart';
import 'package:todo2/features/task/presenter/view/widgets/taskTile/task_tile_time_widget.dart';

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
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(10),
      ),
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
    );
  }
}
