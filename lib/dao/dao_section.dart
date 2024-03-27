import 'package:front/logic/model/section/section_model.dart';
import 'package:sqflite/sqflite.dart';

class DaoSection {
  final Database db;

  DaoSection(this.db);

  Future<List<SectionModel>> getAllSections() async {
    final List<Map<String, dynamic>> maps = await db.query('Sections');
    return List.generate(maps.length, (i) {
      return SectionModel.fromMap(maps[i]);
    });
  }

  Future<void> insertSection(SectionModel section) async {
    await db.insert(
      'Sections',
      section.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateSection(SectionModel section) async {
    await db.update(
      'Sections',
      section.toMap(),
      where: 'id = ?',
      whereArgs: [section.id],
    );
  }

  Future<void> deleteSection(int id) async {
    await db.delete(
      'Sections',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
