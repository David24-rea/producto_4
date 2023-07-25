import 'package:flutter/material.dart';

class registrob extends StatefulWidget {
  const registrob({super.key});

  @override
  State<registrob> createState() => _registrobState();
}

class _registrobState extends State<registrob> {
  final formInsert = GlobalKey<FormState>();
  String? code;
  String? name;
  String? des;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro Bebidas"),
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
                  code = value;
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
                  label: Text("Nombre codigo"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onSaved: (value) {
                  name = value;
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
                  des = value;
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
      print(code);
      print(name);
      print(des);

      ///llamar al funcion insert desde el controlador
      /*var result = await catcontroler.insert(categoria(
          code: code as String, name: name as String, des: des as String));
      print(result);*/

      Navigator.of(context).pushNamed('');
    }
  }
}
