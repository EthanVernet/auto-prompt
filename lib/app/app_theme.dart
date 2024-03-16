import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      iconTheme: const IconThemeData(color: AppColors.lightBackground),
      backgroundColor: AppColors.lightBackground
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      iconTheme: const IconThemeData(color: AppColors.darkBackground),
    );
  }
}
