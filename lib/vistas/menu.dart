import 'package:flutter/material.dart';

class menu extends StatefulWidget {
  const menu({super.key});

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  String _selectedMenuItem = 'Personal';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menú Productos"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Azucares y Derivados'),
              tileColor: _selectedMenuItem == 'Personal'
                  ? const Color.fromARGB(255, 33, 243, 37)
                  : null,
              onTap: () {
                setState(() {
                  _selectedMenuItem = 'Personal';
                });
                Navigator.of(context).pushNamed('');
                // Cierra el drawer
              },
            ),
            ListTile(
              title: const Text('Bebidas'),
              tileColor: _selectedMenuItem == 'Horario' ? Colors.blue : null,
              onTap: () {
                setState(() {
                  _selectedMenuItem = 'Horario';
                });
                Navigator.of(context).pushNamed('/bebidas'); // Cierra el drawer
              },
            ),
            ListTile(
              title: const Text('Licores'),
              tileColor: _selectedMenuItem == 'Horario' ? Colors.blue : null,
              onTap: () {
                setState(() {
                  _selectedMenuItem = 'Horario';
                });
                Navigator.of(context)
                    .pushNamed('/licoresl'); // Cierra el drawer
              },
            ),
            ListTile(
              title: const Text('Cerrar Sesión'),
              tileColor: _selectedMenuItem == 'Cerrar Sesión'
                  ? Color.fromARGB(255, 218, 7, 7)
                  : null,
              onTap: () {
                // Agrega aquí el código para cerrar sesión
                Navigator.of(context).pushNamed('/logo'); // Cierra el drawer
              },
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Dos columnas
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/azucares');
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    "assets/azucar.jpg",
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                  ListTile(
                    title: Text("Azucares y deribados"),
                    subtitle: Text("Descripción del Producto 1"),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Acción a realizar cuando se toque el ListTile
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    "assets/conservantes.jpg",
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                  ListTile(
                    title: Text("Conservantes y enlatados"),
                    subtitle: Text("Descripción del Producto 1"),
                  ),
                ],
              ),
            ),
          ),
          // Agrega más Card según tus necesidades
          GestureDetector(
            onTap: () {
              // Acción a realizar cuando se toque el ListTile
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    "assets/condimentos.jpg",
                    fit: BoxFit.cover,
                    height: 110,
                  ),
                  ListTile(
                    title: Text("Condimentos y salsas"),
                    subtitle: Text("Descripción del Producto 1"),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Acción a realizar cuando se toque el ListTile
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    "assets/te cafe.jpg",
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                  ListTile(
                    title: Text("Te, Cafe y  Cacao"),
                    subtitle: Text("Descripción del Producto 1"),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/fideoslistado');
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    "assets/fideos.png",
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                  ListTile(
                    title: Text("Fideo y Arinas"),
                    subtitle: Text("Descripción del Producto 1"),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/aceitelistado');
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    "assets/aceites.jpg",
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                  ListTile(
                    title: Text("Aceites y Grasas"),
                    subtitle: Text("Descripción del Producto 1"),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/listaGranos');
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    "assets/granos.jpg",
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                  ListTile(
                    title: Text("Granos en Polvo"),
                    subtitle: Text("Descripción del Producto 1"),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/listaJugos');
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    "assets/jugos.png",
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                  ListTile(
                    title: Text("Jugos en Polvo"),
                    subtitle: Text("Descripción del Producto 1"),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/bebidas');
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    "assets/bebidas.jpg",
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                  ListTile(
                    title: Text("Bebidas"),
                    subtitle: Text("Descripción del Producto 1"),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/licoresl');
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    "assets/licor.jpg",
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                  ListTile(
                    title: Text("Licores"),
                    subtitle: Text("Descripción del Producto 1"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
