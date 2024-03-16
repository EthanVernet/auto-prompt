import 'package:flutter/cupertino.dart';
import 'package:front/logic/business/file_loader_business.dart';
import 'package:front/logic/business/folder_loader_business.dart';
import 'package:front/logic/model/file/file_content_manager.dart';
import 'package:front/logic/model/file/file_content_model.dart';
import 'package:front/logic/model/folder/folder_model.dart';
import 'package:front/logic/model/folder/folder_model_manager.dart';
import 'package:front/logic/model/language/programming_language_manager.dart';

class SelectController extends ChangeNotifier {
  FolderModelManager folderModelManager;
  FileContentManager fileContentManager;
  final FolderModel folderModel;
  final ProgrammingLanguageManager languageManager;

  ValueNotifier<FolderModel?> selectedFolderNotifier = ValueNotifier(null);

  SelectController({required this.folderModel, required this.languageManager})
      : folderModelManager = FolderModelManager(FolderModel(selectedDirectoryPath: '')),
        fileContentManager = FileContentManager();

  Future<void> loadFilesWithExtension() async {
    folderModelManager.clear();
    fileContentManager.clear();

    if (folderModel.selectedDirectoryPath.isNotEmpty && languageManager.selectedLanguage.extensions.isNotEmpty) {
      FolderLoaderBusiness folderLoaderBusiness = FolderLoaderBusiness(rootPath: folderModel.selectedDirectoryPath);
      FolderModel rootFolder = folderLoaderBusiness.loadFolders();

      FileLoaderBusiness fileLoaderBusiness = FileLoaderBusiness(
        rootPath: folderModel.selectedDirectoryPath,
        extensions: languageManager.selectedLanguage.extensions,
        fileContentManager: fileContentManager,
      );

      try {
        fileLoaderBusiness.loadFiles();
        folderModelManager = FolderModelManager(rootFolder);
        notifyListeners();
      } catch (e) {
        debugPrint('Error loading files: $e');
      }
    }
  }

  void selectFolder(FolderModel folder) {
    selectedFolderNotifier.value = folder;
  }

  FolderModel getRootFolder() {
    return folderModelManager.RootFolder;
  }

  List<FolderModel> getFolderTree() {
    return folderModelManager.getFolderPathsInOrder();
  }

  List<FileContentModel> getFilesForFolderAndSubfolders(FolderModel folder) {
    return fileContentManager.getFilesForFolderAndSubfolders(folder);
  }

  void toggleFileSelection(FileContentModel file) {
    fileContentManager.toggleSelection(file);
    notifyListeners();
  }
}
