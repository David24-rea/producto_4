import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:producto_4/controladores/controladorGranos.dart';
import 'package:producto_4/entidades/granos.dart';

class listaGranosController extends StatefulWidget {
  const listaGranosController({Key? key});

  @override
  State<listaGranosController> createState() => _listaGranosControllerState();
}

class _listaGranosControllerState extends State<listaGranosController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestionar granos'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          // SystemNavigator.pop();
          Navigator.of(context).pushNamed('/');
          return await showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: Text("Cerrar App"),
                    content: Text("seguro de cerrar la aplicacion "),
                    actions: [
                      TextButton(
                          onPressed: () async {
                            //Navigator.of(context).pushNamed('/');
                            SystemNavigator.pop();
                          },
                          child: Text("Aceptar")),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context, "cancel");
                          },
                          child: Text("Cancelar")),
                    ],
                  ));
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<List<Granos>>(
              future: ControladorGranos.select(),
              builder: (context, AsyncSnapshot<List<Granos>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text("Cargando......"),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  List<Granos>? granos = snapshot.data;
                  return ListView(
                    children: [
                      for (var Granos in granos!)
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('/updateGranos', arguments: Granos);
                          },
                          child: Card(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(Granos.nombre_gra +
                                        '  ' +
                                        Granos.descripcion_gra.toString())),
                                IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () => showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                              title: Text("Eliminar Registro"),
                                              content:
                                                  Text("seguro de eliminar"),
                                              actions: [
                                                TextButton(
                                                    onPressed: () async {
                                                      await ControladorGranos
                                                          .delete(Granos);
                                                      Navigator.of(context)
                                                          .pushNamed('/');
                                                    },
                                                    child: Text("Aceptar")),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          context, "cancel");
                                                    },
                                                    child: Text("Cancelar")),
                                              ],
                                            )))
                              ],
                            ),
                          ),
                        ),
                    ],
                  );
                }
                return Center(
                  child: Text("No existe datos"),
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/addGranos');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
