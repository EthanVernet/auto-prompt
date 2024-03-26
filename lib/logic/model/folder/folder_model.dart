class FolderModel {
  late String selectedDirectoryPath;
  late List<FolderModel> subFolders;

  FolderModel({
    required this.selectedDirectoryPath,
    required this.subFolders,
  });
}
