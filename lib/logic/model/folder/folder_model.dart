class FolderModel {
  late int id;
  late String selectedDirectoryPath;
  late List<FolderModel> subFolders;

  FolderModel({
    required int id,
    required String selectedDirectoryPath,
    required List<FolderModel>? subFolders,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'selectedDirectoryPath': selectedDirectoryPath,
      'subFolders': subFolders.map((e) => e.toMap()).toList(),
    };
  }

  factory FolderModel.fromMap(Map<String, dynamic> map) {
    return FolderModel(
      id: map['id'],
      selectedDirectoryPath: map['selectedDirectoryPath'],
      subFolders: map['subFolders'] != null
          ? (map['subFolders'] as List).map((e) => FolderModel.fromMap(e)).toList()
          : [],
    );
  }
}
