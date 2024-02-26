import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../data/apiModal/getUserModal.dart';

class DatabaseHelper {
  late Database _database;

  Future<void> openDatabase() async {
    // _database = await openDatabase(
    //   join(await getDatabasesPath(), 'user_database.db'),
    //   onCreate: (db, version) {
    //     return db.execute(
    //       '''
    //       CREATE TABLE users(
    //         id INTEGER PRIMARY KEY,
    //         name TEXT,
    //         email TEXT,
    //         case_id TEXT,
    //         status TEXT,
    //         created_at TEXT,
    //         updated_at TEXT
    //       )
    //       ''',
    //     );
    //   },
    //   version: 1,
    // );
  }

  Future<void> insertUser(User user) async {
    await _database.insert('users', user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<User?> getUser() async {
    final List<Map<String, dynamic>> maps = await _database.query('users');
    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    }
    return null;
  }
}
