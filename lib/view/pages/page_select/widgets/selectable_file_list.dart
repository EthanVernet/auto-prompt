import 'package:flutter/material.dart';
import 'package:front/controller/main_controller.dart';
import 'package:front/logic/model/file/file_content_model.dart';
import 'package:front/logic/model/folder/folder_model.dart';
import 'package:front/view/pages/page_select/widgets/selectable_file_button.dart';

class SelectableFileList extends StatefulWidget {
  final MainController controller;
  final FolderModel? folder;

  const SelectableFileList({Key? key, required this.controller, this.folder}) : super(key: key);

  @override
  _SelectableFileListState createState() => _SelectableFileListState();
}

class _SelectableFileListState extends State<SelectableFileList> {
  List<FileContentModel> filterFiles() {
    if (widget.folder == null) {
      return [];
    }
    return widget.controller.getFileForCurrentTree(widget.folder!);
  }

  @override
  Widget build(BuildContext context) {
    List<FileContentModel> files = filterFiles();

    return Padding(
        padding: const EdgeInsets.only(top: 8),
        child: ListView.builder(
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
