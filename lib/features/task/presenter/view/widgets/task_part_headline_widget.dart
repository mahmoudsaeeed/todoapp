import 'package:flutter/widgets.dart';
import 'package:todo2/core/shared/style.dart';

import 'add_task/add_task_icon_widget.dart';

class TaskPartHeadlineWidget extends StatelessWidget {
  const TaskPartHeadlineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Tasks",
            style: FontsStyle.h2,
          ),
          AddTaskIconWidget(),
        ],
      ),
    );
  }
}
