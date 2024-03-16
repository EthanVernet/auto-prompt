import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart'; // Import foundation for debugPrint
import 'package:front/controller/page_controller/configure_controller.dart';
import 'package:front/controller/page_controller/select_controller.dart';
import 'package:front/logic/business/code_content_builder.dart';
import 'package:front/logic/model/file/file_content_model.dart';
import 'package:front/logic/model/folder/folder_model.dart';
import 'package:front/logic/model/section/section_model.dart';

class MainController extends ChangeNotifier {
  late final ConfigureController configureController;
  late final SelectController selectController;

  MainController() {
    configureController = ConfigureController();
    selectController = SelectController(
      folderModel: configureController.folderModel,
      languageManager: configureController.languageManager,
    );
    debugPrint('MainController() -- MainController initialized');
  }

  // Configure
  Future<String?> pickDirectory() async {
    var path = await configureController.pickDirectory();
    await loadFilesWithExtension();
    notifyListeners();
    return path;
  }

  List<String> getProgrammingLanguages() {
    var languages = configureController.getProgrammingLanguages();
    return languages;
  }

  void setSelectedLanguage(String languageName) {
    configureController.setSelectedLanguage(languageName);
    loadFilesWithExtension();
    notifyListeners();
  }

  List<SectionModel> getSections() {
    var sections = configureController.getSections();
    var sectionsString = sections.map((s) => 'Title: ${s.title}, Content: ${s.content}').join('; ');
    return sections;
  }

  void addSection(String title, String content) {
    configureController.addSection(title, content);
    notifyListeners();
  }

  void updateSection(int index, String title, String content) {
    configureController.updateSection(index, title, content);
    notifyListeners();
  }

  void removeSection(int index) {
    configureController.removeSection(index);
    notifyListeners();
  }

  String get selectedDirectoryPath {
    var path = configureController.selectedDirectoryPath;
    return path;
  }

  String get selectedLanguageName {
    var languageName = configureController.selectedLanguageName;
    return languageName;
  }

  // Select
  Future<void> loadFilesWithExtension() async {
    await selectController.loadFilesWithExtension();
  }

  FolderModel getRootFolder(){
    return selectController.getRootFolder();
  }

  List<FolderModel> getFolderTree() {
    List<FolderModel> folderTree = selectController.getFolderTree();
    var folderTreeString = folderTree.map((f) => f.fileName).join(', ');
    return folderTree;
  }

  List<FileContentModel> getFileForCurrentTree(FolderModel folder) {
    List<FileContentModel> localFiles = selectController.getFilesForFolderAndSubfolders(folder);
    var filesString = localFiles.map((f) => f.fileName).join(', ');
    return localFiles;
  }

  void toggleFileSelection(FileContentModel file) {
    selectController.toggleFileSelection(file);
    notifyListeners();
  }

  List<FileContentModel> get loadedFiles {
    var files = selectController.fileContentManager.files;
    var filesString = files.map((f) => f.fileName).join(', ');
    return files;
  }

  List<FileContentModel> get selectedFiles {
    var files = selectController.fileContentManager.selectedFiles;
    var filesString = files.map((f) => f.fileName).join(', ');
    return files;
  }

  void selectAllFiles() {
    for (var file in selectController.fileContentManager.files) {
      if (!file.isSelected) {
        selectController.toggleFileSelection(file);
      }
    }
    notifyListeners();
  }

  void deselectAllFiles() {
    for (var file in selectController.fileContentManager.files) {
      if (file.isSelected) {
        selectController.toggleFileSelection(file);
      }
    }
    notifyListeners();
  }

  // Copy
  String generateFinalContent() {
    CodeContentBuilder contentBuilder = CodeContentBuilder();
    return contentBuilder.generateContent(selectedFiles, getSections());
  }
}
