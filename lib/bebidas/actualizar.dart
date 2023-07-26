import 'package:flutter/material.dart';
import 'package:producto_4/entidades/bebidas.dart';
import 'package:producto_4/controladores/controladorbebidas.dart';

class actualizarl extends StatefulWidget {
  const actualizarl({super.key});

  @override
  State<actualizarl> createState() => _actualizarlState();
}

class _actualizarlState extends State<actualizarl> {
  final formInsert = GlobalKey<FormState>();
  String? tipo;
  String? nombre;
  int? precio;
  String? descripcion;
  String? fecha;
  @override
  Widget build(BuildContext context) {
    bebidas date = ModalRoute.of(context)!.settings.arguments as bebidas;
    return Scaffold(
      appBar: AppBar(
        title: Text("Actualizar Bebidas"),
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
                value: date.tipo,
                onChanged: (newValue) {
                  setState(() {
                    tipo = newValue;
                  });
                },
                items: ['Gaseosas', 'Energisantes', 'Sin gas', 'lacteo']
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
                controller: TextEditingController(text: date.nombre),
                decoration: const InputDecoration(
                  label: Text("Nombre de la bebida"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onSaved: (value) {
                  nombre = value;
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
                controller: TextEditingController(text: date.precio.toString()),
                decoration: const InputDecoration(
                  labelText: "Precio",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onSaved: (value) {
                  precio = int.parse(value!);
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
                controller: TextEditingController(text: date.descripcion),
                decoration: const InputDecoration(
                  label: Text("descripción"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onSaved: (value) {
                  descripcion = value;
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
                controller: TextEditingController(text: date.fecha),
                decoration: const InputDecoration(
                  label: Text("Fecha de registro"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onSaved: (value) {
                  fecha = value;
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
                  save(date.id as int);
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

  save(int id) async {
    if (formInsert.currentState!.validate()) {
      formInsert.currentState!.save();
      print(tipo);
      print(nombre);
      print(precio);
      print(descripcion);
      print(fecha);

      ///llamar al funcion insert desde el controlador
      var result = await controladorbebidas.update(bebidas(
          id: id as int,
          tipo: tipo as String,
          nombre: nombre as String,
          precio: precio as int,
          descripcion: descripcion as String,
          fecha: fecha as String));
      print(result);

      Navigator.of(context).pushNamed('/bebidas');
    }
  }
}
