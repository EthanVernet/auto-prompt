import 'package:flutter/material.dart';
import 'package:front/controller/controller_project.dart';
import 'package:front/logic/model/file/file_model.dart';
import 'package:front/logic/model/folder/folder_model.dart';
import 'package:front/view/pages/page_select/widgets/selectable_file_button.dart';

class SelectableFileList extends StatefulWidget {
  final ControllerProject controller;

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
      var selectedFolder = newFolder;
      if (selectedFolder != null) {
        widget.controller.selectFolder(selectedFolder);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FolderModel? selectedFolder = widget.controller.selectedFolder();
    List<FileModel> files = selectedFolder()
        ? widget.controller.getFilesForFolderAndSubfolders(selectedFolder)
        : [];

    return Container(
        child : ListView.builder(
          itemCount: files.length,
          itemBuilder: (context, index) {
            return SelectableFileItem(
              file: files[index],
              controller: widget.controller,
              onSelected: () => setState(() {}),
            );
          },
        )
    );
  }
}
