import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo2/core/constants.dart';

enum ThemeModeOption { system, light, dark }

const String light = 'light';
const String dark = 'dark';
const String system = 'system';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final mode = prefs.getString(themeKeyInPref) ?? ThemeModeOption.system.name;

    switch (mode) {
      case light:
        emit(ThemeMode.light);
        break;
      case dark:
        emit(ThemeMode.dark);
        break;
      default:
        emit(ThemeMode.system);
    }
  }

  Future<void> changeTheme(ThemeModeOption option) async {
    final prefs = await SharedPreferences.getInstance();

    switch (option) {
      case ThemeModeOption.light:
        await prefs.setString(themeKeyInPref, light);
        emit(ThemeMode.light);
        break;
      case ThemeModeOption.dark:
        await prefs.setString(themeKeyInPref, dark);
        emit(ThemeMode.dark);
        break;
      case ThemeModeOption.system:
        await prefs.setString(themeKeyInPref, system);
        emit(ThemeMode.system);
        break;
    }
  }
}
