import 'package:desafio_flutter/movie.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBConfig {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'db_movies.db'),
      onCreate: (db, version) {
        return db.execute("CREATE TABLE favoritos (id INTEGER PRIMARY KEY);");
      },
      version: 1,
    );
  }

  // Retornar todos os filmes do Banco
  Future<List<int>> getAllMovies() async {
    final db = await DBConfig.database();
    final List<Map<String, dynamic>> maps = await db.query('favoritos');

    return List.generate(maps.length, (index) {
      return maps[index]['id'];
    });
  }

  // Adiciono o filme na lista de IDs do banco
  Future<void> insertFavorite({Movie filmeID}) async {
    print('Inserindo item de id ${filmeID.id}');

    final db = await DBConfig.database();
    await db.insert(
      'favoritos',
      filmeID.toMap(),
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteMovie(int id) async {
    print('Deletando item de id $id');
    final db = await DBConfig.database();
    await db.delete(
      'favoritos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
