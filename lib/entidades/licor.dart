class licor {
  final int? id;
  final String? tipol;
  final String nombrel;
  final int preciol;
  final String descripcionl;
  final String fechal;
  licor({
    this.id,
    required this.tipol,
    required this.nombrel,
    required this.preciol,
    required this.descripcionl,
    required this.fechal,
  });

  //configuracion para enviar y recivir datos
  factory licor.FromMap(Map<String, dynamic> data) => licor(
        id: data['id'],
        tipol: data['tipo_li'],
        nombrel: data['nombre_li'],
        preciol: data['precio_li'],
        descripcionl: data['descripcion_li'],
        fechal: data['fecha_li'],
      );

  //lado inverso de diccionario a map
  Map<String, dynamic> toMap() => {
        'id': id,
        'tipo_li': tipol,
        'nombre_li': nombrel,
        'precio_li': preciol,
        'descripcion_li': descripcionl,
        'fecha_li': fechal,
      };
}
