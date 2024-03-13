import 'package:front/logic/model/file/file_content_model.dart';
import 'package:front/logic/model/folder/folder_model.dart';

class FileContentManager {
  final List<FileContentModel> _files = [];

  void addFile(FileContentModel fileContentModel) {
    _files.add(fileContentModel);
  }

  void clearFiles() {
    _files.clear();
  }

  void toggleSelection(FileContentModel file) {
    final index = _files.indexOf(file);
    if (index != -1) {
      _files[index].isSelected = !_files[index].isSelected;
    }
  }

  void clear() {
    _files.clear();
  }

  List<FileContentModel> get files => List.unmodifiable(_files);

  List<FileContentModel> get selectedFiles => _files.where((file) => file.isSelected).toList();

  List<FileContentModel> get unselectedFiles => _files.where((file) => !file.isSelected).toList();

  List<FileContentModel> getFilesForFolderAndSubfolders(FolderModel folder) {
    var relevantFolders = folder.getAllFoldersRecursively();
    var filePaths = relevantFolders.map((f) => f.selectedDirectoryPath).toSet();

    return _files.where((file) {
      var fileFolder = file.parentFolder;
      return fileFolder != null && filePaths.contains(fileFolder.selectedDirectoryPath);
    }).toList();
  }
}
