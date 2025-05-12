import 'package:flutter/material.dart';
import 'package:todo2/core/constants.dart';
import 'package:todo2/presentation/views/task_screen.dart';

Route? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case taskScreen:
      return MaterialPageRoute(
        builder: (context) => const TaskScreen(),
      );
    
    default:
      MaterialPageRoute(
        builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text("Error"),
            ),
          );
        },
      );
  }
  return null;
}
