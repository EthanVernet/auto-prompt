import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "database.db";
  static const _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE Files (
            id INTEGER PRIMARY KEY,
            filePath TEXT NOT NULL UNIQUE,
            fileContent TEXT NOT NULL,
            isSelected BOOLEAN NOT NULL,
            parentFolderId INTEGER,
            FOREIGN KEY (parentFolderId) REFERENCES Folders (id)
          )
          ''');

    await db.execute('''
          CREATE TABLE Folders (
            id INTEGER PRIMARY KEY,
            selectedDirectoryPath TEXT NOT NULL UNIQUE
          )
          ''');

    await db.execute('''
          CREATE TABLE Sections (
            id INTEGER PRIMARY KEY,
            title TEXT NOT NULL,
            content TEXT NOT NULL,
            fileId INTEGER,
            folderId INTEGER,
            FOREIGN KEY (fileId) REFERENCES Files (id),
            FOREIGN KEY (folderId) REFERENCES Folders (id)
          )
          ''');
  }
}
