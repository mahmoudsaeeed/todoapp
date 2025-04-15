import 'package:flutter/material.dart';
import 'package:todo2/core/constants.dart';
import 'package:todo2/presentation/views/home_screen.dart';

class MyRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
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
}
