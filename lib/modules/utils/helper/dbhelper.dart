import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static DBHelper instance = DBHelper._();

  String tableName = "user";
  String name = 'name';
  String password = 'password';
  String mail = "mail";
  String id = "id";

  Database? sb;

  Future<String> checkPath(String dbName) async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, dbName);
    if (await Directory(dirname(path)).exists()) {
    } else {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e);
      }
    }
    return path;
  }

  initDB() async {
    String path = await checkPath('user.db');
    sb = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE $tableName ($id INTEGER PRIMARY KEY AUTOINCREMENT, $name TEXT NOT NULL,$mail TEXT NOT NULL, $password TEXT NOT NULL);');
      },
    );
  }

  Future<int?> insertValue(
      {required String name,
      required String mail,
      required String password}) async {
    initDB;

    if (sb == null) {
      initDB();
    }
    if (name == null && mail == null && password == null) {
      return sb?.insert(tableName,
          {this.name: name, this.password: password, this.mail: mail});
    }
  }

  Future<List<Map<String, Object?>>>? fetchData() {
    initDB();
    return sb?.query(tableName);
  }


}
