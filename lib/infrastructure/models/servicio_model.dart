enum TipoDeServicio {
  sommelier,
  doctor,
  sastre,
  limpiadores,
}

class ServicioModel {
  int id;
  String encargado;
  String descripcion;
  TipoDeServicio tipoServicio;
  String localizacionDelServicio;

  ServicioModel({
    required this.id,
    required this.encargado,
    required this.descripcion,
    required this.tipoServicio,
    required this.localizacionDelServicio,
  });

  factory ServicioModel.fromFakeDb(Map<String, dynamic> hotel) {
    return ServicioModel(
      id: hotel['id'],
      encargado: hotel['encargado'],
      descripcion: hotel['descripcion'],
      tipoServicio: hotel['tipoServicio'] as TipoDeServicio,
      localizacionDelServicio: hotel['localizacionDelServicio'],
    );
  }
}
