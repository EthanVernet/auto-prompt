import 'package:front/logic/model/folder/folder_model.dart';

class FileContentModel {
  String filePath;
  String fileContent;
  bool isSelected = false;
  FolderModel parentFolder;

  FileContentModel({
    required this.filePath,
    required this.fileContent,
    required this.parentFolder,
  });

  String get fileName {
    RegExp pattern = RegExp(r'[^/\\]+$');
    Match match = pattern.firstMatch(filePath)!;
    return match[0]!;
  }

  @override
  String toString() {
    return 'FileContentModel(filePath: $filePath, fileName: $fileName, isSelected: $isSelected, fileContent: $fileContent, parentFolder: ${parentFolder?.fileName ?? "None"})';
  }
}
