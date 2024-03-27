import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:front/dao/dao_file.dart';
import 'package:front/dao/dao_folder.dart';
import 'package:front/dao/dao_section.dart';
import 'package:front/logic/model/file/file_model.dart';
import 'package:front/logic/model/folder/folder_model.dart';
import 'package:front/logic/model/language/programming_language_init.dart';
import 'package:front/logic/model/language/programming_language_manager.dart';

class ControllerConfigureProject extends ChangeNotifier {
  late final ProgrammingLanguageManager programmingLanguageManager;

  late final DaoFile daoFile;
  late final DaoFolder daoFolder;
  late final DaoSection daoSection;

  ControllerConfigureProject(Database db) {
    programmingLanguageManager = ProgrammingLanguageInit.init();
    daoFile = DaoFile(db);
    daoFolder = DaoFolder(db);
    daoSection = DaoSection(db);
  }

  // Method for FileLoaderBusiness
  void insertFile(String filepath, String content, FolderModel parentFolder) {
    var newFile = FileModel(
      id: null,
      filePath: filepath,
      fileContent: content,
      isSelected: false,
      parentFolder: parentFolder,
    );
    daoFile.insertFile(newFile);
  }

  //-----Method for PageConfigure

  // Method for WidgetFilePickerButton
  Future<String?> pickDirectory() {
    throw UnimplementedError();
  }

  // Method for WidgetFIlePickerText
  get selectedDirectoryPath {
    throw UnimplementedError();
  }

  // Method for WidgetSectionButton
  void addSection(String s, String t) {
    throw UnimplementedError();
  }

  // Method for WidgetSectionList
  getSections() {
    throw UnimplementedError();
  }

  void removeSection(int index) {
    throw UnimplementedError();
  }

  void updateSection(int index, String title, String content) {
    throw UnimplementedError();
  }

  // Method for WidgetExtensionSelector
  List<String> getLanguages() {
    throw UnimplementedError();
  }
  void setSelectedLanguage(String newValue) {
    throw UnimplementedError();
  }

  //----- Method for PageCopy

  // Method for WidgetCodeCard
  getFinalContent() {
    throw UnimplementedError();
  }

  //----- Method for PageSelect

  // Method for WidgetFileButtonDeselected
  void deselectAllFiles() {
    throw UnimplementedError();
  }

  // Method for WidgetFileButtonSelected
  void selectAllFiles(){
    throw UnimplementedError();
  }

  // Method for WidgetFileCard
  void toggleFileSelection(FileModel fileContentModel) {
    throw UnimplementedError();
  }

  // Method for WidgetFileList
  FolderModel getRootFolder(){
    throw UnimplementedError();
  }

  FolderModel? selectedFolder() {
    throw UnimplementedError();
  }

  void selectFolder(FolderModel selectedFolder) {
    throw UnimplementedError();
  }

  List<FileModel> getAllFiles(FolderModel selectedFolder){
    throw UnimplementedError();
  }

  // Method for WidgetFolderSubTitle
  selectedFolderNotifier() {
    throw UnimplementedError();
  }
}
