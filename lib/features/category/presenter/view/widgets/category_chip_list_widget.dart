
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todo2/features/category/presenter/view/widgets/category_chip_widget.dart';
import 'package:todo2/features/category/presenter/view_model/cubit/getCategories/get_categories_cubit.dart';

import '../../view_model/provider/category_choice_provider.dart';

class CategoryChipListWidget extends StatefulWidget {
  const CategoryChipListWidget({super.key});

  @override
  State<CategoryChipListWidget> createState() => _CategoryChipListWidgetState();
}

class _CategoryChipListWidgetState extends State<CategoryChipListWidget> {
  late int _selectedChipIndex;
  late String currentChoiseCategory;
  @override
  void initState() {
    super.initState();
    _selectedChipIndex = 0;
    final cubit = context.read<GetCategoriesCubit>();
    final categories = cubit.getAllCategories();

   
    Provider.of<CategoryChoiceProvider>(context, listen: false)
        .setSelectedChoice(categories[_selectedChipIndex].name);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
      // buildWhen: (previous, current) => current is GetCategoriesSuccess,

      builder: (context, state) {
        

        return state is GetCategoriesSuccess
            ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CategoryChipWidget(
                  // categoryModel: state.categories[index],
                  categoryIndex: _selectedChipIndex,
                  options: (state.categories),
                  onChanged: (chipChoisedIndex) {
                    setState(() {
                      _selectedChipIndex = chipChoisedIndex;

                      /// ? store categoryName choised in provider
                      Provider.of<CategoryChoiceProvider>(context,
                              listen: false)
                          .setSelectedChoice(
                              state.categories[_selectedChipIndex].name);
                    });
                  },
                ),
              )
            : Container();
      },
    );
  }
}
