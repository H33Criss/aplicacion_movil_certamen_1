import '../infrastructure/models/servicio_model.dart';

List<Map<String, dynamic>> asesinosBase = [
  {
    'id': 1,
    'nombreClave': 'Baba Yaga',
    'edad': 42,
    'asesinatos': 300,
    'imgUrl': 'assets/asesinos/baba_yaga.jpeg',
    'ciudadResidencia': 'Nueva York',
  },
  {
    'id': 2,
    'nombreClave': 'The Adjudicator',
    'edad': 38,
    'asesinatos': 150,
    'imgUrl': 'assets/asesinos/the_adjudicator.jpg',
    'ciudadResidencia': 'Nueva York',
  },
  {
    'id': 3,
    'nombreClave': 'Zero',
    'edad': 35,
    'asesinatos': 75,
    'imgUrl': 'assets/asesinos/zero.jpg',
    'ciudadResidencia': 'Nueva York',
  },
  {
    'id': 4,
    'nombreClave': 'Cassian',
    'edad': 40,
    'asesinatos': 100,
    'imgUrl': 'assets/asesinos/cassian.jpg',
    'ciudadResidencia': 'Nueva York',
  },
  {
    'id': 5,
    'nombreClave': 'Santino D’Antonio',
    'edad': 45,
    'asesinatos': 50,
    'imgUrl': 'assets/asesinos/santino_dantonio.jpg',
    'ciudadResidencia': 'Roma',
  },
  {
    'id': 6,
    'nombreClave': 'Vincent Bisset de Gramont',
    'edad': 42,
    'asesinatos': 200,
    'imgUrl': 'assets/asesinos/vincent_bisset_de_gramont.jpg',
    'ciudadResidencia': 'París',
  }
];

List<Map<String, dynamic>> serviciosBase = [
  {
    'id': 1,
    'encargado': 'Gianna',
    'descripcion':
        'Experto en vinos para asesoramiento en selección y maridaje.',
    'tipoServicio': TipoDeServicio.sommelier.index,
    'localizacionDelServicio': 'Via dei Condotti, Roma',
  },
  {
    'id': 2,
    'encargado': 'Dr. Müller',
    'descripcion':
        'Cirujano especializado en extracción de balas y tratamiento de heridas.',
    'tipoServicio': TipoDeServicio.doctor.index,
    'localizacionDelServicio': 'Park Lane, Londres',
  },
  {
    'id': 3,
    'encargado': 'Mr. Tailor',
    'descripcion':
        'Confección de trajes a medida para ajuste perfecto y elegancia impecable.',
    'tipoServicio': TipoDeServicio.sastre.index,
    'localizacionDelServicio': 'Savile Row, Londres',
  },
  {
    'id': 4,
    'encargado': 'The Cleaners',
    'descripcion':
        'Equipo especializado en limpieza de escenas del crimen y eliminación de evidencias.',
    'tipoServicio': TipoDeServicio.limpiadores.index,
    'localizacionDelServicio': 'París, Francia',
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
  },
  {
    'id': 2,
    'nombre': 'Continental Roma',
    'propietario': 'Julius',
    'direccion': 'Via Vittorio Veneto, Roma',
    'cobroPorDia': 1200,
    'pais': 'Italia',
  },
  {
    'id': 3,
    'nombre': 'The Bowery King',
    'propietario': 'Bowery King',
    'direccion': 'Nueva York City, Estados Unidos',
    'cobroPorDia': 800,
    'pais': 'Estados Unidos',
  },
  {
    'id': 4,
    'nombre': 'The High Table',
    'propietario': 'The High Table',
    'direccion': 'Desconocida',
    'cobroPorDia': 5000,
    'pais': 'Desconocido',
  },
];

List<Map<String, dynamic>> contratosBase = [
  {
    'id': 1,
    'estado': 'En progreso',
    'dineroAcordado': 20000,
    'esAbierto': true,
    'idAsesinoContratado': 1,
  },
  {
    'id': 2,
    'estado': 'En progreso',
    'dineroAcordado': 15000,
    'esAbierto': true,
    'idAsesinoContratado': 2,
  },
  {
    'id': 3,
    'estado': 'Finalizado',
    'dineroAcordado': 10000,
    'esAbierto': false,
    'idAsesinoContratado': 3,
  },
  {
    'id': 4,
    'estado': 'En progreso',
    'dineroAcordado': 18000,
    'esAbierto': true,
    'idAsesinoContratado': 4,
  },
  {
    'id': 5,
    'estado': 'En progreso',
    'dineroAcordado': 25000,
    'esAbierto': true,
    'idAsesinoContratado': 5, // Asesino Santino D’Antonio
  },
  {
    'id': 6,
    'estado': 'Finalizado',
    'dineroAcordado': 30000,
    'esAbierto': false,
    'idAsesinoContratado': 1, // Baba Yaga
  },
];
