import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/presentation/cubits/getCategories/get_categories_cubit.dart';
import 'package:todo2/presentation/widgets/categoryPart/category_chip_widget.dart';

class CategoryChipListWidget extends StatefulWidget {
  const CategoryChipListWidget({super.key});

  @override
  State<CategoryChipListWidget> createState() => _CategoryChipListWidgetState();
}

class _CategoryChipListWidgetState extends State<CategoryChipListWidget> {

  @override
  void initState() {
    super.initState();
    context.read<GetCategoriesCubit>().getAllCategories();
  }
  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
      builder: (context, state) {
        return state is GetCategoriesSuccess ? Wrap(
          spacing: 5,
          children: List.generate(state.categories.length, (index) {
            return CategoryChipWidget(categoryModel: state.categories[index], categoryIndex: index);
          },),
        ) : Container();
      },
    );
  }
}