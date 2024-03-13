import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_font.dart';

class AppTextStyle {
  static TextStyle alarmNameStyle(BuildContext context) {
    return TextStyle(
      fontFamily: AppFont.defaultFont,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.lightPrimaryColor
          : AppColors.darkPrimaryColor,
    );
  }

  static TextStyle alarmHourStyle(BuildContext context) {
    return TextStyle(
      fontFamily: AppFont.numberAndDayIndicatorFont,
      fontSize: 30,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.primaryColor2
          : AppColors.darkPrimaryColor,
    );
  }

  static TextStyle timePickerStyle(BuildContext context) {
    return TextStyle(
      fontFamily: AppFont.numberAndDayIndicatorFont,
      fontSize: 80,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.lightPrimaryColor
          : AppColors.darkPrimaryColor,
    );
  }

  static TextStyle timePickerZeroStyle(BuildContext context) {
    return TextStyle(
      fontFamily: AppFont.numberAndDayIndicatorFont,
      fontSize: 80,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.primaryColor2
          : AppColors.darkPrimaryColor,
    );
  }

  static TextStyle dayIndicatorActiveStyle(BuildContext context) {
    return TextStyle(
      fontFamily: AppFont.numberAndDayIndicatorFont,
      fontSize: 10,
      letterSpacing: 1.5,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.primaryColor2
          : AppColors.darkPrimaryColor,
    );
  }

  static TextStyle dayIndicatorInactiveStyle(BuildContext context) {
    return TextStyle(
      fontFamily: AppFont.numberAndDayIndicatorFont,
      fontSize: 10,
      letterSpacing: 1.5,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.lightPrimaryColor
          : AppColors.darkPrimaryColor,
    );
  }

  static TextStyle negativeButtonTextStyle(BuildContext context) {
    return const TextStyle(
      fontFamily: AppFont.defaultFont,
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: AppColors.secondaryColor1,
    );
  }

  static TextStyle negativeButtonHoverTextStyle(BuildContext context) {
    return const TextStyle(
      fontFamily: AppFont.defaultFont,
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: AppColors.darkPrimaryColor,
    );
  }

  static TextStyle positiveButtonTextStyle(BuildContext context) {
    return const TextStyle(
      fontFamily: AppFont.defaultFont,
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    );
  }

  static TextStyle positiveButtonHoverTextStyle(BuildContext context) {
    return const TextStyle(
      fontFamily: AppFont.defaultFont,
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: AppColors.darkPrimaryColor,
    );
  }
}
