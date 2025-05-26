// import 'package:flutter/material.dart';
// import 'package:todo2/core/theme/theme_constants.dart';

// import 'custom_decorations.dart';

// class LightTheme {
//   static ThemeData build() {
//     return ThemeData(
//         brightness: Brightness.light,
//         useMaterial3: true,
//         appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
//         /*
//       ? addCategoryIcon, addTaskIcon 
//       */
//         iconButtonTheme: const IconButtonThemeData(
//           style: ButtonStyle(
//             backgroundColor: WidgetStatePropertyAll(Colors.black),
//             iconColor: WidgetStatePropertyAll(
//               Colors.white,
//             ),
//           ),
//         ),
//         /* 
//        ? [ ElevatedButton ] 
//       */
//         elevatedButtonTheme: const ElevatedButtonThemeData(
//           style: ButtonStyle(
//             backgroundColor: WidgetStatePropertyAll(
//               Colors.black,
//             ),
//             foregroundColor: WidgetStatePropertyAll(
//               Colors.white,
//             ),
//           ),
//         ),
//         /*
//        ? [ Texts  ]
//       */
//         textTheme: const TextTheme(
//           headlineLarge: TextStyle(
//             fontSize: headLineLargeFont,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//           headlineMedium: TextStyle(
//             fontSize: headLineMediumFont,
//             fontWeight: FontWeight.w800,
//             color: Colors.black,
//           ),
//           displayMedium: TextStyle(color: Colors.black),
//         ),

//         /*
//         ? [ BottomNavigatorBar ]

//       */
//         bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//           selectedItemColor: Colors.black,
//           unselectedItemColor: Colors.black45,
//           showUnselectedLabels: false,
//           backgroundColor: Colors.white,
//         ),

//         /*
//         ?  Custom Container decoration 
//       */

//         extensions:  [
//           CustomDecorations(
// //* ============================================================================
//             taskTileBox: BoxDecoration(color: Colors.black , borderRadius:BorderRadius.circular(taskTileBorderRadius) ),
//             //? ==================
//             taskPartBox: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.vertical(top: Radius.circular(taskPartBorderRadiusInTop)),
//             ),
//             //? ==================
//             categoryPartBox: BoxDecoration(color: Colors.white10),
// //* ============================================================================
//           ),
//         ]);
//   }
// }


import 'package:flutter/material.dart';
import 'package:todo2/core/theme/theme_constants.dart';

import 'custom_decorations.dart';

class LightTheme {
  static ThemeData build() {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),

      /*
      ? Add Category / Task Button
      */
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.black),
          iconColor: WidgetStatePropertyAll(Colors.white),
        ),
      ),

      /*
      ? Elevated Button
      */
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.black),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
        ),
      ),

      /*
      ? Text Theme
      */
      textTheme: const TextTheme(
        // Title: "Today's Task"
        headlineLarge: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),

        // Category tags: Frontend, Faculty, UI
        headlineMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),

        // Task titles: video 1 in playlist
        bodyLarge: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),

        // "In progress" status text
        bodyMedium: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Color(0xFFAC72F2), // light purple-ish
        ),

        // Remaining time: 1L, 22h, 2d
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Color(0xFFD16666), // red
        ),
      ),

      /*
      ? Bottom Navigation Bar
      */
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
      ),

      /*
      ? Custom Decorations
      */
      extensions: const [
        CustomDecorations(
          // Outer task tile background
          taskTileBox: BoxDecoration(
            color: Color.fromARGB(255, 243, 243, 243),
            borderRadius: BorderRadius.all(
              Radius.circular(taskTileBorderRadius),
            ),
          ),
          // Left bar for category color
          taskPartBox: BoxDecoration(
            color: Color.fromARGB(255, 225, 225, 225),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(taskPartBorderRadiusInTop),
            ),
          ),
          // Category tag background
          categoryPartBox: BoxDecoration(
            color: Color(0xFFEDEDED), // Very light gray for subtle background
          ),
        ),
      ],
    );
  }
}
