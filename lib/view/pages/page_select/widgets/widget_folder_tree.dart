import 'package:flutter/material.dart';
import 'package:front/app/app_color.dart';
import 'package:front/controller/main_controller.dart';
import 'package:front/logic/model/folder/folder_model.dart';

class WidgetFolderTree extends StatefulWidget {
  final MainController controller;

  const WidgetFolderTree({Key? key, required this.controller}) : super(key: key);

  @override
  State<WidgetFolderTree> createState() => _WidgetFolderTreeState();
}

class _WidgetFolderTreeState extends State<WidgetFolderTree> {
  late FolderModel rootFolder;

  @override
  void initState() {
    super.initState();
    rootFolder = widget.controller.getRootFolder();
  }

  Widget buildFolderTree(FolderModel folder, {double indent = 16.0}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 52,
          color: AppColors.lightBackground,
          child: Padding(
            padding: EdgeInsets.only(left: indent),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              leading: const Icon(Icons.folder, color: AppColors.actionColor),
              title: Text(
                folder.fileName,
                style: const TextStyle(fontSize: 12),
              ),
              onTap: () {
                widget.controller.selectController.selectFolder(folder);
              },
            ),
          ),
        ),
        ...folder.subFolders.map((subFolder) => buildFolderTree(subFolder, indent: indent + 24.0)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: buildFolderTree(rootFolder),
    );
  }
}
