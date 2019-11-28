import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';

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
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
       /* id | category | date | time | desc | status */
      'CREATE TABLE $table($columnId INTEGER PRIMARY KEY, $columnCategory TEXT, $columnDate TEXT, $columnTime TEXT, $columnDescription TEXT, $columnStatus TEXT'
    );
  }

  /* CRUD */

}

