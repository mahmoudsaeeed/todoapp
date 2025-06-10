import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/core/constants.dart';
import 'package:todo2/core/my_routes.dart';
import 'package:todo2/core/theme/app_theme.dart';
import 'package:todo2/presentation/view_model/cubit/theme_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          themeMode: themeMode, // هنا بيتغير حسب النظام أو المستخدم
          darkTheme: AppTheme.darkTheme,
          onGenerateRoute: onGenerateRoute,
          initialRoute: Pages.homeView,
         
        );
      },
    );
  }
}
