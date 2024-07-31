import 'package:cose_front/model/place.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabaseHelper {
  static final LocalDatabaseHelper instance = LocalDatabaseHelper._init();
  static Database? _database;

  LocalDatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('places.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE place(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      url TEXT,
      category TEXT,
      address TEXT,
      longitude REAL,
      latitude REAL,
      placeOrder INTEGER
    )
    ''');
  }

  Future<void> insertPlace(Place place) async {
    final db = await instance.database;

    await db.insert('place', place.toJson());
  }

  Future<List<Place>> fetchPlaces() async {
    final db = await instance.database;
    final maps = await db.query('place', orderBy: 'placeOrder');
    return maps.map((map) => Place.fromJson(map)).toList();
  }

  Future<void> updatePlaceIndex(int id, int newIndex) async {
    final db = await instance.database;
    await db.update(
      'place',
      {'placeOrder': newIndex},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deletePlace(int id) async {
    final db = await instance.database;
    await db.delete('place', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteAllPlaces() async {
    final db = await instance.database;
    await db.delete('place');
  }
  Future<void> recreateDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'place.db');

    if (_database != null) {
      await _database!.close();
      _database = null;
    }

    await deleteDatabase(path);

    _database = await _initDB('place.db');
  }
}
