


import '../conexionbd/dbconexion.dart';
import '../entidades/aceitres.dart';

class Controladoraceites {
  // metodos para el crud
static Future<int> insert(Aceite data) async{
  return await DbConnection.insert("aceites", data.toMap());
}
static Future<int> update(Aceite data) async{
  return await DbConnection.update("aceites", data.toMap(),data.id as int);
}
static Future<int> delete(Aceite data) async{
  return await DbConnection.delete("aceites", data.id as int);
}

static Future<List<Aceite>> select() async{
  List<Map<String, dynamic>> result = await DbConnection.getAll("aceites");
if (  result.isEmpty) {
  return List.empty();
  }
  return List.generate(result.length, (index) => Aceite.fromMap(result[index]));
}
 
static Future<List<Aceite>> detail(Aceite data) async{
  List<Map<String, dynamic>> result = await DbConnection.select("aceites", "id=?",[data.id]);
if ( result.isEmpty) {
  return List.empty();
  }
  return List.generate(result.length, (index) => Aceite.fromMap(result[index]));
}

}