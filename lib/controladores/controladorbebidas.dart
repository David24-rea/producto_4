import 'package:producto_4/conexionbd/dbconexion.dart';
import 'package:producto_4/entidades/bebidas.dart';

class controladorbebidas {
  //metodos para el crud
  //metodo de insertar
  static Future<int> insert(bebidas data) async {
    return await DbConnection.insert("bebidas", data.toMap());
  }

  //metodo para actualizar
  static Future<int> update(bebidas data) async {
    return await DbConnection.update(
      "bebidas",
      data.toMap(),
      data.id as int,
    );
  }

  static Future<int> delete(bebidas data) async {
    return await DbConnection.delete("bebidas", data.id as int);
  }

  static Future<List<bebidas>> select() async {
    List<Map<String, dynamic>> result = await DbConnection.getAll("bebidas");
    if (result.isEmpty) {
      return List.empty();
    }
    return List.generate(
        result.length, (index) => bebidas.FromMap(result[index]));
  }
}
