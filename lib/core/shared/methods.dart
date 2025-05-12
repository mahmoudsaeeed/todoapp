import 'package:hive_flutter/hive_flutter.dart';

import '../../features/task/data/model/task_model.dart';

class TaskBox {
  static int getTheNextValidIndexInBox(Box<TaskModel> box) {
  if (box.isEmpty) return 0;

  final keys = box.keys.cast<int>();
  return keys.reduce((a, b) => a > b ? a : b) + 1;
}


  static int getTheCurrentTaskIndexInBox(Box<TaskModel> box, int taskId) {
    if (box.isNotEmpty) {
      final keys = box.keys.cast<int>();
      return keys.singleWhere(
        (key) {
          return box.get(key)!.id == taskId;
        },
      );
    } else {
      return -1;
    }
  }
}
