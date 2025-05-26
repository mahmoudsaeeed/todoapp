
import 'package:flutter/material.dart';
import 'package:todo2/core/constants.dart';
import 'package:todo2/core/my_routes.dart';
import 'package:todo2/core/theme/app_theme.dart';
import 'package:todo2/presentation/views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key, required this.themeMode,
  });

  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: AppTheme.lightTheme,
      themeMode: themeMode, // هنا بيتغير حسب النظام أو المستخدم
      // themeMode: ThemeMode.light, // هنا بيتغير حسب النظام أو المستخدم
      darkTheme: AppTheme.darkTheme,
      onGenerateRoute: onGenerateRoute,
      initialRoute: Pages.taskScreen,
      // home: const HomeView(),
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
