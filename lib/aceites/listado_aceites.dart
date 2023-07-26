import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:producto_4/entidades/aceitres.dart';
import '../controladores/controladoraceites.dart';

class aceitelistado extends StatefulWidget {
  const aceitelistado({Key? key});

  @override
  State<aceitelistado> createState() => _formularioState();
}

class _formularioState extends State<aceitelistado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LISTADO DE ACEITES', textAlign: TextAlign.center),
        centerTitle: true,
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
          child: FutureBuilder<List<Aceite>>(
              future: Controladoraceites.select(),
              builder: (context, AsyncSnapshot<List<Aceite>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text("Cargando......"),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  List<Aceite>? fideos = snapshot.data;
                  return ListView(
                    children: [
                      for (var fideo in fideos!)
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('/Editaraceites', arguments: fideo);
                          },
                          child: Card(
                            child: Row(
                              children: [
                                // Expanded(child: Text(fideo.nombre_fi + '  ' +fideo.descripcion.toString()+' '+fideo.cantidad.toString())),
                                Expanded(
                                  child: Text(
                                    'NOMBRE: ${fideo.nombre_fi}\nDESCRIPCIÓN: ${fideo.descripcion}\nCANTIDAD: ${fideo.cantidad}\nFECHA: ${fideo.fecha}',
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
                                                      await Controladoraceites
                                                          .delete(fideo);
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
          Navigator.of(context).pushNamed('/crearaceite');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
