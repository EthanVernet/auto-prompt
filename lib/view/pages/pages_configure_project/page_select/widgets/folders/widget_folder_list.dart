import 'package:flutter/material.dart';
import 'package:front/core/app_color.dart';
import 'package:front/controller/controller_configure_project.dart';
import 'package:front/logic/model/folder/folder_model.dart';

import 'widget_folder_card.dart';

class WidgetFolderList extends StatefulWidget {
  final ControllerConfigureProject controller;

  const WidgetFolderList({Key? key, required this.controller}) : super(key: key);

  @override
  State<WidgetFolderList> createState() => _WidgetFolderListState();
}

class _WidgetFolderListState extends State<WidgetFolderList> {
  late FolderModel rootFolder;

  @override
  void initState() {
    super.initState();
    rootFolder = widget.controller.getRootFolder();
  }

  Widget buildFolderTree(FolderModel folder, {double indent = 16.0}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetFolderCard(
          folderModel: folder,
          controller: widget.controller,
          onSelected: () {
            setState(() {});
          },
          indentation: indent,
        ),
        ...folder.subFolders.map((subFolder) =>
            buildFolderTree(subFolder, indent: indent + 24.0)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 262,
      color: AppColors.lightBackground,
      child: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topLeft,
          child: buildFolderTree(rootFolder),
        ),
      ),
    );
  }
}