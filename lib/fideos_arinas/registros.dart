
import 'package:flutter/material.dart';
import 'package:producto_4/controladores/controladorfideos.dart';
import 'package:producto_4/entidades/fideos.dart';



class crearfideos extends StatefulWidget {
  const crearfideos({super.key});

  @override
  State<crearfideos> createState() => _UserViewState();
}

class _UserViewState extends State<crearfideos> {
  final formInsert = GlobalKey<FormState>();
 String? codigo_fi;
 String? nombre_fi;
 String? descripcion;
 String? cantidad ;
 String?fecha ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuario"),
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
                decoration: const InputDecoration(
                  label: Text("Nombre "),
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
                  cantidad = value;
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
                  fecha = value;
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

      
    );
  }

  save() async {
    if (formInsert.currentState!.validate()) {
      formInsert.currentState!.save();
      print(codigo_fi);
      print(nombre_fi);
      print(descripcion);
      print(cantidad);
      print(fecha);
      
      // 
      var result =await Controladorfideos.insert(Fideo(codigo_fi: codigo_fi as String , nombre_fi: nombre_fi as String, descripcion: descripcion as String,  cantidad: cantidad as String, fecha: fecha as String));
      print(result);
      Navigator.of(context).pushNamed('/fideoslistado');
      
    }
  }
}