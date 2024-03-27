import 'package:front/logic/model/folder/folder_model.dart';

class FileModel {
<<<<<<< Updated upstream
=======
  int? id;
>>>>>>> Stashed changes
  String filePath;
  String fileContent;
  bool isSelected = false;
  FolderModel parentFolder;

  FileModel({
<<<<<<< Updated upstream
    required this.filePath,
    required this.fileContent,
    required this.parentFolder,
  });
}
=======
    required this.id,
    required this.filePath,
    required this.fileContent,
    required this.isSelected,
    required this.parentFolder,
  });

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'filePath': filePath,
      'fileContent': fileContent,
      'isSelected': isSelected,
      'parentFolder': parentFolder.toMap(),
    };
  }

  static FileModel fromMap(Map<String, dynamic> map) {
    return FileModel(
      id : map['id'],
      filePath: map['filePath'],
      fileContent: map['fileContent'],
      isSelected: map['isSelected'],
      parentFolder: FolderModel.fromMap(map['parentFolder']),
    );
  }
}
>>>>>>> Stashed changes
