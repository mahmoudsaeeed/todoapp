import 'package:flutter/material.dart';
import 'package:todo2/core/theme/custom_decorations.dart';
import 'package:todo2/features/category/presenter/view/widgets/add_category_icon_button_widget.dart';
import 'package:todo2/features/category/presenter/view/widgets/category_chip_list_widget.dart';

class CategoryPartWidget extends StatelessWidget {
  const CategoryPartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      // decoration: DecorationsStyle.categoryPartDecorationInHome,
      child: Container(
        margin: const EdgeInsets.only(left: 15),
        height: 150,
        decoration:
            (Theme.of(context).extension<CustomDecorations>()!).taskPartBox,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Category",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SingleChildScrollView(
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
