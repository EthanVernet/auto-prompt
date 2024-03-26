import 'package:flutter/material.dart';
import 'package:front/app/app_color.dart';
import 'package:front/logic/model/file/file_model.dart';
import 'package:front/controller/controller_project.dart';

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
    // Utilisation de GestureDetector pour capturer les interactions de l'utilisateur
    return GestureDetector(
      onTap: () {
        controller.toggleFileSelection(fileContentModel);
        onSelected();
      },
      child: Container(
        width: double.infinity, // Prendre la largeur maximale
        height: 52.0,
        decoration: BoxDecoration(
          color: fileContentModel.isSelected ? AppColors.greyBackground : AppColors.lightBackground,
          // Ajouter une bordure en bas du container
          border: const Border(
            bottom: BorderSide(color: AppColors.lightGreyBorder, width: 1),
          ),
        ),
        padding: const EdgeInsets.all(8.0), // Padding autour du texte
        child: Align(
          alignment: Alignment.centerLeft, // Aligner le texte à gauche
          child: Text(
            fileContentModel.fileName,
            style: const TextStyle(
              fontSize: 12, // Taille de texte similaire à celle utilisée dans l'exemple précédent
              color: AppColors.darkBackground, // Couleur du texte
            ),
          ),
        ),
      ),
    );
  }
}
