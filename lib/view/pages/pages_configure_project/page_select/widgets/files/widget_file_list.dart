import 'package:flutter/material.dart';
import 'package:front/core/app_color.dart';
import 'package:front/controller/controller_configure_project.dart';
import 'package:front/logic/model/file/file_model.dart';
import 'package:front/logic/model/folder/folder_model.dart';

import 'widget_file_card.dart';

class SelectableFileList extends StatefulWidget {
  final ControllerConfigureProject controller;

  const SelectableFileList({Key? key, required this.controller}) : super(key: key);

  @override
  _SelectableFileListState createState() => _SelectableFileListState();
}

class _SelectableFileListState extends State<SelectableFileList> {
  @override
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateFilesList);
    _updateFilesList(widget.controller.getRootFolder());
  }

  void _updateFilesList([FolderModel? newFolder]) {
    setState(() {
      var selectedFolder = newFolder ?? widget.controller.selectedFolder();
      if (selectedFolder != null) {
        widget.controller.selectFolder(selectedFolder);
      }
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateFilesList);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FolderModel? selectedFolder = widget.controller.selectedFolder();
    List<FileModel> files;
    if (selectedFolder != null) {
      files = widget.controller.getAllFiles(selectedFolder);
    } else {
      files = [];
    }

    return Container(
      color: AppColors.lightBackground,
      child: ListView.builder(
        itemCount: files.length,
        itemBuilder: (context, index) {
          return WidgetFileCard(
            fileModel: files[index],
            controller: widget.controller,
            onSelected: () => setState(() {}),
          );
        },
      ),
    );
  }
}