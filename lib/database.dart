<<<<<<< Updated upstream
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "database.db";
  static const _databaseVersion = 1;
=======
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DatabaseHelper {
  static const String _databaseName = "database.db"; // Modifier ici
  static const int _databaseVersion = 1; // Modifier ici
>>>>>>> Stashed changes

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
<<<<<<< Updated upstream
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
=======
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName); // Modifier ici
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate); // Modifier ici
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Folders(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          path TEXT NOT NULL,
          parentFolderId INTEGER,
          FOREIGN KEY (parentFolderId) REFERENCES Folders(id)
      );
  ''');
    await db.execute('''
      CREATE TABLE Files(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          content TEXT NOT NULL,
          folderId INTEGER,
          FOREIGN KEY (folderId) REFERENCES Folders(id)
      );
  ''');
    await db.execute('''
      CREATE TABLE Sections(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          content TEXT NOT NULL
      );
  ''');
>>>>>>> Stashed changes
  }
}
