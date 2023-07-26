
import 'package:producto_4/entidades/fideos.dart';

import '../conexionbd/dbconexion.dart';


class Controladorfideos {
  // metodos para el crud
static Future<int> insert(Fideo data) async{
  return await DbConnection.insert("fideos", data.toMap());
}
static Future<int> update(Fideo data) async{
  return await DbConnection.update("fideos", data.toMap(),data.id as int);
}
static Future<int> delete(Fideo data) async{
  return await DbConnection.delete("fideos", data.id as int);
}

static Future<List<Fideo>> select() async{
  List<Map<String, dynamic>> result = await DbConnection.getAll("fideos");
if (  result.isEmpty) {
  return List.empty();
  }
  return List.generate(result.length, (index) => Fideo.fromMap(result[index]));
}
 
static Future<List<Fideo>> detail(Fideo data) async{
  List<Map<String, dynamic>> result = await DbConnection.select("fideos", "id=?",[data.id]);
if ( result.isEmpty) {
  return List.empty();
  }
  return List.generate(result.length, (index) => Fideo.fromMap(result[index]));
}

}