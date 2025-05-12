import 'package:flutter/material.dart';
import 'package:todo2/core/theme/custom_decorations.dart';

class AppTheme {
  //! Light Theme  ----------------------------------------------
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      //? -------- addCategoryIcon, addTaskIcon, -----------||||
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.black),
          iconColor: WidgetStatePropertyAll(
            Colors.white,
          ),
        ),
      ),
      //! ------------ ElevatedButton  -------------------- |||
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            Colors.black,
          ),
          foregroundColor: WidgetStatePropertyAll(
            Colors.white,
          ),
        ),
      ),
      //! -------------   TextThemes  --------------------|||
      textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),

          //? ===============================================================
          headlineMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          )),

      //! --------------- Custom Container decoration ---------------------////

      extensions: const [
        CustomDecorations(
            taskTileBox: BoxDecoration(color: Colors.black),
            //? =======================================================
            taskPartBox: BoxDecoration(color: Colors.white),
            //? =======================================================
            categoryPartBox: BoxDecoration(color: Colors.white10)),
      ]);

  //! Dark Theme  --------------------------------------------------------
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black),

      //? -------- addCategoryIcon, addTaskIcon, -----------||||
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.white),
          iconColor: WidgetStatePropertyAll(
            Colors.black,
          ),
        ),
      ),
      //? ------------ ElevatedButton  -------------------- |||
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            Colors.white,
          ),
          foregroundColor: WidgetStatePropertyAll(
            Colors.black,
          ),
        ),
      ),
      //? -------------   TextThemes  --------------------|||
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),

      //? --------------- Custom Container decoration ---------------------////

      extensions: const [
        CustomDecorations(
          taskTileBox: BoxDecoration(
            color: Colors.green,
          ),
          taskPartBox: BoxDecoration(
            color: Colors.black54,
          ),
          categoryPartBox: BoxDecoration(
            color: Colors.black,
          ),
        ),
      ]);
}
