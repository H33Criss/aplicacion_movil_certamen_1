import '../infrastructure/models/asesinos_model.dart';
import '../infrastructure/models/contrato_model.dart';
import '../infrastructure/models/servicio_model.dart';

List<Map<String, dynamic>> usuariosBase = [
  {
    'id': 1,
    'nombre': 'John Wick',
    'alias': 'Baba Yaga',
    'edad': 42,
    'ocupacion': 'Asesino Retirado',
    'ciudadResidencia': 'Nueva York',
    'nacionalidad': 'Estadounidense',
    'fotoPerfil': 'assets/usuarios/user1.webp',
    'contratosCompletados': 300,
    'isActive': true,
    'habilidades': ['Artes Marciales', 'Tiro con armas', 'Sigilo'],
    'armaPreferida': 'Heckler & Koch P30L',
    'contactoDeEmergencia': 'Winston Mercer',
    'enemigos': ['Santino D’Antonio', 'Viggo Tarasov'],
    'afiliaciones': ['The Continental', 'The High Table'],
    'especialidad': 'Combate cuerpo a cuerpo',
  },
];

List<Map<String, dynamic>> asesinosBase = [
  {
    'id': 1,
    'nombreClave': 'Baba Yaga',
    'edad': 42,
    'asesinatos': 300,
    'imgUrl': 'assets/asesinos/baba_yaga.jpeg',
    'ciudadResidencia': 'Nueva York',
    'ocupacion': 'Asesino Profesional',
    'genero': Genero.hombre,
    'nacionalidad': 'Estadounidense',
  },
  {
    'id': 2,
    'nombreClave': 'The Adjudicator',
    'edad': 38,
    'asesinatos': 150,
    'imgUrl': 'assets/asesinos/the_adjudicator.jpg',
    'ciudadResidencia': 'Nueva York',
    'ocupacion': 'Ejecutor',
    'genero': Genero.mujer,
    'nacionalidad': 'Estadounidense',
  },
  {
    'id': 3,
    'nombreClave': 'Zero',
    'edad': 35,
    'asesinatos': 75,
    'imgUrl': 'assets/asesinos/zero.jpg',
    'ciudadResidencia': 'Nueva York',
    'ocupacion': 'Asesino Profesional',
    'genero': Genero.hombre,
    'nacionalidad': 'Estadounidense',
  },
  {
    'id': 4,
    'nombreClave': 'Cassian',
    'edad': 40,
    'asesinatos': 100,
    'imgUrl': 'assets/asesinos/cassian.jpg',
    'ciudadResidencia': 'Nueva York',
    'ocupacion': 'Asesino Profesional',
    'genero': Genero.hombre,
    'nacionalidad': 'Estadounidense',
  },
  {
    'id': 5,
    'nombreClave': 'Santino D’Antonio',
    'edad': 45,
    'asesinatos': 50,
    'imgUrl': 'assets/asesinos/santino_dantonio.jpg',
    'ciudadResidencia': 'Roma',
    'ocupacion': 'Señor del crimen',
    'genero': Genero.hombre,
    'nacionalidad': 'Italiana',
  },
  {
    'id': 6,
    'nombreClave': 'Vincent Bisset de Gramont',
    'edad': 42,
    'asesinatos': 200,
    'imgUrl': 'assets/asesinos/vincent_bisset_de_gramont.jpg',
    'ciudadResidencia': 'París',
    'ocupacion': 'Miembro Senior de la Mesa Alta',
    'genero': Genero.hombre,
    'nacionalidad': 'Francesa',
  },
];

