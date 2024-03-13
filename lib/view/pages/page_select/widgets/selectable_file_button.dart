import 'package:flutter/material.dart';
import 'package:front/app/app_color.dart';
import 'package:front/logic/model/file/file_content_model.dart';
import 'package:front/controller/main_controller.dart';

class SelectableFileItem extends StatelessWidget {
  final FileContentModel fileContentModel;
  final MainController controller;
  final VoidCallback onSelected;

  const SelectableFileItem({
    Key? key,
    required this.fileContentModel,
    required this.controller,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.toggleFileSelection(fileContentModel);
        onSelected();
      },
      child: Container(
        color: fileContentModel.isSelected ? AppColors.primaryColor2 : Colors.transparent,
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(fileContentModel.fileName),
          leading: Icon(fileContentModel.isSelected ? Icons.check_circle : Icons.circle_outlined), // Ajout d'une icône pour indiquer la sélection
        ),
      ),
    );
  }
}