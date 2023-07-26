import 'package:flutter/material.dart';
import 'package:producto_4/controladores/controladorJugos.dart';
import 'package:producto_4/entidades/jugos.dart';

class addJugosController extends StatefulWidget {
  const addJugosController({super.key});

  @override
  State<addJugosController> createState() => _addJugosControllerState();
}

class _addJugosControllerState extends State<addJugosController> {
  final formInsert = GlobalKey<FormState>();
  String? codigo_jug;
  String? nombre_jug;
  String? descripcion_jug;
  String? cantidad_jug;
  String? fecha_jug;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar granos'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 10),
            child: Form(
              key: formInsert,
              child: Column(children: [
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Codigo"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  onSaved: (value) {
                    codigo_jug = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "El Código es requerido";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Nombre "),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  onSaved: (value) {
                    nombre_jug = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "El Nombre es requerido";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Descripcion"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  onSaved: (value) {
                    descripcion_jug = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "La desripcion es requerido";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Cantidad"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  onSaved: (value) {
                    cantidad_jug = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "La cantidad es requerido";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("dd-mm-yyyy"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  onSaved: (value) {
                    fecha_jug = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "La fecha  es requerido";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    save();
                  },
                  style: ElevatedButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontFamily:
                          Theme.of(context).textTheme.bodyLarge?.fontFamily,
                    ),
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Stack(
                    fit: StackFit.passthrough,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Aceptar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/');
                  },
                  style: ElevatedButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontFamily:
                          Theme.of(context).textTheme.bodyLarge?.fontFamily,
                    ),
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Stack(
                    fit: StackFit.passthrough,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Regresar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  save() async {
    if (formInsert.currentState!.validate()) {
      formInsert.currentState!.save();
      print(codigo_jug);
      print(nombre_jug);
      print(descripcion_jug);
      print(cantidad_jug);
      print(fecha_jug);

      //
      var result = await ControladorJugos.insert(Jugos(
          codigo_jug: codigo_jug as String,
          nombre_jug: nombre_jug as String,
          descripcion_jug: descripcion_jug as String,
          cantidad_jug: cantidad_jug as String,
          fecha_jug: fecha_jug as String));
      print(result);
      Navigator.of(context).pushNamed('/listaGranos');
    }
  }
}
