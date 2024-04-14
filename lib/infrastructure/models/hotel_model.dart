class HotelModel {
  int id;
  String nombre;
  String propietario;
  String direccion;
  String fotoHotel;
  int cobroPorDia;
  String pais;

  HotelModel({
    required this.id,
    required this.nombre,
    required this.propietario,
    required this.direccion,
    required this.cobroPorDia,
    required this.fotoHotel,
    required this.pais,
  });
  factory HotelModel.fromFakeDb(Map<String, dynamic> hotel) {
    return HotelModel(
      id: hotel['id'],
      nombre: hotel['nombre'],
      propietario: hotel['propietario'],
      fotoHotel: hotel['fotoHotel'],
      direccion: hotel['direccion'],
      cobroPorDia: hotel['cobroPorDia'],
      pais: hotel['pais'],
    );
  }
}
