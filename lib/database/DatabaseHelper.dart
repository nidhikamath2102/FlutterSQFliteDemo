import 'package:flutter/cupertino.dart';
import 'package:flutter_sqflite/model/User.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final String db_user = "users.db";
  final String table_user = "user";


  openDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    String dbPath = join(await getDatabasesPath(), db_user);

    Future<Database> db = openDatabase(dbPath, onCreate: getDb, version: 1);
    return db;
  }

  void getDb(Database db, int version){
    String query = "CREATE TABLE " + table_user + "(id INTEGER AUTOINCREMENT PRIMARY KEY, userName TEXT, contact BIGINT NOT NULL);";
    db.execute(query);
  }

  Future<void> insertUser(User user) async{
    final Database db = await openDb();
    await db.insert(table_user, user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<User>> getAllUsers() async{
    final Database db = await openDb();
    final List<Map<String, dynamic>> users = await db.query(table_user);

    return List.generate(users.length, (i){
      return User(id: users[i]['id'], userName: users[i]['userName'], contact: users[i]['contact']);
    });
  }

  Future<void> updateUser(User user) async{
    final Database db = await openDb();
    await db.update(table_user, user.toMap(),
    where: "id = ?",
    whereArgs: [user.id]);
  }

  Future<void> deleteUser(User user) async{
    final Database db = await openDb();
    await db.delete(table_user,
        where: "id = ?",
        whereArgs: [user.id]);
  }

}
