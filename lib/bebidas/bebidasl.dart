import 'package:flutter/material.dart';
import 'package:producto_4/entidades/bebidas.dart';
import 'package:producto_4/controladores/controladorbebidas.dart';

class bebidasl extends StatefulWidget {
  const bebidasl({super.key});

  @override
  State<bebidasl> createState() => _bebidaslState();
}

class _bebidaslState extends State<bebidasl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listado Bebidas"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<bebidas>>(
          future: controladorbebidas.select(),
          builder: (context, AsyncSnapshot<List<bebidas>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("cargando"),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              List<bebidas>? users = snapshot.data;
              return ListView(
                children: [
                  for (var item in users!)
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              //enviar datos para editar a nuestra interfas actualizar
                              .pushNamed('/actualizar', arguments: item);
                        },
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(
                                  '${item.tipo}      ${item.nombre}              ${item.precio}         ${item.fecha}',
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  color: Colors.red,
                                  onPressed: () => showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: Text("Eliminar registro"),
                                      content: Text(
                                          "¿Está seguro de que desea eliminar el registro seleccionado?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () async {
                                            await controladorbebidas
                                                .delete(item);
                                            Navigator.of(context)
                                                .pushNamed('/actualizar');
                                          },
                                          child: Text("Aceptar"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Cancelar"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ))
                ],
              );
            }
            return Center(
              child: Text("no existe datos"),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/registrob');
        },
        backgroundColor: Color.fromARGB(255, 47, 144, 248),
        child: Icon(Icons.add),
      ),
    );
  }
}
