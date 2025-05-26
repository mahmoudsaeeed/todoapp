// import 'package:flutter/material.dart';
// import 'package:todo2/core/theme/theme_constants.dart';

// import 'custom_decorations.dart';

// class DarkTheme {
//   static ThemeData build () => ThemeData(
//       brightness: Brightness.dark,
//       useMaterial3: true,
//       appBarTheme: const AppBarTheme(backgroundColor: Colors.black),

//       //? -------- addCategoryIcon, addTaskIcon, -----------||||
//       iconButtonTheme: const IconButtonThemeData(
//         style: ButtonStyle(
//           backgroundColor: WidgetStatePropertyAll(Colors.white),
//           iconColor: WidgetStatePropertyAll(
//             Colors.black,
//           ),
//         ),
//       ),
//       //? ------------ ElevatedButton  -------------------- |||
//       elevatedButtonTheme: const ElevatedButtonThemeData(
//         style: ButtonStyle(
//           backgroundColor: WidgetStatePropertyAll(
//             Colors.white,
//           ),
//           foregroundColor: WidgetStatePropertyAll(
//             Colors.black,
//           ),
//         ),
//       ),
//       //? -------------   TextThemes  --------------------|||
//       textTheme: const TextTheme(
//         headlineLarge: TextStyle(
//           fontSize: headLineLargeFont,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//         headlineMedium: TextStyle(
//           fontSize: headLineMediumFont,
//           fontWeight: FontWeight.w800,
//           color: Colors.white,
//         ),

//         bodySmall: 
//       ),

// //? --------------  BottomNavigatorBar Theme ----------------------- ||||
//       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white54,
//         showUnselectedLabels: false,
//         backgroundColor: Colors.black,
//       ),

//       //? --------------- Custom Container decoration ---------------------////

//       extensions: const [
//         CustomDecorations(
//           taskTileBox: BoxDecoration(
//             color: Color.fromARGB(213, 0, 0, 0),
//             borderRadius: BorderRadius.all(
//               Radius.circular(taskTileBorderRadius),
//             ),
//           ),
//           taskPartBox: BoxDecoration(
//             color: Color.fromARGB(255, 105, 100, 100),
//             borderRadius: BorderRadius.vertical(
//               top: Radius.circular(taskPartBorderRadiusInTop),
//             ),
//           ),
//           categoryPartBox: BoxDecoration(
//             color: Color.fromARGB(255, 158, 158, 158),
//           ),
//         ),
//       ]);

// }


import 'package:flutter/material.dart';
import 'package:todo2/core/theme/theme_constants.dart';
import 'custom_decorations.dart';

class DarkTheme {
  static ThemeData build() => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),

        //? Floating category/task buttons
        iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.white),
            iconColor: WidgetStatePropertyAll(Colors.black),
          ),
        ),

        //? Elevated buttons
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.white),
            foregroundColor: WidgetStatePropertyAll(Colors.black),
          ),
        ),

        //? Text themes
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headlineMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Color(0xFFAC72F2), // purple "In progress"
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFFD16666), // red "1L", "22h"
          ),
        ),

        //? Bottom navigation
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          showUnselectedLabels: false,
          backgroundColor: Colors.black,
        ),

        //? Decorations for cards and category colors
        extensions: const [
          CustomDecorations(
            taskTileBox: BoxDecoration(
              color: Color.fromARGB(213, 36, 36, 36),
              borderRadius: BorderRadius.all(
                Radius.circular(taskTileBorderRadius),
              ),
            ),
            taskPartBox: BoxDecoration(
              color: Color(0xFF2E2E2E), // dark gray left strip
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(taskPartBorderRadiusInTop),
              ),
            ),
            categoryPartBox: BoxDecoration(
              color: Color(0xFF9E9E9E), // gray tag backgrounds
            ),
          ),
        ],
      );
}
