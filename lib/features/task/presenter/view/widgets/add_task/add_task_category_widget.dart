
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/core/shared/widgets/custom_text_form_field.dart';
import 'package:todo2/features/category/presenter/view_model/cubit/getCategories/get_categories_cubit.dart';

class AddTaskCategoryWidget extends StatelessWidget {
  const AddTaskCategoryWidget({
    super.key,
    required this.taskCategoryController,
  });
  final TextEditingController taskCategoryController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
      builder: (context, state) {
        return MenuAnchor(
          builder:
              (BuildContext context, MenuController controller, Widget? child) {
            return CustomTextFormField(
              controller: taskCategoryController,
              suffix: const Icon(Icons.arrow_drop_down),
              readOnly: true,
              onTap: () {
                controller.isOpen ? controller.close() : controller.open();
              },
            );
          },
          menuChildren: state is GetCategoriesSuccess
              ? List<MenuItemButton>.generate(
                  state.categories.length,
                  (int categoryIndex) => MenuItemButton(
                    onPressed: () {
                      taskCategoryController.text =
                          state.categories[categoryIndex].name;

                      //TODO send category to store in task field
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color(
                          state.categories[categoryIndex].color,
                        ),
                      ),
                    ),
                    // setState(() => selectedMenu = SampleItem.values[index]),
                    child: Text(state.categories[categoryIndex].name),
                  ),
                )
              : [],
        );
      },
    );
  }
}
