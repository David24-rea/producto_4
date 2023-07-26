class Granos {
  final int? id;
  final String codigo_gra;
  final String nombre_gra;
  final String? descripcion_gra;
  final String? cantidad_gra;
  final String fecha_gra;

  Granos({
    this.id,
    required this.codigo_gra,
    required this.nombre_gra,
    required this.descripcion_gra,
    required this.cantidad_gra,
    required this.fecha_gra,
  });

  // configuracion para enviar y recivir datos
  // contruir variable tipo usuario

  factory Granos.fromMap(Map<String, dynamic> data) => Granos(
        id: data['id'],
        codigo_gra: data['codigo_gra'],
        nombre_gra: data['nombre_gra'],
        descripcion_gra: data['descripcion_gra'],
        cantidad_gra: data['cantidad_gra'],
        fecha_gra: data['fecha_gra'],
      );
  Map<String, dynamic> toMap() => {
        'id': id,
        'codigo_gra': codigo_gra,
        'nombre_gra': nombre_gra,
        'descripcion_gra': descripcion_gra,
        'cantidad_gra': cantidad_gra,
        'fecha_gra': fecha_gra
      };
}
