import 'dart:io';
import 'package:front/logic/model/file/file_content_model.dart';
import 'package:front/logic/model/file/file_content_manager.dart';
import 'package:front/logic/model/folder/folder_model.dart';

class FileLoaderBusiness {
  final String rootPath;
  final List<String> extensions;
  final FileContentManager fileContentManager;

  FileLoaderBusiness({
    required this.rootPath,
    required this.extensions,
    required this.fileContentManager
  });

  void loadFiles() {
    final rootDirectory = Directory(rootPath);
    if (!rootDirectory.existsSync()) {
      throw Exception("Root directory does not exist.");
    }

    FolderModel rootFolder = FolderModel(selectedDirectoryPath: rootPath);
    _loadDirectoryFiles(rootDirectory, rootFolder);
  }

  void _loadDirectoryFiles(Directory directory, FolderModel parentFolder) {
    List<FileSystemEntity> entities = directory.listSync(recursive: false);
    for (var entity in entities) {
      if (entity is File && _fileHasValidExtension(entity.path)) {
        final String fileContent = entity.readAsStringSync();
        var newFile = FileContentModel(
            filePath: entity.path,
            fileContent: fileContent,
            parentFolder: parentFolder
        );
        fileContentManager.addFile(newFile);
      } else if (entity is Directory) {
        var newFolder = FolderModel(selectedDirectoryPath: entity.path);
        parentFolder.subFolders.add(newFolder);
        _loadDirectoryFiles(entity, newFolder);
      }
    }
  }

  bool _fileHasValidExtension(String filePath) {
    return extensions.any((extension) => filePath.endsWith(extension));
  }
}
