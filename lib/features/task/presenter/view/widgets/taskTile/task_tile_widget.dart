import 'package:flutter/material.dart';
import 'package:todo2/core/constants.dart';
import 'package:todo2/features/task/data/model/task_model.dart';
import 'package:todo2/features/task/presenter/view/widgets/taskTile/task_tile_time_widget.dart';

class TaskTileWidget extends StatelessWidget {
  const TaskTileWidget({super.key, required this.myTask});
  final TaskModel myTask;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey<String>(myTask.id),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            myTask.categoryName ?? defaultCategory.name,
          ),
          Text(myTask.isCompleted ? "Done" : "inProgress"),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(myTask.title),
          //TODO changeNotifier
          const TaskTileTimeWidget(),
        ],
      ),
    );
  }
}
