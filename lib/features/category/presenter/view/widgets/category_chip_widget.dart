import 'dart:developer';

import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:todo2/features/category/data/model/category_model.dart';

class CategoryChipWidget extends StatelessWidget {
  // final CategoryModel categoryModel;
  final int categoryIndex;
  final void Function(int) onChanged;
  final List<CategoryModel> options;

  const CategoryChipWidget({
    super.key,
    // required this.categoryModel,
    required this.categoryIndex,
    required this.onChanged,
    required this.options,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        log("Pressed long on chip $categoryIndex");
        
      },
      child: ChipsChoice<int>.single(
        value: categoryIndex,
        onChanged: onChanged,

        choiceItems: C2Choice.listFrom<int, CategoryModel>(
          source: options,
          value: (index, categoryModel) => index,
          label: (index, categoryModel) => categoryModel.name,
          style: (index, categoryModel) {
            Color myColor = Color(categoryModel.color);

            return C2ChipStyle.when(
              enabled: C2ChipStyle.toned(
                  backgroundColor: myColor,
                  backgroundOpacity: .3,
                  selectedStyle: C2ChipStyle.filled(
                    color: Color(categoryModel.color),
                  )),
            );
          },
        ),
        // choiceItems: List.generate(options.length, (index) {
        //   final category = options[index];
        //   return C2Choice<int>(
        //       value: index,
        //       label: category.name,
        //       style: const C2ChipStyle(
        //         backgroundColor: Colors.red,
        //       ));
        // }),

        // backgroundColor: Color(widget.categoryModel.color),
        // label: Text(widget.categoryModel.name),
        // selected: selectedChipIndex == widget.categoryIndex,

        // selectedColor: const Color(0xFF0D538D),
        // checkmarkColor: Colors.white,
        // showCheckmark: false,
        // onSelected: (deSelected) {
        //   setState(() {
        //     selectedChipIndex = deSelected ? widget.categoryIndex : null;
        //   });
        // },
      ),
    );
  }
}
