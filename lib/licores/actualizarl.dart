import 'package:flutter/material.dart';

class licoractualizar extends StatefulWidget {
  const licoractualizar({super.key});

  @override
  State<licoractualizar> createState() => _licoractualizarState();
}

class _licoractualizarState extends State<licoractualizar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Actualizar Licores"),
      ),
    );
  }
}
