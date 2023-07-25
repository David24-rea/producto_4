import 'package:flutter/material.dart';
import 'package:producto_4/vistas/azucares.dart';
import 'package:producto_4/vistas/menu.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      routes: {'/': (context) => menu(), '/azucares': (context) => azucaresL()},
    );
  }
}
