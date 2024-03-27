import 'package:flutter/material.dart';
import 'package:front/core/app_color.dart';
import 'package:front/logic/model/file/file_decorator.dart';
import 'package:front/logic/model/file/file_model.dart';
import 'package:front/controller/controller_configure_project.dart';

class WidgetFileCard extends StatelessWidget {
  final FileModel fileModel;
  final ControllerConfigureProject controller;
  final VoidCallback onSelected;

  const WidgetFileCard({
    Key? key,
    required this.fileModel,
    required this.controller,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fileDecorator = FileDecorator(fileModel);
    return GestureDetector(
      onTap: () {
        controller.toggleFileSelection(fileModel);
        onSelected();
      },
      child: Container(
        width: double.infinity, // Prendre la largeur maximale
        height: 52.0,
        decoration: BoxDecoration(
          color: fileModel.isSelected ? AppColors.greyBackground : AppColors.lightBackground,
          border: const Border(
            bottom: BorderSide(color: AppColors.lightGreyBorder, width: 1),
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            fileDecorator.fileName(),
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.darkBackground,
            ),
          ),
        ),
      ),
    );
  }
}
