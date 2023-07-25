import 'package:flutter/material.dart';

class licoresl extends StatefulWidget {
  const licoresl({super.key});

  @override
  State<licoresl> createState() => _licoreslState();
}

class _licoreslState extends State<licoresl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listado Licores"),
      ),
    );
  }
}
