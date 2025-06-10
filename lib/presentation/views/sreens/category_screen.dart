import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/core/di/dependency_injection.dart';
import 'package:todo2/features/category/data/repo/category_repo.dart';
import 'package:todo2/features/category/presenter/view_model/cubit/delete_category/delete_category_cubit.dart';
import 'package:todo2/features/category/presenter/view_model/cubit/getCategories/get_categories_cubit.dart';
import 'package:todo2/features/task/data/repo/task_repo.dart';
import 'package:todo2/features/task/presenter/view_model/cubit/delete_tasks_where_category/delete_tasks_where_category_cubit.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                DeleteCategoryCubit(repo: getIt<CategoryRepo>()),
          ),
          BlocProvider(
            create: (context) => DeleteTasksWhereCategoryCubit(repo: getIt<TaskRepo>()),
          ),
        ],
        child: Builder(builder: (context) {
          return const SelectableTileList();
        }),
      ),
    );
  }
}

class SelectableTileList extends StatefulWidget {
  const SelectableTileList({super.key});

  @override
  State<SelectableTileList> createState() => _SelectableTileListState();
}

class _SelectableTileListState extends State<SelectableTileList> {
  int? selectedIndex; // العنصر المحدد

  @override
  Widget build(BuildContext context) {
    final categories = context.read<GetCategoriesCubit>().getAllCategories();
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final isSelected = selectedIndex == index;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {
                setState(() {
                  if (isSelected == true) {
                    selectedIndex = null;
                  }
                });
              },
              onLongPress: () {
                setState(() {
                  selectedIndex = isSelected ? null : index;
                });
              },
              leading: isSelected
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : null,
              title: Text(categories[index].name),
              tileColor: isSelected
                  ? Color(categories[index].color).withAlpha(80)
                  : null,
              // tileColor: isSelected ? Colors.grey.shade200 : null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            // لو متحدد، نعرض الاختيارات
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Row(
                  children: [
                    // TextButton.icon(
                    //   onPressed: () {
                    //     // TODO: تعديل المهمة
                    //   },
                    //   icon: const Icon(Icons.edit, color: Colors.blue),
                    //   label: const Text("تعديل"),
                    // ),
                    TextButton.icon(
                      onPressed: () async {
                        final res = await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text(
                              "Are you sure ?",
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: const Text("Yes"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                                child: const Text("No"),
                              ),
                            ],
                          ),
                        );

                        res
                            ? setState(() {
                                BlocProvider.of<DeleteCategoryCubit>(context)
                                    .deleteCategory(categoryId: index);
                                BlocProvider.of<DeleteTasksWhereCategoryCubit>(
                                        context)
                                    .deleteWhere(
                                        categoryName: categories[index].name);
                              })
                            : null;
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
                      label: const Text("حذف"),
                    ),
                  ],
                ),
              )
          ],
        );
      },
    );
  }
}
