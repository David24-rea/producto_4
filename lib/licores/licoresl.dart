import 'package:flutter/material.dart';
import 'package:producto_4/controladores/Licoreria.dart';
import 'package:producto_4/entidades/licor.dart';

class licoresl extends StatefulWidget {
  const licoresl({super.key});

  @override
  State<licoresl> createState() => _licoreslState();
}

class _licoreslState extends State<licoresl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listado Licores"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<licor>>(
          future: Licoreria.select(),
          builder: (context, AsyncSnapshot<List<licor>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("cargando"),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              List<licor>? users = snapshot.data;
              return ListView(
                children: [
                  for (var item in users!)
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              //enviar datos para editar a nuestra interfas actualizar
                              .pushNamed('/actualizarl', arguments: item);
                        },
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(
                                  '${item.tipol}  ${item.nombrel}    ${item.preciol}  ${item.fechal}',
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
                                            await Licoreria.delete(item);
                                            Navigator.of(context)
                                                .pushNamed('/licoresl');
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
          Navigator.of(context).pushNamed('/registrol');
        },
        backgroundColor: Color.fromARGB(255, 44, 87, 228),
        child: Icon(Icons.add),
      ),
    );
  }
}
