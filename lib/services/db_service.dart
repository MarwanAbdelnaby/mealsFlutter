import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' show Platform;
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DbService {
  static Database? _db;
  static bool _isWeb = identical(0, 0.0); 

  Future<void> initDb() async {
    if (_isWeb) {
      databaseFactory = databaseFactoryFfiWeb; 
    } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }

    final dbPath = await getDatabasesPath();
    _db = await openDatabase(
      join(dbPath, 'favorites.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE favorites (
            id INTEGER PRIMARY KEY, 
            name TEXT, 
            image TEXT, 
            timestamp INTEGER
          )
        ''');
      },
    );
  }

  Future<Database> get database async {
    if (_db != null) return _db!;
    await initDb();
    return _db!;
  }

  Future<void> addFavorite(int id, String name, String image) async {
    final db = await database;
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    await db.insert(
      'favorites',
      {'id': id, 'name': name, 'image': image, 'timestamp': timestamp},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getFavorites() async {
    final db = await database;
    return await db.query('favorites', orderBy: "timestamp DESC");
  }

  Future<void> deleteFavorite(int id) async {
    final db = await database;
    await db.delete(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
