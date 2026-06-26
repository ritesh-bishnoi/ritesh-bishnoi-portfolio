import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor:
          AppColors.background,
      colorScheme: ColorScheme.dark(
        primary: AppColors.primary,
      ),
    );
  }
}