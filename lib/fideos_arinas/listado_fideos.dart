
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:producto_4/controladores/controladorfideos.dart';
import 'package:producto_4/entidades/fideos.dart';

class fideoslistado extends StatefulWidget {
  const fideoslistado({Key? key});

  @override
  State<fideoslistado> createState() => _formularioState();
}

class _formularioState extends State<fideoslistado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LISTA', textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: ()async{
         // SystemNavigator.pop();
         Navigator.of(context).pushNamed('/user_views');
          return await showDialog(
                              context: context,
                               builder: (BuildContext context  ) =>
                               AlertDialog(title: Text("Cerrar App"),
                               content: Text("seguro de cerrar la aplicacion "),
                               actions: [
                                TextButton(onPressed: () async{
                                   //Navigator.of(context).pushNamed('/');
                                   SystemNavigator.pop();
                                },
                                 child: Text("Aceptar")),
      
                                 TextButton(onPressed: (){
                                  Navigator.pop(context, "cancel");
                                 },
                                 child: Text("Cancelar")),
                               ],
                               ) );
          
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<List<Fideo>>(
            future: Controladorfideos.select(),
            builder:(context, AsyncSnapshot<List<Fideo>>snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text("Cargando......"),
                );
              } else if (snapshot.hasError){
                return Center(
                  child: Text(snapshot.error.toString()),
                );
      
              } else if(snapshot.hasData){
                List <Fideo>? fideos = snapshot.data; 
                return ListView(
                  children: [
                    for (var fideo in fideos !)
                   GestureDetector(
                    onTap: (){
                      Navigator.of(context)
                      .pushNamed('/edit', arguments: fideo);
                    },
                     child: Card(
                      child: Row(
                        children: [
                          Expanded(child: Text(fideo.nombre_fi + '  ' +fideo.descripcion.toString())),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed:() => showDialog(
                              context: context,
                               builder: (BuildContext context  ) =>
                               AlertDialog(title: Text("Eliminar Registro"),
                               content: Text("seguro de eliminar"),
                               actions: [
                                TextButton(onPressed: () async{
                                   await Controladorfideos.delete(fideo);
                                   Navigator.of(context).pushNamed('/');
                                },
                                 child: Text("Aceptar")),
      
                                 TextButton(onPressed: (){
                                  Navigator.pop(context, "cancel");
                                 },
                                 child: Text("Cancelar")),
                               ],
                               ) ))
      
                      ],
                      ),
                                 
                                 
                            ),
                               
                               
                   ),
                   
                  ],
                );
              }
              return Center( child: Text("No existe datos"),);
              
            } ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/crearfideos');
        },
        child: Icon(Icons.add),
        
      ),
      
      
    );
  }
  
}

