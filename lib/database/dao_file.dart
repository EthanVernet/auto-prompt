import 'package:front/database.dart';
import 'package:sqflite/sqflite.dart';

class DaoFile {
  final dbProvider = DatabaseHelper.instance;

  Future<int> insertFile(Map<String, dynamic> row) async {
    Database db = await dbProvider.database;
    return await db.insert('Files', row);
  }

  Future<List<Map<String, dynamic>>> fetchAllFiles() async {
    Database db = await dbProvider.database;
    return await db.query('Files');
  }

  Future<int> updateFile(Map<String, dynamic> row) async {
    Database db = await dbProvider.database;
    int id = row['id'];
    return await db.update('Files', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteFile(int id) async {
    Database db = await dbProvider.database;
    return await db.delete('Files', where: 'id = ?', whereArgs: [id]);
  }
}
