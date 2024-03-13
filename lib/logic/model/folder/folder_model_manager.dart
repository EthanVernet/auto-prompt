import 'package:front/logic/model/folder/folder_model.dart';

class FolderModelManager {
  FolderModel rootFolder;

  FolderModel get RootFolder => rootFolder;

  FolderModelManager(this.rootFolder);

  FolderModel getFolderStructure() {
    return rootFolder;
  }

  List<FolderModel> getFolderPathsInOrder() {
    List<FolderModel> paths = [];
    collectFolderPaths(rootFolder, paths);
    return paths;
  }

  void collectFolderPaths(FolderModel currentFolder, List<FolderModel> paths) {
    paths.add(currentFolder);
    for (var subFolder in currentFolder.subFolders) {
      collectFolderPaths(subFolder, paths);
    }
  }

  void clear() {
    rootFolder = FolderModel(selectedDirectoryPath: '');
  }
}
