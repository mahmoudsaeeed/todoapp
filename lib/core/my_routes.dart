import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/core/constants.dart';
import 'package:todo2/core/di/dependency_injection.dart';
import 'package:todo2/features/category/presenter/view_model/cubit/getCategories/get_categories_cubit.dart';
import 'package:todo2/presentation/views/home_view.dart';
import 'package:todo2/presentation/views/sreens/category_screen.dart';
import 'package:todo2/presentation/views/sreens/task_screen.dart';

Route? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Pages.homeView:
      {
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      }
    case Pages.taskScreen:
      return MaterialPageRoute(
        builder: (context) => const TaskScreen(),
      );

    case Pages.categoryScreen:
      return MaterialPageRoute(
        builder: (context) => BlocProvider<GetCategoriesCubit>.value(
                value: getIt<GetCategoriesCubit>(),
              
          child: const CategoryScreen(),
        ),
      );
    default:
      MaterialPageRoute(
        builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text("Error"),
            ),
          );
        },
      );
  }
  return null;
}
