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
  factory ContratoModel.fromFakeDb(Map<String, dynamic> contrato) {
    return ContratoModel(
      id: contrato['id'],
      estado: contrato['estado'],
      dineroAcordado: contrato['dineroAcordado'],
      esAbierto: contrato['esAbierto'] as bool,
      idAsesinoContratado: contrato['idAsesinoContratado'],
    );
  }
}
