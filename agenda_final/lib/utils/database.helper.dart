import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:agenda/models/event.model.dart';

class DatabaseHelper {
  final String table = 'eventTable';
  final String columnId = 'id';
  final String columnCategory = 'category';
  final String columnDate = 'date';
  final String columnTime = 'time';
  final String columnDescription = 'desc';
  final String columnStatus = 'status';

  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if(_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'maindb.db');

    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
      /* id | category | date | time | desc | status */
        'CREATE TABLE $table($columnId INTEGER PRIMARY KEY, $columnCategory TEXT, $columnDate TEXT, $columnTime TEXT, $columnDescription TEXT, $columnStatus TEXT)'
    );
  }

  /* CRUD */
  Future<int> saveEvent(Event event) async {
    var dbClient = await db;
    int res = await dbClient.insert('$table', event.toMap());
    return res;
  }

  Future<List> getAllEvents() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery('SELECT * FROM $table');
    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $table')
    );
  }

  Future<Event> getEvent(int id) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery('SELECT * FROM $table WHERE $columnId = $id');
    if(result.length == 0) return null;
    return new Event.map(result.first);
  }

  Future<int> deleteEvent(int id) async {
    var dbClient = await db;

    return await dbClient.delete(table,
        where: "$columnId = ?", whereArgs: [id]);
  }


  Future<int> updateEvent(Event event) async {
    var dbClient = await db;
    return await dbClient.update(table,
        event.toMap(), where: "$columnId = ?", whereArgs: [event.Id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}

