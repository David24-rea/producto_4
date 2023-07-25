import 'package:flutter/material.dart';

class registrob extends StatefulWidget {
  const registrob({super.key});

  @override
  State<registrob> createState() => _registrobState();
}

class _registrobState extends State<registrob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro Bebidas"),
      ),
    );
  }
}
