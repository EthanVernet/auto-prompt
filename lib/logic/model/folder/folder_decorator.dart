import 'dart:io';

import 'package:front/logic/model/folder/folder_model.dart';

class FolderDecorator {
  final FolderModel folderModel;

  FolderDecorator(this.folderModel);

  String folderName() {
    return folderModel.selectedDirectoryPath
        .split(Platform.pathSeparator)
        .last;
  }
}
