import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'user.dart';
import 'userList.dart';
import 'user.dart' as UserClass;


class UserDataBase {
  UserDataBase._();
  static final UserDataBase instance = UserDataBase._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'user_database.db');

    return await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE user(id INTEGER PRIMARY KEY, name TEXT, email TEXT, city TEXT, userImageUrl TEXT, pw TEXT, profil INTEGER)",
        );
      },
      version: 1,
      onUpgrade: (db, oldVersion, newVersion) {
        // if (oldVersion < 0) {
        //   Add any necessary database schema upgrades here
        //   db.execute("ALTER TABLE user ADD COLUMN userImageUrl TEXT");
        // }
      },
    );
}

Future<void> insertUser(User user) async {
  final db = await UserDataBase.instance.database;
  await db.insert(
    'user',
    user.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> updateUser(User user) async {
  final db = await UserDataBase.instance.database;
  await db.update(
    'user',
    user.toMap(),
    where: 'id = ?',
    whereArgs: [user.id],
  );
}

Future<void> deleteUser(int id) async {
  final db = await UserDataBase.instance.database;
  await db.delete(
    'user',
    where: 'id = ?',
    whereArgs: [id],
  );
}

  Future<List<User>> users() async {
    final db = await UserDataBase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('user');
    return List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });
  }


final List<User> defaultUsers = [
  User(
    1,
    "StanM",
    "stanm@mail.fr",
    "Toulouse (31000)",
    "https://img-3.journaldesfemmes.fr/Ccpfj_bvxxfCmdXLIHKUVdtg-sA=/1240x/smart/7d4883ded4454670adec8fb742f12eb8/ccmcms-jdf/35466991.jpg",
    "123",
    false,
  ),
  User(
    2,
    "JulineD",
    "julined@mail.fr",
    "Montpellier (34000)",
    "https://edgard-lelegant.com/wp-content/uploads/2021/07/Les-20-plus-belles-femmes-du-monde-Emma-Watson.jpeg",
    "123",
    false,
  ),
  User(
    3,
    "FlorianM",
    "florianm@mail.fr",
    "Aussonne (31840)",
    "https://static1.puretrend.com/articles/9/99/62/9/@/1124264-chris-hemsworth-l-homme-le-plus-sexy-amp_dynamic_height_big-2.jpg",
    "123",
    false,
  ),
];
}
