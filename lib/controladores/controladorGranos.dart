import 'package:producto_4/conexionbd/dbconexion.dart';

import '../entidades/granos.dart';

class ControladorGranos {
  // metodos para el crud
  static Future<int> insert(Granos data) async {
    return await DbConnection.insert("Granos", data.toMap());
  }

  static Future<int> update(Granos data) async {
    return await DbConnection.update("Granos", data.toMap(), data.id as int);
  }

  static Future<int> delete(Granos data) async {
    return await DbConnection.delete("Granos", data.id as int);
  }

  static Future<List<Granos>> select() async {
    List<Map<String, dynamic>> result = await DbConnection.getAll("Granos");
    if (result.isEmpty) {
      return List.empty();
    }
    return List.generate(
        result.length, (index) => Granos.fromMap(result[index]));
  }

  static Future<List<Granos>> detail(Granos data) async {
    List<Map<String, dynamic>> result =
        await DbConnection.select("Granos", "id=?", [data.id]);
    if (result.isEmpty) {
      return List.empty();
    }
    return List.generate(
        result.length, (index) => Granos.fromMap(result[index]));
  }
}
