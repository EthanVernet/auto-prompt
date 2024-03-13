import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_font.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightPrimaryColor,
      iconTheme: const IconThemeData(color: AppColors.darkPrimaryColor),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor1,
        iconTheme: IconThemeData(color: AppColors.darkPrimaryColor),
        titleTextStyle: TextStyle(
          fontFamily: AppFont.defaultFont,
          color: AppColors.lightPrimaryColor,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.lightPrimaryColor,
        selectedItemColor: AppColors.primaryColor1,
        unselectedItemColor: AppColors.darkPrimaryColor,
        elevation: 4,
        selectedLabelStyle: TextStyle(
          fontFamily: AppFont.defaultFont,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: AppFont.defaultFont,
          fontSize: 10,
          fontWeight: FontWeight.normal,
        ),
      ),
      navigationRailTheme: const NavigationRailThemeData(
        backgroundColor: AppColors.lightPrimaryColor,
        selectedIconTheme: IconThemeData(color: AppColors.primaryColor1),
        unselectedIconTheme: IconThemeData(color: AppColors.darkPrimaryColor),
        selectedLabelTextStyle: TextStyle(
          fontFamily: AppFont.defaultFont,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor1,
        ),
        unselectedLabelTextStyle: TextStyle(
          fontFamily: AppFont.defaultFont,
          fontSize: 10,
          fontWeight: FontWeight.normal,
          color: AppColors.darkPrimaryColor,
        ),
      ),
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.primaryColor1;
          }
          return AppColors.darkPrimaryColor.withOpacity(0.5);
        }),
        thumbColor: MaterialStateProperty.resolveWith((states) {
          return states.contains(MaterialState.selected)
              ? AppColors.primaryColor2
              : AppColors.darkPrimaryColor;
        }),
        overlayColor: MaterialStateProperty.all(AppColors.darkPrimaryColor.withOpacity(0.05)),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontFamily: AppFont.defaultFont,
          color: AppColors.darkPrimaryColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: AppFont.defaultFont,
          color: AppColors.darkPrimaryColor,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkPrimaryColor,
      iconTheme: const IconThemeData(color: AppColors.lightPrimaryColor),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkPrimaryColor,
        iconTheme: IconThemeData(color: AppColors.lightPrimaryColor),
        titleTextStyle: TextStyle(
          fontFamily: AppFont.defaultFont,
          color: AppColors.lightPrimaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkSecondaryColor,
        selectedItemColor: AppColors.primaryColor1,
        unselectedItemColor: AppColors.lightPrimaryColor,
        selectedLabelStyle: TextStyle(
          fontFamily: AppFont.defaultFont,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: AppFont.defaultFont,
          fontSize: 10,
          fontWeight: FontWeight.normal,
        ),
      ),
      navigationRailTheme: const NavigationRailThemeData(
        backgroundColor: AppColors.darkSecondaryColor,
        selectedIconTheme: IconThemeData(color: AppColors.primaryColor1),
        unselectedIconTheme: IconThemeData(color: AppColors.lightPrimaryColor),
        selectedLabelTextStyle: TextStyle(
          fontFamily: AppFont.defaultFont,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor1,
        ),
        unselectedLabelTextStyle: TextStyle(
          fontFamily: AppFont.defaultFont,
          fontSize: 10,
          fontWeight: FontWeight.normal,
          color: AppColors.lightPrimaryColor,
        ),
      ),
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.primaryColor2;
          }
          return AppColors.lightPrimaryColor.withOpacity(0.5);
        }),
        thumbColor: MaterialStateProperty.resolveWith((states) {
          return states.contains(MaterialState.selected)
              ? AppColors.primaryColor1
              : AppColors.lightPrimaryColor;
        }),
        overlayColor: MaterialStateProperty.all(AppColors.lightPrimaryColor.withOpacity(0.05)),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontFamily: AppFont.defaultFont,
          color: AppColors.lightPrimaryColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: AppFont.defaultFont,
          color: AppColors.lightPrimaryColor,
        ),
      ),
    );
  }
}
