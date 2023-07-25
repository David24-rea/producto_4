import 'package:flutter/material.dart';

class bebidasl extends StatefulWidget {
  const bebidasl({super.key});

  @override
  State<bebidasl> createState() => _bebidaslState();
}

class _bebidaslState extends State<bebidasl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listado Bebidas"),
      ),
    );
  }
}
