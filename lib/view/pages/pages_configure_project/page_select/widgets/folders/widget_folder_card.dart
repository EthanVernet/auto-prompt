import 'package:flutter/material.dart';
import 'package:front/core/app_color.dart';
import 'package:front/controller/controller_configure_project.dart';
import 'package:front/logic/model/folder/folder_decorator.dart';
import 'package:front/logic/model/folder/folder_model.dart';

class WidgetFolderCard extends StatelessWidget {
  final FolderModel folderModel;
  final ControllerConfigureProject controller;
  final VoidCallback onSelected;
  final double indentation;

  const WidgetFolderCard({
    Key? key,
    required this.folderModel,
    required this.controller,
    required this.onSelected,
    this.indentation = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FolderDecorator folderDecorator = FolderDecorator(folderModel);
    bool isSelected = /* FOUND GOOD WAY */ false;

    return GestureDetector(
      onTap: () {
        controller.selectFolder(folderModel);
        onSelected();
      },
      child: Container(
        width: double.infinity,
        height: 52.0,
        padding: EdgeInsets.only(left: indentation, right: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.greyBackground : AppColors.lightBackground,
          border: const Border(
            bottom: BorderSide(color: AppColors.lightGreyBorder, width: 1),
          ),

        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              const Icon(Icons.folder, color: AppColors.actionColor),
              const SizedBox(width: 8),
              Text(
                folderDecorator.folderName(),
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.darkBackground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
