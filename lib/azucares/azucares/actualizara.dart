import 'package:flutter/material.dart';
import 'package:producto_4/entidades/azucares.dart';
import 'package:producto_4/controladores/controladorazucar.dart';

class actualizara extends StatefulWidget {
  const actualizara({super.key});

  @override
  State<actualizara> createState() => _UserViewState();
}

class _UserViewState extends State<actualizara> {
  final formInsert = GlobalKey<FormState>();

  String? nombre;
  String? descripcion;
  String? cantidad;

  @override
  Widget build(BuildContext context) {
    var user = ModalRoute.of(context)!.settings.arguments as azucar;
    return Scaffold(
      appBar: AppBar(
        title: Text("ACTUALIZAR  PRODUCTO"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 10),
          child: Form(
            key: formInsert,
            child: Column(children: [
              TextFormField(
                controller: TextEditingController(text: user.nombre),
                decoration: const InputDecoration(
                  label: Text("Codigo"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onSaved: (value) {
                  nombre = value;
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
                controller: TextEditingController(text: user.cantidad),
                decoration: const InputDecoration(
                  label: Text("Nombre"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onSaved: (value) {
                  cantidad = value;
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
                controller: TextEditingController(text: user.descripcion),
                decoration: const InputDecoration(
                  label: Text("Descripcion"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onSaved: (value) {
                  descripcion = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "El Apellido es requerido";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  save(user.id as int);
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
                        "Guardar",
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
    );
  }

  save(int id) async {
    if (formInsert.currentState!.validate()) {
      formInsert.currentState!.save();
      print(nombre);
      print(descripcion);
      print(cantidad);
      //
      var result = await azucarcontroler.update(azucar(
          id: id as int,
          nombre: nombre as String,
          descripcion: descripcion as String,
          cantidad: cantidad as String));
      print(result);
      Navigator.of(context).pushNamed('/azucara');
    }
  }
}
