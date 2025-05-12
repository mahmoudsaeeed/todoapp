import 'package:flutter/material.dart';
import 'package:todo2/core/shared/style.dart';
import 'package:todo2/features/category/presenter/view/widgets/add_category_icon_button_widget.dart';
import 'package:todo2/features/category/presenter/view/widgets/category_chip_list_widget.dart';

class CategoryPartWidget extends StatelessWidget {
  const CategoryPartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: DecorationsStyle.categoryPartDecorationInHome,
      child: Container(
        margin: const EdgeInsets.only(left: 15),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Category",
              style: FontsStyle.h2,
            ),
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
        ),
      ),
    );
  }
}
