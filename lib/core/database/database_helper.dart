import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../utils/app_constant.dart';

class DatabaseHelper {
  static const databaseName = 'myDatabase.db';
  static const databaseVersion = 1;

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get getDataBase async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), databaseName);
    return openDatabase(path, version: databaseVersion,

        onCreate: (db, version) {
      db.execute(
          'CREATE TABLE IF NOT EXISTS ${AppConstant.customerTable} (${AppConstant.id} INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, ${AppConstant.displayNameColumn} TEXT NOT NULL UNIQUE ,${AppConstant.phoneNumber} TEXT NOT NULL UNIQUE );');

      // db.execute(
      //     'CREATE TABLE IF NOT EXISTS ${AppConstant.followUpTable} (${AppConstant.id} INTEGER PRIMARY KEY AUTOINCREMENT , ${AppConstant.description} TEXT NOT NULL, ${AppConstant.customerId} TEXT NOT NULL ,${AppConstant.date} DATETIME DEFAULT CURRENT_TIMESTAMP);');
    });
  }
}
