import 'package:flutter/material.dart';
import 'package:todo2/core/theme/custom_decorations.dart';
import 'package:todo2/features/task/presenter/view/widgets/task_part_headline_widget.dart';
import 'package:todo2/features/task/presenter/view/widgets/tasks_list_widget.dart';

class TasksPartWidget extends StatelessWidget {
  const TasksPartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          (Theme.of(context).extension<CustomDecorations>()!).taskPartBox,
      child: const Column(
        children: [
          TaskPartHeadlineWidget(),
          TasksListWidget(),
        ],
      ),
    );
  }
}
