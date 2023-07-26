import 'package:producto_4/conexionbd/dbconexion.dart';
import 'package:producto_4/entidades/licor.dart';

class Licoreria {
  //metodos para el crud
  //metodo de insertar
  static Future<int> insert(licor data) async {
    return await DbConnection.insert("licores", data.toMap());
  }

  //metodo para actualizar
  static Future<int> update(licor data) async {
    return await DbConnection.update(
      "licores",
      data.toMap(),
      data.id as int,
    );
  }

  static Future<int> delete(licor data) async {
    return await DbConnection.delete("licores", data.id as int);
  }

  static Future<List<licor>> select() async {
    List<Map<String, dynamic>> result = await DbConnection.getAll("licores");
    if (result.isEmpty) {
      return List.empty();
    }
    return List.generate(
        result.length, (index) => licor.FromMap(result[index]));
  }
}
