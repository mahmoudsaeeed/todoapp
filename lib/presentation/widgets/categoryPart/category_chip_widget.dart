import 'package:flutter/material.dart';
import 'package:todo2/data/models/categoryModel/category_model.dart';

class CategoryChipWidget extends StatefulWidget {
  final CategoryModel categoryModel;
  final int categoryIndex;
  const CategoryChipWidget({
    super.key,
    required this.categoryModel, required this.categoryIndex,
  });

  @override
  State<CategoryChipWidget> createState() => _CategoryChipWidgetState();
}

class _CategoryChipWidgetState extends State<CategoryChipWidget> {
  int? isSelectedChip = 0;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(widget.categoryModel.name),
      selected: isSelectedChip == widget.categoryIndex,
      selectedColor: Color(widget.categoryModel.color),
      onSelected: (trigger) {
        setState(() {
          isSelectedChip = trigger ? widget.categoryIndex : null;
        });
      },
    );
  }
}
