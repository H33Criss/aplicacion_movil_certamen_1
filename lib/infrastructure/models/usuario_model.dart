class UsuarioModel {
  int id;
  String nombre;
  String alias;
  //seria mejor tener la fecha de nacimiento, pero bueno
  int edad;
  String ocupacion;
  String ciudadResidencia;
  String nacionalidad;
  String fotoPerfil;
  int contratosCompletados;
  bool isActive;
  List<String> habilidades;
  String armaPreferida;
  String contactoDeEmergencia;
  List<String> enemigos;
  List<String> afiliaciones;
  String especialidad;

  UsuarioModel({
    required this.id,
    required this.nombre,
    required this.alias,
    required this.edad,
    required this.ocupacion,
    required this.ciudadResidencia,
    required this.nacionalidad,
    required this.fotoPerfil,
    required this.contratosCompletados,
    required this.isActive,
    required this.habilidades,
    required this.armaPreferida,
    required this.contactoDeEmergencia,
    required this.enemigos,
    required this.afiliaciones,
    required this.especialidad,
  });

  factory UsuarioModel.fromFakeDb(Map<String, dynamic> usuario) {
    return UsuarioModel(
      id: usuario['id'],
      nombre: usuario['nombre'],
      alias: usuario['alias'],
      edad: usuario['edad'],
      ocupacion: usuario['ocupacion'],
      ciudadResidencia: usuario['ciudadResidencia'],
      nacionalidad: usuario['nacionalidad'],
      fotoPerfil: usuario['fotoPerfil'],
      contratosCompletados: usuario['contratosCompletados'],
      isActive: usuario['isActive'] as bool,
      //descubrí que la lista tiene el metodo "from"
      habilidades: List<String>.from(usuario['habilidades']),
      armaPreferida: usuario['armaPreferida'],
      contactoDeEmergencia: usuario['contactoDeEmergencia'],
      enemigos: List<String>.from(usuario['enemigos']),
      afiliaciones: List<String>.from(usuario['afiliaciones']),
      especialidad: usuario['especialidad'],
    );
  }
}
