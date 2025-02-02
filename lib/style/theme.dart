import 'package:flutter/material.dart';
import 'package:note_app/style/colors.dart';

class AppTheme {
  static ThemeData get standart {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor.value,
      appBarTheme: _appBarTheme,
      primaryColor: AppColors.primary,
      primaryColorDark: AppColors.primary,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }

  static AppBarTheme get _appBarTheme => AppBarTheme(
        backgroundColor: AppColors.scaffoldBackgroundColor.value,
        surfaceTintColor: AppColors.background1,
        shadowColor: Colors.transparent,
      );
}
