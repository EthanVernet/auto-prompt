import 'package:flutter/material.dart';

import 'package:front/database/dao_file.dart';
import 'package:front/database/dao_folder.dart';
import 'package:front/database/dao_section.dart';
import 'package:front/logic/model/file/file_model.dart';
import 'package:front/logic/model/folder/folder_model.dart';
import 'package:front/logic/model/section/section_model.dart';

class ControllerProject extends ChangeNotifier {
  late DaoFile daoFile;
  late DaoFolder daoFolder;
  late DaoSection daoSection;

  ControllerProject(){
    daoFile = DaoFile();
    daoFolder = DaoFolder();
    daoSection = DaoSection();
  }
  // Methods related to sections in WidgetSectionsList
  void addSection(String title, String content) {
    throw UnimplementedError();
  }

  List<SectionModel> getSections() {
    throw UnimplementedError();
  }

  void removeSection(int index) {
    throw UnimplementedError();
  }

  void updateSection(int index, String title, String content) {
    throw UnimplementedError();
  }

  // Methods related to file extension selection in WidgetExtensionSelector
  List<String> getProgrammingLanguages() {
    throw UnimplementedError();
  }

  void setSelectedLanguage(String language) {
    throw UnimplementedError();
  }

  // Methods related to file directory picking in WidgetFilePicker
  Future<String?> pickDirectory() async {
    throw UnimplementedError();
  }

  // Methods related to content generation in WidgetDisplayPrompt
  String generateFinalContent() {
    throw UnimplementedError();
  }

  // Methods related to file selection in SelectableControlButtons
  void selectAllFiles() {
    throw UnimplementedError();
  }

  void deselectAllFiles() {
    throw UnimplementedError();
  }

  // Methods for file selection toggle in SelectableFileButton (inferred)
  void toggleFileSelection(FileModel fileContentModel) {
    throw UnimplementedError();
  }

  // Methods for file and folder selection in SelectableFileList
  FolderModel getRootFolder() {
    throw UnimplementedError();
  }

  void selectFolder(FolderModel folder) {
    throw UnimplementedError();
  }

  List<FileModel> getFilesForFolderAndSubfolders(FolderModel folder) {
    throw UnimplementedError();
  }
}

