import 'package:flutter/material.dart';
import 'package:front/controller/main_controller.dart';
import 'package:front/logic/model/file/file_content_model.dart';
import 'package:front/logic/model/folder/folder_model.dart';
import 'package:front/view/pages/page_select/widgets/selectable_file_button.dart';

class SelectableFileList extends StatefulWidget {
  final MainController controller;

  const SelectableFileList({Key? key, required this.controller}) : super(key: key);

  @override
  _SelectableFileListState createState() => _SelectableFileListState();
}

class _SelectableFileListState extends State<SelectableFileList> {
  @override
  @override
  void initState() {
    super.initState();
    widget.controller.selectController.selectedFolderNotifier.addListener(_updateFilesList);
    _updateFilesList(widget.controller.getRootFolder());
  }

  void _updateFilesList([FolderModel? newFolder]) {
    setState(() {
      var selectedFolder = newFolder ?? widget.controller.selectController.selectedFolderNotifier.value;
      if (selectedFolder != null) {
        widget.controller.selectController.selectFolder(selectedFolder);
      }
    });
  }

  @override
  void dispose() {
    widget.controller.selectController.selectedFolderNotifier.removeListener(_updateFilesList);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FolderModel? selectedFolder = widget.controller.selectController.selectedFolderNotifier.value;
    List<FileContentModel> files = selectedFolder != null
        ? widget.controller.selectController.getFilesForFolderAndSubfolders(selectedFolder)
        : [];

    return Container(
        child : ListView.builder(
          itemCount: files.length,
          itemBuilder: (context, index) {
            return SelectableFileItem(
              fileContentModel: files[index],
              controller: widget.controller,
              onSelected: () => setState(() {}),
            );
          },
        )
    );
  }
}
