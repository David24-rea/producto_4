class Fideo {
 final int? id;
 final String codigo_fi;
 final String nombre_fi;
  final String? descripcion;
 final String? cantidad ;
 final String fecha ;

  Fideo({
    this.id,
   required this.codigo_fi,
   required this.nombre_fi,
    required this.descripcion,
   required this.cantidad,
   required this.fecha,
  });

  // configuracion para enviar y recivir datos 
  // contruir variable tipo usuario

  factory Fideo.fromMap(Map<String, dynamic> data) =>Fideo(
    id: data ['id'], 
    codigo_fi: data ['codigo_fi'], 
    nombre_fi: data ['nombre_fi'], 
    descripcion: data ['descripcion'], 
    cantidad: data ['cantidad'], 
    fecha: data ['fecha'], 
    );
    Map<String, dynamic>toMap()=>
    {'id':id, 'codigo_fi':codigo_fi,'nombre_fi':nombre_fi,'descripcion':descripcion,'cantidad':cantidad,'fecha':fecha };
}