import 'package:producto_4/conexionbd/dbconexion.dart';
import 'package:producto_4/entidades/jugos.dart';

class ControladorJugos {
  // metodos para el crud
  static Future<int> insert(Jugos data) async {
    return await DbConnection.insert("Jugos", data.toMap());
  }

  static Future<int> update(Jugos data) async {
    return await DbConnection.update("Jugos", data.toMap(), data.id as int);
  }

  static Future<int> delete(Jugos data) async {
    return await DbConnection.delete("Jugos", data.id as int);
  }

  static Future<List<Jugos>> select() async {
    List<Map<String, dynamic>> result = await DbConnection.getAll("Jugos");
    if (result.isEmpty) {
      return List.empty();
    }
    return List.generate(
        result.length, (index) => Jugos.fromMap(result[index]));
  }

  static Future<List<Jugos>> detail(Jugos data) async {
    List<Map<String, dynamic>> result =
        await DbConnection.select("Jugos", "id=?", [data.id]);
    if (result.isEmpty) {
      return List.empty();
    }
    return List.generate(
        result.length, (index) => Jugos.fromMap(result[index]));
  }
}
