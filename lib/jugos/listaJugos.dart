import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:producto_4/entidades/jugos.dart';

import '../../controladores/controladorJugos.dart';

class listaJugosController extends StatefulWidget {
  const listaJugosController({super.key});

  @override
  State<listaJugosController> createState() => _listaJugosControllerState();
}

class _listaJugosControllerState extends State<listaJugosController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestionar Jugos'),
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
          child: FutureBuilder<List<Jugos>>(
              future: ControladorJugos.select(),
              builder: (context, AsyncSnapshot<List<Jugos>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text("Cargando......"),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  List<Jugos>? jugos = snapshot.data;
                  return ListView(
                    children: [
                      for (var Jugos in jugos!)
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('/updateJugos', arguments: Jugos);
                          },
                          child: Card(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(Jugos.nombre_jug +
                                        '  ' +
                                        Jugos.descripcion_jug.toString())),
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
                                                      await ControladorJugos
                                                          .delete(Jugos);
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
          Navigator.of(context).pushNamed('/addJugos');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
