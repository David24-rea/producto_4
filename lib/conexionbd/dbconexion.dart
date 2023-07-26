import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbConnection {
  //static const v = 1;
  static const dbName = 'productos.db';
/*funcion para realizar la conexion y*/
  static Future<Database> getDb() async {
    return openDatabase(join(await getDatabasesPath(), dbName),
        version: 1,
        onCreate: ((db, version) async => {
              /* para crear tabla*/
              await db.execute(
                  'CREATE TABLE bebidas(id INTEGER PRIMARY KEY,tipo TEXT, nombre TEXT,precio INTEGER,descripcion TEXT, fecha TEXTO)'),
              await db.execute(
                  'CREATE TABLE licores(id INTEGER PRIMARY KEY,tipo_li TEXT, nombre_li TEXT,precio_li INTEGER,descripcion_li TEXT, fecha_li TEXT)'),
              await db.execute(
                  'CREATE TABLE fideos (id INTEGER PRIMARY KEY,codigo_fi TEXT,nombre_fi TEXT, descripcion TEXT, cantidad TEXT, fecha TEXT)'),
            }));
  }

  //funcion para insertar
  static Future<int> insert(String table, dynamic data) async {
    final db = await DbConnection.getDb();
    return db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> update(String table, dynamic data, int id) async {
    final db = await DbConnection.getDb();
    //return db.update(table, data, where: 'id =? and code=?', whereArgs: [id,code]);
    return db.update(table, data,
        where: 'id =?',
        whereArgs: [id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> delete(String table, int id) async {
    final db = await DbConnection.getDb();
    return db.delete(table, where: 'id=?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getAll(String table) async {
    final db = await DbConnection.getDb();
    return await db.query(table);
  }

  static Future<List<Map<String, dynamic>>> select(
      String table, String where, List<dynamic> whereArgs) async {
    final db = await DbConnection.getDb();
    return await db.query(table, where: where, whereArgs: whereArgs);
  }

  static Future<List<Map<String, dynamic>>> select1(
      String table, String where, List<dynamic> whereArgs) async {
    final db = await DbConnection.getDb();
    return await db.query(table, where: where, whereArgs: whereArgs);
  }
}
