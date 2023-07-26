class Jugos {
  final int? id;
  final String codigo_jug;
  final String nombre_jug;
  final String? descripcion_jug;
  final String? cantidad_jug;
  final String fecha_jug;

  Jugos({
    this.id,
    required this.codigo_jug,
    required this.nombre_jug,
    required this.descripcion_jug,
    required this.cantidad_jug,
    required this.fecha_jug,
  });

  // configuracion para enviar y recivir datos
  // contruir variable tipo usuario

  factory Jugos.fromMap(Map<String, dynamic> data) => Jugos(
        id: data['id'],
        codigo_jug: data['codigo_jug'],
        nombre_jug: data['nombre_jug'],
        descripcion_jug: data['descripcion_jug'],
        cantidad_jug: data['cantidad_jug'],
        fecha_jug: data['fecha_jug'],
      );
  Map<String, dynamic> toMap() => {
        'id': id,
        'codigo_jug': codigo_jug,
        'nombre_jug': nombre_jug,
        'descripcion_jug': descripcion_jug,
        'cantidad_jug': cantidad_jug,
        'fecha_jug': fecha_jug
      };
}
