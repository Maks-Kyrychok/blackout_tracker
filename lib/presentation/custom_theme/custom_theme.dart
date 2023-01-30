import 'package:blackout_tracker/common/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    return ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.mainBackground,
        scaffoldBackgroundColor: AppColors.mainBackground,
        appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.appBarColor,
            elevation: 0.0,
            shadowColor: Colors.transparent),
        textTheme: const TextTheme(
          subtitle1: TextStyle(color: Colors.white, fontSize: 16),
          subtitle2: TextStyle(color: Colors.white, fontSize: 14),
          bodyText2: TextStyle(color: Colors.white, fontSize: 16),
        ));
  }
}
