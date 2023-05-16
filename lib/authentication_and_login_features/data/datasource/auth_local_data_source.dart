import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../core/common_domain/entities/user.dart';

class AuthLocalDataSource {
  static final AuthLocalDataSource _instance = AuthLocalDataSource.internal();
  factory AuthLocalDataSource() => _instance;

  static late Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  AuthLocalDataSource.internal();

  initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "snapjobs.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY, username TEXT, password TEXT, email TEXT, country TEXT, age TEXT, token TEXT)");



    print("Created tables");
  }

  Future<int> cacheUser(User user) async {
    if (await isLoggedIn()) {
      await deleteUsers();
    }
    var dbClient = await db;
    int res = await dbClient.insert("User", user.toMap());
    return res;
  }

  Future<int> deleteUsers() async {
    var dbClient = await db;
    int res = await dbClient.delete("User");
    return res;
  }

  Future<bool> isLoggedIn() async {
    var dbClient = await db;
    var res = await dbClient.query("User");
    return res.isNotEmpty ? true : false;
  }





}
