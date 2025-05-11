import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/features/category/data/repo/category_repo.dart';
import 'package:todo2/features/task/data/repo/task_repo.dart';

import '../../core/di.dart';
import '../../features/category/presenter/view/widgets/category_part_widget.dart';
import '../../features/category/presenter/view_model/cubit/getCategories/get_categories_cubit.dart';
import '../../features/task/presenter/view/widgets/tasks_part_widget.dart';
import '../../features/task/presenter/view_model/cubit/getTask/get_tasks_cubit.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider<GetCategoriesCubit>(
              create: (context) => GetCategoriesCubit(repo: getIt<CategoryRepo>()),
            ),
            BlocProvider<GetTasksCubit>(
              create: (context) => GetTasksCubit(repo: getIt<TaskRepo>()),
            ),
          ],
          child: const SingleChildScrollView(
            child: Column(
              children: [
                CategoryPartWidget(),
                TasksPartWidget(),
              ],
            ),
          ),
        ),
      ),
    );

    
  }
}
