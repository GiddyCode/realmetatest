import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await initDatabase();
      return _database!;
    }
  }

  Future<Database> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'auth.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT,
            password TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertUser(String email, String password) async {
    final db = await database;
    await db.insert(
      'users',
      {'email': email, 'password': password},
    );
  }

  Future<Map<String, dynamic>?> getUser(String email, String password) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }
}
