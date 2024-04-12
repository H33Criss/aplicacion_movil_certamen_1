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
}
