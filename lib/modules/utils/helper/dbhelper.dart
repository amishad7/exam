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

  initDB() async {
    String path = await getDatabasesPath();
    String db = join(path, 'user.db');

    sb = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE $tableName ($id INTEGER PRIMARY KEY AUTOINCREMENT, $name TEXT NOTNULL,$mail TEXT NOTNULL, $password TEXT NOTNULL);');
      },
    );
  }

  Future<Future<int>?> insertValue(
      {required String name,
      required String mail,
      required String password}) async {
    await initDB;

    return sb?.insert(
        tableName, {this.name: name, this.password: password, this.mail: mail});
  }
}
