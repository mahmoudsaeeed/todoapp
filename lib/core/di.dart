
import 'package:get_it/get_it.dart';
import 'package:todo2/features/task/data/data_source/task_data_source.dart';
import 'package:todo2/features/category/data/data_source/category_data_source.dart';
import 'package:todo2/features/category/data/repo/category_repo.dart';
import 'package:todo2/features/task/data/repo/task_repo.dart';

final getIt = GetIt.instance;

void dI() {
  ///? Categories getIt
  getIt.registerLazySingleton<CategoryDataSource>(() => CategoryDataSource());
  getIt.registerLazySingleton<CategoryRepo>(
      () => CategoryRepo(dataSource: getIt<CategoryDataSource>()));

//////////////////////////////////////////////////////////////
///? Tasks getIt
///
///? DataSource
  getIt.registerLazySingleton<TaskDataSource>(() => TaskDataSource());

  //? Repo
  getIt.registerLazySingleton<TaskRepo>(
    () => TaskRepo(dataSource: getIt<TaskDataSource>()),
  );
}
