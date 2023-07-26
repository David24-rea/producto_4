import 'package:flutter/material.dart';
import 'package:producto_4/controladores/Licoreria.dart';
import 'package:producto_4/entidades/licor.dart';

class registrolicor extends StatefulWidget {
  const registrolicor({super.key});

  @override
  State<registrolicor> createState() => _registrolicorState();
}

class _registrolicorState extends State<registrolicor> {
  final formInsert = GlobalKey<FormState>();
  String? tipol;
  String? nombrel;
  int? preciol;
  String? descripcionl;
  String? fechal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro Licor"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 10),
          child: Form(
            key: formInsert,
            child: Column(children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Tipo de Bebidas",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                value: tipol,
                onChanged: (newValue) {
                  setState(() {
                    tipol = newValue;
                  });
                },
                items: ['Vodka', 'wisky', 'vino', 'vino tinto']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "El tipo es requerido";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Nombre de la bebida"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onSaved: (value) {
                  nombrel = value;
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
                  labelText: "Precio",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onSaved: (value) {
                  preciol = int.parse(value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "La precio es requerida";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("descripción"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onSaved: (value) {
                  descripcionl = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "El descripcion es requerido";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Fecha de registro"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onSaved: (value) {
                  fechal = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "El Fecha es requerido";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
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
      print(tipol);
      print(nombrel);
      print(preciol);
      print(descripcionl);
      print(fechal);

      ///llamar al funcion insert desde el controlador
      var result = await Licoreria.insert(licor(
          tipol: tipol as String,
          nombrel: nombrel as String,
          preciol: preciol as int,
          descripcionl: descripcionl as String,
          fechal: fechal as String));
      print(result);

      Navigator.of(context).pushNamed('/licoresl');
    }
  }
}
