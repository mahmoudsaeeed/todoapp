import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo2/core/constants.dart';
import 'package:todo2/core/di.dart' as DI;
import 'package:todo2/core/di.dart';
import 'package:todo2/core/keys.dart';
import 'package:todo2/core/my_routes.dart';
import 'package:todo2/data/models/categoryModel/category_model.dart';
import 'package:todo2/data/models/categoryModel/category_model_adapter.dart';
import 'package:todo2/data/models/taskModel/task_model.dart';
import 'package:todo2/data/models/taskModel/task_model_adapter.dart';
import 'package:todo2/data/repos/abstract_repo.dart';
import 'package:todo2/presentation/cubits/addCategory/add_category_cubit.dart';

import 'data/dataSource/abstract_hive_data_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  DI.dI();
  runApp(const MyApp());
}

Future<void> initHive() async {
  final path = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(path.path);
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(CategoryModelAdapter());

  await Future.wait([
    Hive.openBox<TaskModel>(MyKeys.taskBoxKey),
    Hive.openBox<CategoryModel>(MyKeys.categoryBoxKey),
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: MyRoutes.onGenerateRoute,
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
