import 'package:flutter/material.dart';
import 'package:producto_4/controladores/controladorazucar.dart';
import 'package:producto_4/entidades/azucares.dart';

class registroazucar extends StatefulWidget {
  const registroazucar({super.key});

  @override
  State<registroazucar> createState() => _registroazucarState();
}

class _registroazucarState extends State<registroazucar> {
  final formInsert = GlobalKey<FormState>();
  String? nombre;
  String? cantidad;
  String? descripcion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
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
                decoration: const InputDecoration(
                  label: Text("Cantidad de leche "),
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
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Descripción"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onSaved: (value) {
                  descripcion = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "El descripción requerida";
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
            ]),
          ),
        ),
      ),
    );
  }

  save() async {
    if (formInsert.currentState!.validate()) {
      formInsert.currentState!.save();
      print(nombre);
      print(cantidad);
      print(descripcion);

      ///llamar al funcion insert desde el controlador
      var result = await azucarcontroler.insert(azucar(
          nombre: nombre as String,
          cantidad: cantidad as String,
          descripcion: descripcion as String));
      print(result);
      Navigator.of(context).pushNamed('/azucara');
    }
  }
}
