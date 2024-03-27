import 'package:flutter/material.dart';
import 'package:front/core/app_color.dart';
import 'package:front/controller/controller_configure_project.dart';

class WidgetFilePickerText extends StatelessWidget {
  final ControllerConfigureProject controller;

  const WidgetFilePickerText({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    String displayText = controller.selectedDirectoryPath.isEmpty
        ? 'No directory selected'
        : controller.selectedDirectoryPath;

    return Expanded(
      child: Text(
        displayText,
        style: const TextStyle(
          color: AppColors.darkBackground,
          fontSize: 12,
        ),
      ),
    );
  }
}
