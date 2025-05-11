
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/features/category/presenter/view/widgets/add_category_alert_dialog_widget.dart';
import 'package:todo2/features/category/presenter/view_model/cubit/getCategories/get_categories_cubit.dart';

class AddCategoryIconWidget extends StatefulWidget {
  const AddCategoryIconWidget({
    super.key,
  });
  @override
  State<AddCategoryIconWidget> createState() => _AddCategoryIconWidgetState();
}

class _AddCategoryIconWidgetState extends State<AddCategoryIconWidget> {
  @override
  Widget build(BuildContext context) {
        final getCategoriesCubit = context.read<GetCategoriesCubit>();

    return CircleAvatar(
      child: IconButton(
        onPressed: () async {
          showDialog(
            context: context,
            builder: (_) {
              ///? we use [GetCategoriesCubit] here 
              ///? to refresh categories List in home screen after added
              return BlocProvider.value(
                value: getCategoriesCubit,
                child: const AddCategoryAlertDialogWidget(),
              );
            },
          );
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}
