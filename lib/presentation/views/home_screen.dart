import 'package:flutter/material.dart';
import 'package:todo2/presentation/widgets/categoryPart/add_category_icon_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AddCategoryIconWidget(),
      ),
    );
  }
}
