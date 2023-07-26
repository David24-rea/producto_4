import 'package:flutter/material.dart';
import 'package:producto_4/aceites/editar.dart';
import 'package:producto_4/aceites/listado_aceites.dart';
import 'package:producto_4/aceites/registro.dart';
import 'package:producto_4/azucares/azucares/actualizara.dart';
import 'package:producto_4/azucares/azucares/azucara.dart';
import 'package:producto_4/azucares/azucares/resgistroa.dart';
import 'package:producto_4/bebidas/actualizar.dart';
import 'package:producto_4/bebidas/bebidasl.dart';
import 'package:producto_4/bebidas/registrob.dart';
import 'package:producto_4/fideos_arinas/editar.dart';
import 'package:producto_4/fideos_arinas/listado_fideos.dart';
import 'package:producto_4/fideos_arinas/registros.dart';
import 'package:producto_4/granos/addGranos.dart';
import 'package:producto_4/granos/listaGranos.dart';
import 'package:producto_4/granos/updateGranos.dart';
import 'package:producto_4/jugos/addJugos.dart';
import 'package:producto_4/jugos/listaJugos.dart';
import 'package:producto_4/jugos/updateJugos.dart';
import 'package:producto_4/licores/actualizarl.dart';
import 'package:producto_4/licores/licoresl.dart';
import 'package:producto_4/licores/registrol.dart';
import 'package:producto_4/logo.dart';
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
        '/fideoslistado': (context) => fideoslistado(),
        '/crearfideos': (context) => crearfideos(),
        '/logo': (context) => logo(),
        //azucares
        '/azucara': (context) => azucarl(),
        '/registroa': (context) => registroazucar(),
        '/actualizara': (context) => actualizara(),
        '/Editarfideos': (context) => Editarfideos(),
        // Aceites
        '/aceitelistado': (context) => aceitelistado(),
        '/crearaceite': (context) => crearaceite(),
        '/Editaraceites': (context) => Editaraceites(),
        '/listaGranos': (context) => listaGranosController(),
        '/addGranos': (context) => addGranosController(),
        '/updategranos': (context) => updateGranosController(),
        //jugos
        '/listaJugos': (context) => listaJugosController(),
        '/addJugos': (context) => addJugosController(),
        '/updateJugos': (context) => updateJugosController(),
      },
    );
  }
}
