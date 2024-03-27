import 'package:front/logic/model/folder/folder_model.dart';
import 'package:sqflite/sqflite.dart';

class DaoFolder {
  final Database db;

  DaoFolder(this.db);

  Future<List<FolderModel>> getAllFolders() async {
    final List<Map<String, dynamic>> maps = await db.query('Folders');
    return List.generate(maps.length, (i) {
      return FolderModel.fromMap(maps[i]);
    });
  }

  Future<void> insertFolder(FolderModel folder) async {
    await db.insert(
      'Folders',
      folder.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateFolder(FolderModel folder) async {
    await db.update(
      'Folders',
      folder.toMap(),
      where: 'id = ?',
      whereArgs: [folder.id],
    );
  }

  Future<void> deleteFolder(int id) async {
    await db.delete(
      'Folders',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
