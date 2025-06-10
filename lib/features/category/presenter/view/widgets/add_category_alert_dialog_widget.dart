import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:todo2/core/di/dependency_injection.dart';
import 'package:todo2/presentation/widgets/custom_text_form_field.dart';
import 'package:todo2/features/category/data/repo/category_repo.dart';
import 'package:todo2/features/category/presenter/view_model/cubit/getCategories/get_categories_cubit.dart';
import 'package:uuid/uuid.dart';

import '../../../data/model/category_model.dart';
import '../../view_model/cubit/addCategory/add_category_cubit.dart';

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
  Color pickerColor = const Color(0xFF035E92);

  @override
  void initState() {
    super.initState();
    catNameController = TextEditingController();
    catColorController = TextEditingController(text: pickerColor.toHexString());
  }

  @override
  Widget build(BuildContext context) {
    ///? Cubit AddCategoryCubit
    return BlocProvider<AddCategoryCubit>(
      create: (context) => AddCategoryCubit(repo: getIt<CategoryRepo>()),
      child: Builder(
        builder: (context) {
          return AlertDialog(
            title:  Text(
              "Add Category",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: catNameController,
                  ),
                  CustomTextFormField(
                    controller: catColorController,
                    readOnly: true,
                    decoration: InputDecoration(
                        suffixIcon: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.zero,
                          topLeft: Radius.circular(30),
                          bottomRight: Radius.zero,
                          bottomLeft: Radius.circular(20),
                        ),
                        color: Color(int.tryParse(catColorController.text) ??
                            pickerColor.toARGB32()),
                      ),
                      width: 20,
                    )),
                    onTap: () {
                      setState(() {
                        _isClickedOnColorInput = !_isClickedOnColorInput;
                      });
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
                                  newColorChosed.toHexString();
                            });
                          },
                        )
                      : Container(),

                  /// ? simple of choosed color
                  ElevatedButton.icon(
                    // style: ButtonsStyle.buttonInDialog,
                    onPressed: () async {
                      if (catNameController.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Please Enter a category name"),
                        ));
                      } else {
                        final uuid = const Uuid().v4();
                        CategoryModel newCategory = CategoryModel(
                          id: uuid,
                          name: catNameController.text.trim(),
                          color: pickerColor.toARGB32(),
                        );

                        final addCubit =
                            BlocProvider.of<AddCategoryCubit>(context);
                        final getCubit = BlocProvider.of<GetCategoriesCubit>(
                          context,
                        );
                        await addCubit.addNewCategory(newCategory).then(
                          (value) {
                            if (context.mounted) {
                              getCubit.getAllCategories();
                            }
                          },
                        );

                        //? be sure
                        // if (context.mounted) {
                        //   await showDialog(
                        //     context: context,
                        //     builder: (context) => AlertDialog(
                        //       title: const Text("Category added successfully"),
                        //       actions: [
                        //         ElevatedButton(
                        //           onPressed: () {
                        //             Navigator.pop(context);
                        //             Navigator.popUntil(
                        //               context,
                        //               (route) => route.isFirst,
                        //             );
                        //           },
                        //           child: const Text("Ok"),
                        //         ),
                        //       ],
                        //     ),
                        //   );
                        // }
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                      }

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
        },
      ),
    );
  }
}
