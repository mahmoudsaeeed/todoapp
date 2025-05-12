import 'package:flutter/material.dart';

class DecorationsStyle {
  //! TasksPartWidget in HomePage
  static const BoxDecoration taskPartDecorationInHome = BoxDecoration(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
      color: Color.fromARGB(255, 255, 255, 255),
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 50,
          offset: Offset(0, 10),
          spreadRadius: -10,
        )
      ]);
  //! CategoryPart In home
  static const BoxDecoration categoryPartDecorationInHome = BoxDecoration(
      // color: Color.fromARGB(255, 250, 250, 250),
      );
}

class FontsStyle {
  static const TextStyle h1 = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle h2 =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w800);
}

class ButtonsStyle {
  static const ButtonStyle add = ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(Colors.white),
      backgroundColor: WidgetStatePropertyAll(
        Colors.black,
      ),
      iconColor: WidgetStatePropertyAll(Colors.white));

  static const ButtonStyle buttonInDialog = ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(Colors.white),
      backgroundColor: WidgetStatePropertyAll(
        Colors.black,
      ),
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 30)),
      iconColor: WidgetStatePropertyAll(Colors.white));

  static const ButtonStyle cancleInDialog = ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 255, 2, 2)),
      backgroundColor: WidgetStatePropertyAll(
        Colors.black,
      ),
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 30)),
      iconColor: WidgetStatePropertyAll(Color.fromARGB(255, 255, 0, 0)));
}
