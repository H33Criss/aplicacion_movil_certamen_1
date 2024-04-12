class AsesinoModel {
  int id;
  String nombreClave;
  int edad;
  int asesinatos;
  String imgUrl;
  String ciudadResidencia;

  AsesinoModel({
    required this.id,
    required this.nombreClave,
    required this.edad,
    required this.asesinatos,
    required this.imgUrl,
    required this.ciudadResidencia,
  });

  factory AsesinoModel.fromFakeDb(Map<String, dynamic> asesino) {
    return AsesinoModel(
      id: asesino['id'],
      nombreClave: asesino['nombreClave'],
      edad: asesino['edad'],
      asesinatos: asesino['asesinatos'],
      imgUrl: asesino['imgUrl'],
      ciudadResidencia: asesino['ciudadResidencia'],
    );
  }
}
