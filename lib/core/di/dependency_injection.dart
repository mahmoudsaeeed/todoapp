import 'package:get_it/get_it.dart';
import 'package:todo2/features/category/presenter/view_model/cubit/getCategories/get_categories_cubit.dart';
import 'package:todo2/features/task/data/data_source/task_data_source.dart';
import 'package:todo2/features/category/data/data_source/category_data_source.dart';
import 'package:todo2/features/category/data/repo/category_repo.dart';
import 'package:todo2/features/task/data/repo/task_repo.dart';
import 'package:todo2/features/task/presenter/view_model/cubit/getTask/get_tasks_cubit.dart';

final getIt = GetIt.instance;

void dI() {
  ///? Categories getIt
  getIt.registerLazySingleton<CategoryDataSource>(() => CategoryDataSource());
  getIt.registerLazySingleton<CategoryRepo>(
      () => CategoryRepo(dataSource: getIt<CategoryDataSource>()));

  getIt.registerLazySingleton<GetCategoriesCubit>(
    () => GetCategoriesCubit(repo: getIt<CategoryRepo>()),
  );

//////////////////////////////////////////////////////////////
  ///? Tasks getIt
  ///
  ///? DataSource
  getIt.registerLazySingleton<TaskDataSource>(() => TaskDataSource());

  //? Repo
  getIt.registerLazySingleton<TaskRepo>(
    () => TaskRepo(dataSource: getIt<TaskDataSource>()),
  );
  getIt.registerLazySingleton<GetTasksCubit>(
    () => GetTasksCubit(repo: getIt<TaskRepo>()),
  );
}
