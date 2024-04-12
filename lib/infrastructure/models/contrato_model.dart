class ContratoModel {
  int id;
  String estado;
  int dineroAcordado;
  bool esAbierto;
  int idAsesinoContratado;

  ContratoModel({
    required this.id,
    required this.estado,
    required this.dineroAcordado,
    required this.esAbierto,
    required this.idAsesinoContratado,
  });
}
