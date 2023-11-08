import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'annonce.dart';

class AnnonceDataBase {
  AnnonceDataBase._();
  static final AnnonceDataBase instance = AnnonceDataBase._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'annonce_database.db');

    return await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE annonce(id INTEGER PRIMARY KEY, title TEXT, plantType TEXT, user TEXT, userImageUrl TEXT, userAddress TEXT, imageUrl TEXT, description TEXT, riskLvl TEXT, maintainLvl TEXT, wateringLvl TEXT, isFavorite INTEGER, favoriteCount INTEGER)",
        );
      },
      version: 5,
      onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion < 5) {
          // Add any necessary database schema upgrades here
          db.execute(
            "ALTER TABLE annonce ADD COLUMN userImageUrl TEXT",
          );
        }
      },
    );
  }

  Future<void> insertAnnonce(Annonce annonce) async {
    final db = await AnnonceDataBase.instance.database;
    await db.insert(
      'annonce',
      annonce.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateAnnonce(Annonce annonce) async {
    final db = await AnnonceDataBase.instance.database;
    await db.update(
      'annonce',
      annonce.toMap(),
      where: 'id = ?',
      whereArgs: [annonce.id],
    );
  }

  Future<void> deleteAnnonce(int id) async {
    final db = await AnnonceDataBase.instance.database;
    await db.delete(
      'annonce',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Annonce>> annonces() async {
    final db = await AnnonceDataBase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('annonce');
    return List.generate(maps.length, (i) {
      return Annonce.fromMap(maps[i]);
    });
  }

  final List<Annonce> defaultAnnonces = [
    Annonce(
      1,
      "Bouture Monstera",
      "Monstera Adansonii",
      "StanM",
      "https://www.benouaiche.com/wp-content/uploads/2018/12/homme-medecine-chirurgie-esthetique-dr-benouaiche-paris.jpg",
      "Toulouse",
      "https://lagreentouch.fr/cdn/shop/files/acheter-plante-monstera-adansonii-893847.jpg?v=1693983892&width=1214",
      "Bonjour, j'échange des boutures de Monstera. J'en ai une dizaine à différents stades de maturité. Contactez moi en mp pour me proposer vos boutures à échanger :-)",
      "hard",
      "moyen",
      "facile",
      false,
      12,
    ),
    Annonce(
      2,
      "Aloé pas cher",
      "Aloe vera",
      "FlorianM",
      "https://img.freepik.com/photos-gratuite/portrait-homme-blanc-isole_53876-40306.jpg?w=2000",
      "Aussonne",
      "https://www.florimon.com/cdn/shop/products/F16019.jpg?v=1681471900",
      "bonjour",
      "hard",
      "moyen",
      "facile",
      true,
      12,
    ),
    Annonce(
      3,
      "Pilea",
      "Pila",
      "JulineD",
      "https://fac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2FFAC.2Fvar.2Ffemmeactuelle.2Fstorage.2Fimages.2Famour.2Fcoaching-amoureux.2Fcest-quoi-belle-femme-temoignages-43206.2F14682626-1-fre-FR.2Fc-est-quoi-une-belle-femme-temoignages.2Ejpg/1200x1200/quality/80/crop-from/center/c-est-quoi-une-belle-femme-temoignages.jpeg",
      "Toulouse",
      "https://lagreentouch.fr/cdn/shop/products/acheter-plante-grand-pilea-peperomioides-229903.jpg?crop=center&height=1200&v=1695942221&width=1200",
      "bonjour",
      "hard",
      "moyen",
      "facile",
      false,
      3,
    ),
  ];
}
