import 'package:flutter/material.dart';

class azucaresL extends StatefulWidget {
  const azucaresL({super.key});

  @override
  State<azucaresL> createState() => _azucaresLState();
}

class _azucaresLState extends State<azucaresL> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LIstado de productos azucarados"),
      ),
    );
  }
}
