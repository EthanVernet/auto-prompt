import 'dart:io';
import 'package:front/logic/model/folder/folder_model.dart';

class FolderLoaderBusiness {
  final String rootPath;

  FolderLoaderBusiness({required this.rootPath});

  FolderModel loadFolders() {
    final rootDirectory = Directory(rootPath);
    if (!rootDirectory.existsSync()) {
      throw Exception("Root directory does not exist.");
    }

    FolderModel rootFolder = FolderModel(selectedDirectoryPath: rootPath);
    _processDirectory(rootDirectory, rootFolder);
    return rootFolder;
  }

  void _processDirectory(Directory directory, FolderModel currentFolder) {
    var entities = directory.listSync(recursive: false);
    for (var entity in entities) {
      if (entity is Directory) {
        var newFolder = FolderModel(selectedDirectoryPath: entity.path);
        currentFolder.subFolders.add(newFolder);
        _processDirectory(entity, newFolder);
      }
    }
  }
}
