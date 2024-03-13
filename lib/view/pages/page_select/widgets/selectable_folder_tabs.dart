import 'package:flutter/material.dart';
import 'package:front/controller/main_controller.dart';
import 'package:front/logic/model/folder/folder_model.dart';
import 'package:front/view/pages/page_select/widgets/selectable_file_list.dart';

class SelectableFolderTabs extends StatefulWidget {
  final MainController controller;

  const SelectableFolderTabs({Key? key, required this.controller}) : super(key: key);

  @override
  State<SelectableFolderTabs> createState() => _SelectableFolderTabsState();
}

class _SelectableFolderTabsState extends State<SelectableFolderTabs> {
  FolderModel? selectedFolder;

  static const Color primaryColor2 = Color(0xFF5DA9E9);

  @override
  void initState() {
    super.initState();
    var folders = widget.controller.getFolderTree();
    if (folders.isNotEmpty) {
      selectedFolder = folders.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    var folders = widget.controller.getFolderTree();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: folders.map((folder) {
                bool isSelected = selectedFolder == folder;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ChoiceChip(
                    label: Text(
                      folder.fileName,
                      style: TextStyle(
                        color: isSelected ? Colors.white : primaryColor2,
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() {
                        selectedFolder = folder;
                      });
                    },
                    selectedColor: primaryColor2,
                    backgroundColor: Colors.white,
                    shape: StadiumBorder(
                      side: isSelected
                          ? BorderSide.none
                          : const BorderSide(color: primaryColor2),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: SelectableFileList(
              controller: widget.controller,
              folder: selectedFolder,
            ),
          ),
        ],
      ),
    );
  }
}
