import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:producto_4/controladores/controladorazucar.dart';
import 'package:producto_4/entidades/azucares.dart';

class azucarl extends StatefulWidget {
  const azucarl({super.key});

  @override
  State<azucarl> createState() => _azucarlState();
}

class _azucarlState extends State<azucarl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listado de azucares y derribados"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          // SystemNavigator.pop();
          Navigator.of(context).pushNamed('/aceitelistado');
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
          child: FutureBuilder<List<azucar>>(
              future: azucarcontroler.select(),
              builder: (context, AsyncSnapshot<List<azucar>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text("Cargando......"),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  List<azucar>? fideos = snapshot.data;
                  return ListView(
                    children: [
                      for (var fideo in fideos!)
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('/actualizara', arguments: fideo);
                          },
                          child: Card(
                            child: Row(
                              children: [
                                // Expanded(child: Text(fideo.nombre_fi + '  ' +fideo.descripcion.toString()+' '+fideo.cantidad.toString())),
                                Expanded(
                                  child: Text(
                                    'NOMBRE: ${fideo.nombre}\nDESCRIPCIÓN: ${fideo.cantidad}\nCANTIDAD: ${fideo.descripcion}',
                                  ),
                                ),
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
                                                      await azucarcontroler
                                                          .delete(fideo);
                                                      Navigator.of(context)
                                                          .pushNamed(
                                                              '/azucara');
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
          Navigator.of(context).pushNamed('/registroa');
        },
        backgroundColor: Color.fromARGB(255, 37, 202, 166),
        child: Icon(Icons.add),
      ),
    );
  }
}
