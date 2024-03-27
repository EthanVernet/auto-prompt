import 'package:flutter/material.dart';
import 'package:front/controller/controller_configure_project.dart';
import 'package:front/logic/model/folder/folder_decorator.dart';
import 'package:front/logic/model/folder/folder_model.dart';
import 'package:front/view/widgets/sub_title.dart';

class WidgetFolderSubtitle extends StatelessWidget {
  final ControllerConfigureProject controller;

  const WidgetFolderSubtitle({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<FolderModel?>(
      valueListenable: controller.selectedFolderNotifier(),
      builder: (_, FolderModel? selectedFolder, __) {
        String additionalText = selectedFolder != null ? " in ${FolderDecorator(selectedFolder).folderName()}" : "";
        return SubTitleWidget(
          title: 'Select File',
          additionalText: additionalText,
        );
      },
    );
  }
}
