import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/features/category/data/repo/category_repo.dart';
import 'package:todo2/features/task/data/repo/task_repo.dart';

import '../../core/di.dart';
import '../../core/shared/style.dart';
import '../../features/category/presenter/view/widgets/category_part_widget.dart';
import '../../features/category/presenter/view_model/cubit/getCategories/get_categories_cubit.dart';
import '../../features/task/presenter/view/widgets/tasks_part_widget.dart';
import '../../features/task/presenter/view_model/cubit/getTask/get_tasks_cubit.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Tasks",
            style: FontsStyle.h1,
          ),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider<GetCategoriesCubit>(
              create: (context) =>
                  GetCategoriesCubit(repo: getIt<CategoryRepo>()),
            ),
            BlocProvider<GetTasksCubit>(
              create: (context) => GetTasksCubit(repo: getIt<TaskRepo>()),
            ),
          ],
          child: SizedBox.expand(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    child: const Stack(
                      children: [
                        Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          child: CategoryPartWidget(),
                        ),

                        // Divider(
                        //   endIndent: 10,
                        //   indent: 10,
                        //   color: Colors.black,
                        // ),

                        Positioned.fill(
                          top: 120,
                          child: TasksPartWidget(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
