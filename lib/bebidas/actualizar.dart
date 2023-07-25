import 'package:flutter/material.dart';

class actualizarl extends StatefulWidget {
  const actualizarl({super.key});

  @override
  State<actualizarl> createState() => _actualizarlState();
}

class _actualizarlState extends State<actualizarl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Actualizar Bebidas"),
      ),
    );
  }
}
