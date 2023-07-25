import 'package:flutter/material.dart';

class registrolicor extends StatefulWidget {
  const registrolicor({super.key});

  @override
  State<registrolicor> createState() => _registrolicorState();
}

class _registrolicorState extends State<registrolicor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro Bebidas"),
      ),
    );
  }
}
