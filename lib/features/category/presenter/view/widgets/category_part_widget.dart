
import 'package:flutter/material.dart';
import 'package:todo2/features/category/presenter/view/widgets/add_category_icon_button_widget.dart';
import 'package:todo2/features/category/presenter/view/widgets/category_chip_list_widget.dart';

class CategoryPartWidget extends StatelessWidget {
  const CategoryPartWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return const Column(
      children: [
        Text("Category"),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AddCategoryIconWidget(),
              CategoryChipListWidget(),
            ],
          ),
        )
      ],
    );
  }
}
