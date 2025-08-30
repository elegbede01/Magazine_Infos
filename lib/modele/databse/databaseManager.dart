import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:projet1/modele/Redacteur.dart';

class DatabaseManager {
  // référence de la base
  static Database? _database;

  // Getter : initialise si la base n'existe pas
  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initialisation();
    return _database!;
  }

  // Initialisation de la base
  static Future<Database> _initialisation() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'redacteurs_database.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(''' 
          CREATE TABLE redacteurs(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nom TEXT NOT NULL,
            prenom TEXT NOT NULL,
            email TEXT NOT NULL
          )
        ''');
      },
    );
  }

  // Insertion
  static Future<void> insertRedacteur(Redacteur redacteur) async {
    final db = await database;
    await db.insert(
      'redacteurs',
      redacteur.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Modification
  static Future<void> updateRedacteur(Redacteur redacteur) async {
    final db = await database;
    await db.update(
      'redacteurs',
      redacteur.toMap(),
      where: 'id = ?',
      whereArgs: [redacteur.id],
    );
  }

  // Suppression
  static Future<void> deleteRedacteur(int id) async {
    final db = await database;
    await db.delete('redacteurs', where: 'id = ?', whereArgs: [id]);
  }

  // Lecture
  static Future<List<Redacteur>> getAllRedacteurs() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('redacteurs');
    return List.generate(maps.length, (i) {
      return Redacteur(
        id: maps[i]['id'],
        nom: maps[i]['nom'],
        prenom: maps[i]['prenom'],
        email: maps[i]['email'],
      );
    });
  }
}
