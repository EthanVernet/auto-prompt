<<<<<<< Updated upstream
import 'dart:io';

import 'package:front/logic/model/folder/folder_model.dart';

class FolderDecorator {
  final FolderModel folderModel;

  FolderDecorator(this.folderModel);

  String fileName() {
    return folderModel.selectedDirectoryPath
        .split(Platform.pathSeparator)
        .last;
=======
import 'folder_model.dart';

class FolderDecorator {
  final FolderModel _folder;

  FolderDecorator(this._folder);

  String folderName() {
    throw UnimplementedError();
>>>>>>> Stashed changes
  }
}
