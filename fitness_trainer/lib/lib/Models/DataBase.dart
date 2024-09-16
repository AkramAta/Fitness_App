

import 'package:sqflite/sqflite.dart';

class UserDataBase {
  late Database db;

  Future<void> createDataBaseTable() async {
    db = await openDatabase(
      'user.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, password TEXT, email TEXT)");
        print("Table created");
      },
      onOpen: (db) {
        print("Database opened");
      },
    );
  }

  Future<void> insertUser({
    required String name,
    required String email,
    required String password,
  }) async {
    await db.transaction((txn) async {
      await txn.rawInsert(
          "INSERT INTO user (name, email, password) VALUES(?, ?, ?)",
          [name, email, password]);
    });
  }

  Future<List<Map>> getUsers() async {
    return await db.rawQuery("SELECT id, name, email, password FROM user");
  }

  Future<void> updateUser({
    required int id,
    required String name,
    required String email,
    required String password,
  }) async {
    await db.rawUpdate(
        "UPDATE user SET name = ?, email = ?, password =? WHERE id = ?",
        [name, email, password, id]);
  }

  Future<void> deleteUser({required int id}) async {
    await db.rawDelete("DELETE FROM user WHERE id = $id" );
  }
}
