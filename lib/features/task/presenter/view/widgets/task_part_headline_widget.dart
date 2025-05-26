import 'package:flutter/material.dart';

import 'add_task/add_task_icon_widget.dart';

class TaskPartHeadlineWidget extends StatelessWidget {
  const TaskPartHeadlineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Tasks",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const AddTaskIconWidget(),
        ],
      ),
    );
  }
}
