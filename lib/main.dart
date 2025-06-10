import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo2/core/di/dependency_injection.dart';
import 'package:todo2/core/keys.dart';
import 'package:todo2/core/observer/cubit_observer.dart';
import 'package:todo2/features/category/data/model/category_model.dart';
import 'package:todo2/features/category/data/model/category_model_adapter.dart';
import 'package:todo2/features/task/data/model/task_model.dart';
import 'package:todo2/features/task/data/model/task_model_adapter.dart';
import 'package:todo2/my_app.dart';
import 'package:todo2/presentation/view_model/cubit/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeCubit = ThemeCubit();

  await Future.wait([
    themeCubit.loadTheme(), // تحميل الثيم قبل بدء التطبيق
    initHive(),
  ]);
  dI();

  runApp(
    BlocProvider.value(
      value: themeCubit,
      child: const MyApp(),
    ),
  );
}

Future<void> initHive() async {
  Bloc.observer = CubitObserver();
  final path = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(path.path);
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(TaskModelAdapter());
  }

  if (!Hive.isAdapterRegistered(2)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  // Hive.registerAdapter(TaskModelAdapter());
  // Hive.registerAdapter(CategoryModelAdapter());
  try {
    await Future.wait([
      Hive.openBox<TaskModel>(MyKeys.taskBoxKey),
      Hive.openBox<CategoryModel>(MyKeys.categoryBoxKey),
    ]);
  } catch (e) {
    log("main:  error ${e.runtimeType}");
  }
}
