import 'dart:io';
<<<<<<< Updated upstream
import 'package:front/logic/model/file/file_model.dart';
=======
import 'package:front/controller/controller_configure_project.dart';
>>>>>>> Stashed changes
import 'package:front/logic/model/file/file_content_manager.dart';
import 'package:front/logic/model/file/file_model.dart';
import 'package:front/logic/model/folder/folder_model.dart';

class FileLoaderBusiness {
  final String rootPath;
  final List<String> extensions;
  final FileContentManager fileContentManager;
  final ControllerConfigureProject controller;

  FileLoaderBusiness({
    required this.rootPath,
    required this.extensions,
    required this.fileContentManager,
    required this.controller,
  });

  void loadFiles() {
    final rootDirectory = Directory(rootPath);
    if (!rootDirectory.existsSync()) {
      throw Exception("Root directory does not exist.");
    }

    var rootFolder = FolderModel(
      id: 0, // ID placeholder
      selectedDirectoryPath: rootPath,
      subFolders: [],
    );
    _loadDirectoryFiles(rootDirectory, rootFolder);
  }

  void _loadDirectoryFiles(Directory directory, FolderModel parentFolder) async {
    var entities = directory.listSync(recursive: false);
    for (var entity in entities) {
      if (entity is File && _fileHasValidExtension(entity.path)) {
        var fileContent = await entity.readAsString();
        controller.insertFile(entity.path, fileContent, parentFolder);
      } else if (entity is Directory) { }
    }
  }

  bool _fileHasValidExtension(String filePath) {
    return extensions.any((extension) => filePath.endsWith(extension));
  }
}
