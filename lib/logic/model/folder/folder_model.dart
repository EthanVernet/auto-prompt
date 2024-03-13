class FolderModel {
  String _selectedDirectoryPath;
  List<FolderModel> subFolders;

  FolderModel({
    required String selectedDirectoryPath,
    List<FolderModel>? subFolders,
  })  : _selectedDirectoryPath = selectedDirectoryPath,
        subFolders = subFolders ?? [];

  String get selectedDirectoryPath => _selectedDirectoryPath;

  set selectedDirectoryPath(String path) {
    _selectedDirectoryPath = path;
  }

  List<FolderModel> getAllFoldersRecursively() {
    var allFolders = <FolderModel>{};

    void traverseFolders(FolderModel folder) {
      allFolders.add(folder);
      folder.subFolders.forEach(traverseFolders);
    }

    traverseFolders(this);
    return allFolders.toList();
  }

  String get fileName {
    RegExp pattern = RegExp(r'[^/\\]+$');
    Match match = pattern.firstMatch(_selectedDirectoryPath)!;
    return match[0]!;
  }

  @override
  String toString() {
    String subFoldersStr = subFolders.map((e) => e.fileName).join(', ');
    return 'FolderModel(selectedDirectoryPath: $_selectedDirectoryPath, fileName: $fileName, subFolders: [$subFoldersStr])';
  }
}
