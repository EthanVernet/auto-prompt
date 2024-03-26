import 'package:front/database.dart';
import 'package:sqflite/sqflite.dart';

class DaoSection {
  final dbProvider = DatabaseHelper.instance;

  Future<int> insertSection(Map<String, dynamic> row) async {
    Database db = await dbProvider.database;
    return await db.insert('Sections', row);
  }

  Future<List<Map<String, dynamic>>> fetchAllSections() async {
    Database db = await dbProvider.database;
    return await db.query('Sections');
  }

  Future<int> updateSection(Map<String, dynamic> row) async {
    Database db = await dbProvider.database;
    int id = row['id'];
    return await db.update('Sections', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteSection(int id) async {
    Database db = await dbProvider.database;
    return await db.delete('Sections', where: 'id = ?', whereArgs: [id]);
  }
}
