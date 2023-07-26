class azucar {
  final int? id;
  final String nombre;
  final String cantidad;
  final String descripcion;
  azucar({
    this.id,
    required this.nombre,
    required this.cantidad,
    required this.descripcion,
  });
  factory azucar.FromMap(Map<String, dynamic> data) => azucar(
        id: data['id'],
        nombre: data['nombre_azu'],
        cantidad: data['cantidad_azu'],
        descripcion: data['descripcion'],
      );
  Map<String, dynamic> toMap() => {
        'id': id,
        'nombre_azu': nombre,
        'cantidad_azu': cantidad,
        'descripcion': descripcion,
      };
}
