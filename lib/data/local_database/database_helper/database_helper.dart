import 'package:preeti_s_application3/data/local_database/database_const/database_const.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, DatabaseConst.databaseName);

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS user (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        token TEXT,
        email TEXT,
        name TEXT,
        greeting TEXT,
        password TEXT,
        status TEXT,
        case_id TEXT,
        status_id TEXT,
        toNotification TEXT,
        fqNotification TEXT,
        appoinmentNotification TEXT
      )
    ''');
  }

  Future<int> insertUser(UserModel user) async {
    print("data inserted");
    final db = await database;
    return await db.insert('user', user.toMap());
  }

  Future<List<UserModel>> getAllUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('user');
    return List.generate(maps.length, (i) => UserModel.fromMap(maps[i]));
  }
  Future<UserModel?> getUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('user', limit: 1);
    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    } else {
      return null; // Return null if no user is found
    }
  }
  Future<int> deleteAllUsers() async {
    final db = await database;
    return await db.delete('user');
  }


  Future<int> deleteFirstUser() async {
    print("user deleted");
    final db = await database;
    final firstUser = await db.query('user', limit: 1);

    if (firstUser.isNotEmpty) {
      final firstUserId = firstUser[0]['id'];
      return await db.delete('user', where: 'id = ?', whereArgs: [firstUserId]);
    } else {
      return 0; // Return 0 if no user is found
    }
  }
  Future<int> updateFirstUserColumn(String columnName, String newValue) async {

    print("data updated $newValue and $columnName");
    final db = await database;

    // Get the first user
    final List<Map<String, dynamic>> users = await db.query('user', limit: 1);

    if (users.isNotEmpty) {
      final int firstUserId = users[0]['id'];

      // Update the specified column for the first user
      return await db.update(
        'user',
        {columnName: newValue},
        where: 'id = ?',
        whereArgs: [firstUserId],
      );
    } else {
      return 0; // Return 0 if no user is found
    }
  }
  // @override
  // void onUpgrade( int oldVersion, int newVersion) async {
  //   print('Perform database schema changes when upgrading');
  //   final db = await database;
  //   if (oldVersion < 2) {
  //     await db.execute('''
  //       ALTER TABLE user
  //       ADD COLUMN isUserLogin TEXT
  //     ''');
  //   }
  //   // Add more upgrade conditions as needed for future changes
  // }
  @override
  void onUpgrade(int oldVersion, int newVersion) async {
    // Perform database schema changes when upgrading
    print('Perform database schema changes when upgrading');
    final db = await database;
    if (oldVersion < 2) {
      // Check if the column exists before trying to add it
      var isColumnExists = await _isColumnExists(db, 'user', 'isUserLogin');
      if (!isColumnExists) {
        await db.execute('''
          ALTER TABLE user
          ADD COLUMN isUserLogin TEXT
        ''');
      }
    }
    // Add more upgrade conditions as needed for future changes
  }

  Future<bool> _isColumnExists(Database db, String tableName, String columnName) async {
    var result = await db.rawQuery('PRAGMA table_info($tableName)');
    return result.any((column) => column['name'] == columnName);
  }

}


class UserModel {
  int? id;
  String token;
  String email;
  String name;
  String greeting;
  String password;
  String status;
  String caseId;
  String statusId;
  String toNotification;
  String fqNotification;
  String appoinmentNotification;

  UserModel({
    this.id,
    required this.token,
    required this.email,
    required this.name,
    required this.greeting,
    required this.password,
    required this.status,
    required this.caseId,
    required this.statusId,
    required this.toNotification,
    required this.fqNotification,
    required this.appoinmentNotification,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'token': token,
      'email': email,
      'name': name,
      'greeting': greeting,
      'password': password,
      'status': status,
      'case_id': caseId,
      'status_id': statusId,
      'toNotification': toNotification,
      'fqNotification': fqNotification,
      'appoinmentNotification': appoinmentNotification,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      token: map['token'],
      email: map['email'],
      name: map['name'],
      greeting: map['greeting'],
      password: map['password'],
      status: map['status'],
      caseId: map['case_id'],
      statusId: map['status_id'],
      toNotification: map['toNotification'],
      fqNotification: map['fqNotification'],
      appoinmentNotification: map['appoinmentNotification'],
    );
  }
}

