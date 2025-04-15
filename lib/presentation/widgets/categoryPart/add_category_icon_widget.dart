import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/core/di.dart';
import 'package:todo2/presentation/cubits/addCategory/add_category_cubit.dart';
import 'package:todo2/presentation/widgets/categoryPart/addcategory/add_category_alert_dialog_widget.dart';

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
    log("AddCategoryIconWidgetState rebuild");
    return CircleAvatar(
      child: IconButton(
        onPressed: () async {
          showDialog(
            context: context,
            builder: (context) {
              
              return const AddCategoryAlertDialogWidget();
            },
          );
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}
