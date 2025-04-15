import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:todo2/core/keys.dart';
import 'package:todo2/data/dataSource/abstract_hive_data_source.dart';
import 'package:todo2/data/dataSource/category_data_source.dart';
import 'package:todo2/data/models/categoryModel/category_model.dart';
import 'package:todo2/data/repos/abstract_repo.dart';
import 'package:todo2/data/repos/category_repo.dart';
import 'package:todo2/presentation/cubits/addCategory/add_category_cubit.dart';
import 'package:todo2/presentation/cubits/getCategories/get_categories_cubit.dart';

final getIt = GetIt.instance;

void dI() {
  getIt.registerLazySingleton<HiveDataSource<CategoryModel>>(
    () {
      log("DI CategoryDataSource statring");
      return CategoryDataSource();
    },
    instanceName: MyKeys.getItCategoryDataSourceKey,
  );

  getIt.registerLazySingleton<AbstractRepo<CategoryModel>>(() {
  log("DI CategoryRepo statring");
    return CategoryRepo(
      dataSource: getIt<HiveDataSource<CategoryModel>>(instanceName:MyKeys.getItCategoryDataSourceKey ),
    );
  }, 
  instanceName: MyKeys.getItCategoryRepoKey,
  );
  getIt.registerFactory<AddCategoryCubit>(
    () {
  log("DI AddCategoryCubit statring");
      return AddCategoryCubit(
        repo: getIt.get<AbstractRepo<CategoryModel>>(instanceName: MyKeys.getItCategoryRepoKey),
      );
    },
    instanceName: MyKeys.getItAddCategoryCubitKey
  );

  getIt.registerFactory<GetCategoriesCubit>(
    () {
  log("DI GetCategoriesCubit statring");
      return GetCategoriesCubit(
        repo: getIt<AbstractRepo<CategoryModel>>(),
      );
    },
  );
}
