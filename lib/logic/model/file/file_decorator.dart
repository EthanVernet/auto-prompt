import 'dart:io';

import 'package:front/logic/model/file/file_model.dart';

class FileDecorator {
  final FileModel fileModel;

  FileDecorator(this.fileModel);

  String fileName() {
    return fileModel.filePath
        .split(Platform.pathSeparator)
        .last;
  }

  String fileContent() {
    return '${fileModel.fileContent} :';
  }
}
