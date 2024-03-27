import 'package:front/logic/model/file/file_model.dart';
import 'package:front/logic/model/folder/folder_model.dart';
import 'package:sqflite/sqflite.dart';

class DaoFile {
  final Database db;

  DaoFile(this.db);

  Future<List<FileModel>> getAllFiles() async {
    final List<Map<String, dynamic>> maps = await db.query('Files');
    return List.generate(maps.length, (i) {
      return FileModel.fromMap(maps[i]);
    });
  }

  Future<void> insertFile(FileModel file) async {
    await db.insert(
      'Files',
      file.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateFile(FileModel file) async {
    await db.update(
      'Files',
      file.toMap(),
      where: 'id = ?',
      whereArgs: [file.id],
    );
  }

  Future<void> deleteFile(int id) async {
    await db.delete(
      'Files',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<FileModel>> getFilesForFolder(FolderModel folder) async {
    final List<Map<String, dynamic>> folderMaps = await db.query(
        'Folders',
        where: 'parentFolderId = ?',
        whereArgs: [folder.id]
    );

    Set<String> filePaths = folderMaps.map((f) => f['selectedDirectoryPath'] as String).toSet();

    List<FileModel> files = [];
    for (String path in filePaths) {
      final List<Map<String, dynamic>> fileMaps = await db.query(
          'Files',
          where: 'parentFolderPath = ?',
          whereArgs: [path]
      );

      files.addAll(fileMaps.map(FileModel.fromMap));
    }

    return files;
  }
}