List<Map<String, dynamic>> serviciosBase = [
  {
    'id': 1,
    'encargado': 'Giorgio Caruso',
    'status': Status.activo,
    'descripcion':
        'El Sommelier ofrece armas y munición de alta calidad para los clientes de The Continental.',
    'tipoServicio': TipoDeServicio.sommelier,
    'localizacion': 'Nueva York',
    'urlImgEncargado': 'assets/encargados/giorgio_caruso1.webp',
    'urlImgDescriptiva': 'assets/encargados/giorgio_caruso.webp',
    'coste': 100,
    'productos': [
      {
        'nombre': 'Pistola Heckler & Koch P30L',
        'descripcion':
            'Arma de fuego semiautomática de la serie de pistolas Heckler & Koch',
        'urlImg': 'assets/productos/heckler_koch_p30l.jpg',
        'precio': 500,
      },
      {
        'nombre': 'Munición 9x19mm Parabellum',
        'descripcion': 'Munición estándar de calibre 9 mm',
        'urlImg': 'assets/productos/municion_parabellum.jpg',
        'precio': 20,
      },
    ],
  },
  {
    'id': 2,
    'encargado': 'Dr. Joseph Malakhov',
    'status': Status.activo,
    'descripcion':
        'El Doctor ofrece servicios médicos de urgencia, incluyendo tratamiento de heridas y rehabilitación rápida.',
    'tipoServicio': TipoDeServicio.doctor,
    'localizacion': 'Los Ángeles',
    'urlImgEncargado': 'assets/encargados/dr_joseph_malakhov1.webp',
    'urlImgDescriptiva': 'assets/encargados/dr_joseph_malakhov.webp',
    'coste': 80,
    'productos': null,
  },
  {
    'id': 3,
    'encargado': 'Winston Mercer',
    'status': Status.activo,
    'descripcion':
        'El Sastre proporciona trajes hechos a medida con tejidos especiales que ofrecen resistencia a balas y mayor movilidad.',
    'tipoServicio': TipoDeServicio.sastre,
    'localizacion': 'Londres',
    'urlImgEncargado': 'assets/encargados/winston_mercer1.webp',
    'urlImgDescriptiva': 'assets/encargados/winston_mercer.webp',
    'coste': 120,
    'productos': [
      {
        'nombre': 'Traje a medida resistente a balas',
        'descripcion':
            'Traje de alta costura hecho a medida con tejidos especiales',
        'urlImg': 'assets/productos/traje_resistente_balas.jpg',
        'precio': 500,
      },
    ],
  },
  {
    'id': 4,
    'encargado': 'Mikhail Bazhaev',
    'status': Status.activo,
    'descripcion':
        'Los Limpiadores se encargan del aseo de lugares donde ha habido asesinatos y de deshacerse de los cadáveres de manera discreta.',
    'tipoServicio': TipoDeServicio.limpiadores,
    'localizacion': 'París',
    'urlImgEncargado': 'assets/encargados/mikhail_bazhaev1.webp',
    'urlImgDescriptiva': 'assets/encargados/mikhail_bazhaev.webp',
    'coste': 90,
    'productos': null,
  },
];
List<Map<String, dynamic>> hotelesBase = [
  {
    'id': 1,
    'nombre': 'Continental',
    'propietario': 'Winston',
    'direccion': 'New York City, Estados Unidos',
    'cobroPorDia': 1000,
    'pais': 'Estados Unidos',
    'fotoHotel': 'assets/imgs/hotel1.jpg'
  },
  {
    'id': 2,
    'nombre': 'Continental Roma',
    'propietario': 'Julius',
    'direccion': 'Via Vittorio Veneto, Roma',
    'cobroPorDia': 1200,
    'pais': 'Italia',
    'fotoHotel': 'assets/imgs/hotel2.jpg'
  },
  {
    'id': 3,
    'nombre': 'The Bowery King',
    'propietario': 'Bowery King',
    'direccion': 'Nueva York City, Estados Unidos',
    'cobroPorDia': 800,
    'pais': 'Estados Unidos',
    'fotoHotel': 'assets/imgs/hotel3.webp'
  },
  {
    'id': 4,
    'nombre': 'The High Table',
    'propietario': 'The High Table',
    'direccion': 'Desconocida',
    'cobroPorDia': 5000,
    'pais': 'Desconocido',
    'fotoHotel': 'assets/imgs/hotel4.jpg'
  },
];

List<Map<String, dynamic>> contratosBase = [
  {
    'id': 1,
    'nombreContratista': 'Organización The High Table',
    'fechaLimite': DateTime(2024, 4, 15),
    'descripcionDelObjetivo': 'Eliminar objetivo designado',
    'objetivo': 'Franco Mangini, presidente de Chile',
    'estado': EstadoContrato.enProgreso,
    'recompensa': 20000,
    'esAbierto': true,
    'idAsesinoContratado': 1, // Asesino Baba Yaga
  },
  {
    'id': 2,
    'nombreContratista': 'Organización The High Table',
    'fechaLimite': DateTime(2024, 4, 18),
    'descripcionDelObjetivo': 'Eliminar objetivo designado',
    'objetivo': 'Renato Plaza, alto ejecutivo de la CIA',
    'estado': EstadoContrato.enProgreso,
    'recompensa': 15000,
    'esAbierto': true,
    'idAsesinoContratado': 2, // Asesino The Adjudicator
  },
  {
    'id': 3,
    'nombreContratista': 'Organización The High Table',
    'fechaLimite': DateTime(2024, 4, 20),
    'descripcionDelObjetivo': 'Eliminar objetivo designado',
    'objetivo': 'Julia Martínez, líder de una organización rival',
    'estado': EstadoContrato.completado,
    'recompensa': 10000,
    'esAbierto': false,
    'idAsesinoContratado': 3, // Asesino Zero
  },
  {
    'id': 4,
    'nombreContratista': 'Organización The High Table',
    'fechaLimite': DateTime(2024, 4, 22),
    'descripcionDelObjetivo': 'Eliminar objetivo designado',
    'objetivo': 'Hugo González, testigo clave en un juicio',
    'estado': EstadoContrato.enProgreso,
    'recompensa': 18000,
    'esAbierto': true,
    'idAsesinoContratado': 4, // Asesino Cassian
  },
  {
    'id': 5,
    'nombreContratista': 'Organización The High Table',
    'fechaLimite': DateTime(2024, 4, 25),
    'descripcionDelObjetivo': 'Eliminar objetivo designado',
    'objetivo': 'Laura Valdez, importante empresaria',
    'estado': EstadoContrato.enProgreso,
    'recompensa': 25000,
    'esAbierto': true,
    'idAsesinoContratado': 5, // Asesino Santino D’Antonio
  },
  {
    'id': 6,
    'nombreContratista': 'Organización The High Table',
    'fechaLimite': DateTime(2024, 4, 28),
    'descripcionDelObjetivo': 'Eliminar objetivo designado',
    'objetivo': 'Gabriel Jiménez, líder de una organización criminal',
    'estado': EstadoContrato.completado,
    'recompensa': 30000,
    'esAbierto': false,
    'idAsesinoContratado': 1, // Asesino Baba Yaga
  },
  {
    'id': 7,
    'nombreContratista': 'Organización The High Table',
    'fechaLimite': DateTime(2024, 4, 10),
    'descripcionDelObjetivo': 'Eliminar objetivo designado',
    'objetivo': 'Alejandro Rojas, testigo protegido',
    'estado': EstadoContrato.fallido,
    'recompensa': 30000,
    'esAbierto': false,
    'idAsesinoContratado': 2, // Asesino The Adjudicator
  },
];
