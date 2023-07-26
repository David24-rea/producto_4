import 'package:flutter/material.dart';
import 'package:producto_4/bebidas/actualizar.dart';
import 'package:producto_4/bebidas/bebidasl.dart';
import 'package:producto_4/bebidas/registrob.dart';
import 'package:producto_4/fideos_arinas/listado_fideos.dart';
import 'package:producto_4/fideos_arinas/registros.dart';
import 'package:producto_4/licores/actualizarl.dart';
import 'package:producto_4/licores/licoresl.dart';
import 'package:producto_4/licores/registrol.dart';
import 'package:producto_4/vistas/azucares.dart';
import 'package:producto_4/vistas/menu.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      routes: {
        '/': (context) => menu(),
        '/azucares': (context) => azucaresL(),
        '/bebidas': (context) => bebidasl(),
        '/actualizar': (context) => actualizarl(),
        '/registrob': (context) => registrob(),
        //ruta de licores
        '/actualizarl': (context) => licoractualizar(),
        '/licoresl': (context) => licoresl(),
        '/registrol': (context) => registrolicor(),
        // fideos
        '/fideoslistado':(context) => fideoslistado(),
        '/crearfideos':(context) => crearfideos(),
      },
    );
  }
}
