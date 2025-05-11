import 'package:flutter/material.dart';
import 'package:todo2/features/task/presenter/view/widgets/add_task/add_task_icon_widget.dart';
import 'package:todo2/features/task/presenter/view/widgets/tasks_list_widget.dart';

class TasksPartWidget extends StatelessWidget {
  const TasksPartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AddTaskIconWidget(),
        TasksListWidget(),
      ],
    );
  }
}
