import 'package:flutter/material.dart';
import 'package:producto_4/entidades/aceitres.dart';
import 'package:producto_4/entidades/fideos.dart';

import '../controladores/controladorfideos.dart';

class Editarfideos extends StatefulWidget {
  const Editarfideos({super.key});

  @override
  State<Editarfideos> createState() => _UserViewState();
}

class _UserViewState extends State<Editarfideos> {
  final formInsert = GlobalKey<FormState>();

  String? codigo_fi;
  String? nombre_fi;
  String? descripcion;
  String? cantidad;
  String? fecha;

  @override
  Widget build(BuildContext context) {
    var user = ModalRoute.of(context)!.settings.arguments as Aceite;
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
                controller: TextEditingController(text: user.codigo_fi),
                decoration: const InputDecoration(
                  label: Text("Codigo"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onSaved: (value) {
                  codigo_fi = value;
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
                controller: TextEditingController(text: user.nombre_fi),
                decoration: const InputDecoration(
                  label: Text("Nombre"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onSaved: (value) {
                  nombre_fi = value;
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
              TextFormField(
                controller: TextEditingController(text: user.cantidad),
                decoration: const InputDecoration(
                  label: Text("cantidad"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onSaved: (value) {
                  cantidad = value;
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
              TextFormField(
                controller: TextEditingController(text: user.fecha),
                decoration: const InputDecoration(
                  label: Text("fecha"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onSaved: (value) {
                  fecha = value;
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
      print(codigo_fi);
      print(nombre_fi);
      print(descripcion);
      print(cantidad);
      print(fecha);
      //
      var result = await Controladorfideos.update(Fideo(
          id: id as int,
          codigo_fi: codigo_fi as String,
          nombre_fi: nombre_fi as String,
          descripcion: descripcion as String,
          cantidad: cantidad as String,
          fecha: fecha as String));
      print(result);
      Navigator.of(context).pushNamed('/fideoslistado');
    }
  }
}
