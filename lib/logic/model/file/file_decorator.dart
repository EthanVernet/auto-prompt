<<<<<<< Updated upstream
import 'dart:io';

import 'package:front/logic/model/file/file_model.dart';

class FileDecorator {
  final FileModel fileModel;

  FileDecorator(this.fileModel);

  String fileName() {
    return fileModel.filePath
        .split(Platform.pathSeparator)
        .last;
=======
import 'package:front/logic/model/file/file_model.dart';

class FileDecorator {
  final FileModel _file;

  FileDecorator(this._file);

  String fileName() {
    return _file.filePath.split('/').last;
>>>>>>> Stashed changes
  }
}
