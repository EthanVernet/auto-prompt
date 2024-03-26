import 'package:front/logic/model/folder/folder_model.dart';

class FileModel {
  String filePath;
  String fileContent;
  bool isSelected = false;
  FolderModel parentFolder;

  FileModel({
    required this.filePath,
    required this.fileContent,
    required this.parentFolder,
  });
}
