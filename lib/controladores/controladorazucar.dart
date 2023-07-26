import 'package:producto_4/conexionbd/dbconexion.dart';
import 'package:producto_4/entidades/azucares.dart';

class azucarcontroler {
  static Future<int> insert(azucar data) async {
    return await DbConnection.insert("azucar", data.toMap());
  }

  static Future<int> update(azucar data) async {
    return await DbConnection.update("azucar", data.toMap(), data.id as int);
  }

  static Future<int> delete(azucar data) async {
    return await DbConnection.delete("azucar", data.id as int);
  }

  static Future<List<azucar>> select() async {
    List<Map<String, dynamic>> result = await DbConnection.getAll("azucar");
    if (result.isEmpty) {
      return List.empty();
    }
    return List.generate(
        result.length, (index) => azucar.FromMap(result[index]));
  }
}
