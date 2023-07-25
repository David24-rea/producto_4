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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/');
        },
        backgroundColor: Color.fromARGB(255, 37, 202, 166),
        child: Icon(Icons.add),
      ),
    );
  }
}
