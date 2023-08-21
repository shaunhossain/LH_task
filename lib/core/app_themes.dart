import 'package:flutter/material.dart';
import 'package:react_conf/core/util/app_colors.dart';

enum AppTheme { lightMode, darkMode }

Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.lightMode: ThemeData(
    brightness: Brightness.light,
    splashColor: primaryColor,
    scaffoldBackgroundColor: whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor
    ),
    cardColor: whiteColor,
    primaryColor: primaryColor,
  ),
  AppTheme.darkMode: ThemeData(
    brightness: Brightness.dark,
  ),
};
