import 'package:flutter/material.dart';
import 'package:front/app/app_color.dart'; // Assurez-vous que ce chemin est correct
import 'package:front/logic/model/section/section_model.dart';
import 'package:front/view/layout/column/layout_dual_column.dart';
import 'package:front/view/layout/column/layout_dual_row.dart';

class WidgetSectionPresentation extends StatefulWidget {
  final SectionModel section;
  final VoidCallback onDelete;
  final Function(String title, String content) onUpdate;

  const WidgetSectionPresentation({
    Key? key,
    required this.section,
    required this.onDelete,
    required this.onUpdate,
  }) : super(key: key);

  @override
  _WidgetSectionPresentationState createState() => _WidgetSectionPresentationState();
}

class _WidgetSectionPresentationState extends State<WidgetSectionPresentation> {
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.4),
      margin: const EdgeInsets.all(10),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: LayoutDualColumn(
          leftWidget: LayoutDualRow(
            topWidget: TextFormField(
              controller: titleController,
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 20, color: Colors.black),
              decoration: const InputDecoration(
                hintText: 'Titre',
                hintStyle: TextStyle(color: AppColors.primaryColor2),
                border: InputBorder.none,
              ),
              onChanged: (value) => widget.onUpdate(value, contentController.text),
            ),
            bottomWidget: TextFormField(
              controller: contentController,
              textAlign: TextAlign.justify,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                hintText: 'Contenu',
                hintStyle: TextStyle(color: AppColors.primaryColor2),
                border: InputBorder.none,
              ),
              onChanged: (value) => widget.onUpdate(titleController.text, value),
              maxLines: null,
              keyboardType: TextInputType.multiline,
            ),
            isTopFlex: false,
            topFlex: 32,
          ),
          rightWidget: Align(
            alignment: Alignment.bottomCenter, // Centrage vertical du Container
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 8), // Ajout d'un padding de 16px
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor1, // Utilisation de la couleur demandée
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.white),
                  onPressed: widget.onDelete,
                ),
              ),
            ),
          ),
          leftSize: 7,
          rightSize: 1,
        ),
      ),
    );
  }
}
