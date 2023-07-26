class bebidas {
  final int? id;
  final String? tipo;
  final String nombre;
  final int precio;
  final String descripcion;
  final String fecha;
  bebidas({
    this.id,
    required this.tipo,
    required this.nombre,
    required this.precio,
    required this.descripcion,
    required this.fecha,
  });

  //configuracion para enviar y recivir datos
  factory bebidas.FromMap(Map<String, dynamic> data) => bebidas(
        id: data['id'],
        tipo: data['tipo'],
        nombre: data['nombre'],
        precio: data['precio'],
        descripcion: data['descripcion'],
        fecha: data['fecha'],
      );

  //lado inverso de diccionario a map
  Map<String, dynamic> toMap() => {
        'id': id,
        'tipo': tipo,
        'nombre': nombre,
        'precio': precio,
        'descripcion': descripcion,
        'fecha': fecha,
      };
}
