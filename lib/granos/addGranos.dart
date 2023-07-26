import 'package:flutter/material.dart';
import 'package:producto_4/controladores/controladorGranos.dart';
import 'package:producto_4/entidades/granos.dart';

class addGranosController extends StatefulWidget {
  const addGranosController({super.key});

  @override
  State<addGranosController> createState() => _addGranosControllerState();
}

class _addGranosControllerState extends State<addGranosController> {
  final formInsert = GlobalKey<FormState>();
  String? codigo_gra;
  String? nombre_gra;
  String? descripcion_gra;
  String? cantidad_gra;
  String? fecha_gra;
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
                    codigo_gra = value;
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
                    nombre_gra = value;
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
                    descripcion_gra = value;
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
                    cantidad_gra = value;
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
                    fecha_gra = value;
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
      print(codigo_gra);
      print(nombre_gra);
      print(descripcion_gra);
      print(cantidad_gra);
      print(fecha_gra);

      //
      var result = await ControladorGranos.insert(Granos(
          codigo_gra: codigo_gra as String,
          nombre_gra: nombre_gra as String,
          descripcion_gra: descripcion_gra as String,
          cantidad_gra: cantidad_gra as String,
          fecha_gra: fecha_gra as String));
      print(result);
      Navigator.of(context).pushNamed('/listaGranos');
    }
  }
}
