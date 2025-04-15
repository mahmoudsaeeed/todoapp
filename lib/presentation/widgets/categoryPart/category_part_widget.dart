import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/core/di.dart';
import 'package:todo2/presentation/cubits/getCategories/get_categories_cubit.dart';
import 'package:todo2/presentation/widgets/categoryPart/add_category_icon_widget.dart';
import 'package:todo2/presentation/widgets/categoryPart/category_chip_list_widget.dart';

class CategoryPartWidget extends StatelessWidget {
  const CategoryPartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Category"),
        SingleChildScrollView(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AddCategoryIconWidget(),
              BlocProvider<GetCategoriesCubit>(
                create: (context) => getIt.get<GetCategoriesCubit>(),
                child: const CategoryChipListWidget(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
