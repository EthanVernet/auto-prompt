import 'package:front/database.dart';
import 'package:sqflite/sqflite.dart';

class DaoFolder {
  final dbProvider = DatabaseHelper.instance;

  Future<int> insertFolder(Map<String, dynamic> row) async {
    Database db = await dbProvider.database;
    return await db.insert('Folders', row);
  }

  Future<List<Map<String, dynamic>>> fetchAllFolders() async {
    Database db = await dbProvider.database;
    return await db.query('Folders');
  }

  Future<int> updateFolder(Map<String, dynamic> row) async {
    Database db = await dbProvider.database;
    int id = row['id'];
    return await db.update('Folders', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteFolder(int id) async {
    Database db = await dbProvider.database;
    return await db.delete('Folders', where: 'id = ?', whereArgs: [id]);
  }
}
