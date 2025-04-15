import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get_it/get_it.dart';
import 'package:todo2/Presentation/cubits/addCategory/add_category_cubit.dart';
import 'package:todo2/core/keys.dart';
import 'package:todo2/data/dataSource/category_data_source.dart';
import 'package:todo2/data/repos/category_repo.dart';

import '../../../../core/di.dart';
import '../../../../data/models/categoryModel/category_model.dart';

class AddCategoryAlertDialogWidget extends StatefulWidget {
  const AddCategoryAlertDialogWidget({
    super.key,
  });

  @override
  State<AddCategoryAlertDialogWidget> createState() =>
      _AddCategoryAlertDialogWidgetState();
}

class _AddCategoryAlertDialogWidgetState
    extends State<AddCategoryAlertDialogWidget> {
  late TextEditingController catNameController, catColorController;

  bool _isClickedOnColorInput = false;
  Color pickerColor = const Color(0xC0035D92);

  @override
  void initState() {
    super.initState();
    catNameController = TextEditingController();
    catColorController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // final catCubit =
    //     AddCategoryCubit(repo: CategoryRepo(dataSource: CategoryDataSource()));
    // final catCubit = getIt.get<AddCategoryCubit>(instanceName: MyKeys.getItAddCategoryCubitKey);
    // final catCubit1 = getIt.get<AddCategoryCubit>(instanceName:MyKeys.getItAddCategoryCubitKey );

    // log("catCubit2: ${catCubit2.runtimeType}");
    // log("catCubit: ${catCubit.runtimeType}");
    return BlocProvider(
      create: (context) => getIt.get<AddCategoryCubit>(
          instanceName: MyKeys.getItAddCategoryCubitKey),
      child: Builder(builder: (context) {
        return AlertDialog(
          title: const Text("Add Category"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: catNameController,
                ),
                TextFormField(
                  controller: catColorController,
                  readOnly: true,
                  decoration: InputDecoration(
                      suffixIcon: Container(
                    width: 20,
                    color: Color(int.tryParse(catColorController.text) ??
                        pickerColor.value),
                  )),
                  onTap: () {
                    setState(() {
                      _isClickedOnColorInput = !_isClickedOnColorInput;
                    });
                    log("Show Color Picker ? $_isClickedOnColorInput");
                  },
                ),
                _isClickedOnColorInput
                    ? ColorPicker(
                        pickerColor: pickerColor,
                        // hexInputController: catColorController,

                        onColorChanged: (newColorChosed) {
                          setState(() {
                            pickerColor = newColorChosed;
                            // log("PickerColor : ${picke/rColor.value.}");
                            catColorController.text =
                                newColorChosed.value.toString();
                          });
                        },
                      )
                    : Container(),
                TextButton.icon(
                  onPressed: () {
                    log("Color = ${catColorController.text}");
                    // log("Color = ${'0x${catColorController.text}'}");
                    CategoryModel newCategory = CategoryModel(
                      id: 0, //? it will be changed in CategoryDataSource
                      name: catNameController.text.trim(),
                      color: int.tryParse(catColorController.text) ??
                          pickerColor.value,
                    );

                    // context.read<AddCategoryCubit>().addNewCategory(newCategory);
                    final cubit = getIt.get<AddCategoryCubit>(
                        instanceName: MyKeys.getItAddCategoryCubitKey);

                    cubit.addNewCategory(newCategory);
                    // BlocProvider.of<AddCategoryCubit>(context)
                    //     .addNewCategory(newCategory);
                  },
                  label: const Text("Add"),
                  icon: const Icon(Icons.add),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
