import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo2/core/constants.dart';
import 'package:todo2/core/cubit_observer.dart';
import 'package:todo2/core/di.dart';
import 'package:todo2/core/keys.dart';
import 'package:todo2/core/my_routes.dart';
import 'package:todo2/features/category/data/model/category_model.dart';
import 'package:todo2/features/category/data/model/category_model_adapter.dart';
import 'package:todo2/features/task/data/model/task_model.dart';
import 'package:todo2/features/task/data/model/task_model_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dI();
  await initHive();
  runApp(const MyApp());
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: onGenerateRoute,
      initialRoute: homeScreen,
      // home: Scaffold(
      //   body: Center(
      //     child: ElevatedButton(onPressed: (){
      //       final di = getIt.get<AddCategoryCubit>(instanceName:MyKeys.getItAddCategoryCubitKey );
      //       log("di: ${di.runtimeType}");
      //     }, child: Text("Test DI")),
      //   ),
      // ),
    );
  }
}
