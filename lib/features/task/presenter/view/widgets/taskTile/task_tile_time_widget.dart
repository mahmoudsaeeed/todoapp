
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo2/features/task/presenter/view_model/provider/task_time_provider.dart';

class TaskTileTimeWidget extends StatefulWidget {
  const TaskTileTimeWidget({
    super.key,
  });
  @override
  State<TaskTileTimeWidget> createState() => _TaskTileTimeWidgetState();
}

class _TaskTileTimeWidgetState extends State<TaskTileTimeWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskTimeProvider>(
      builder: (context, value, child) {
        Provider.of<TaskTimeProvider>(context);
        return value.remainingTime != null
            ? CircleAvatar(
                child: Text(value.remainingTime!),
              )
            : Container();
      },
    );
  }
}
