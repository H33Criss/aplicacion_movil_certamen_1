enum Genero {
  mujer,
  hombre,
}

class AsesinoModel {
  int id;
  String nombreClave;
  int edad;
  int asesinatos;
  String imgUrl;
  String ciudadResidencia;
  String nacionalidad;
  Genero genero;
  String ocupacion;

  AsesinoModel({
    required this.id,
    required this.nombreClave,
    required this.edad,
    required this.asesinatos,
    required this.imgUrl,
    required this.ciudadResidencia,
    required this.nacionalidad,
    required this.genero,
    required this.ocupacion,
  });

  factory AsesinoModel.fromFakeDb(Map<String, dynamic> asesino) {
    return AsesinoModel(
      id: asesino['id'],
      nombreClave: asesino['nombreClave'],
      edad: asesino['edad'],
      asesinatos: asesino['asesinatos'],
      imgUrl: asesino['imgUrl'],
      ciudadResidencia: asesino['ciudadResidencia'],
      nacionalidad: asesino['nacionalidad'],
      genero: asesino['genero'] as Genero,
      ocupacion: asesino['ocupacion'],
    );
  }

  String get generoToString {
    switch (genero) {
      case Genero.mujer:
        return 'Mujer';
      case Genero.hombre:
        return 'Hombre';
    }
  }
}
