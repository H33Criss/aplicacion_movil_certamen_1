import '../infrastructure/models/asesinos_model.dart';
import '../infrastructure/models/contrato_model.dart';
import '../infrastructure/models/servicio_model.dart';

List<Map<String, dynamic>> asesinosBase = [
  {
    'id': 1,
    'nombreClave': 'Baba Yaga',
    'edad': 42,
    'asesinatos': 300,
    'imgUrl': 'assets/asesinos/baba_yaga.jpeg',
    'ciudadResidencia': 'Nueva York',
    'ocupacion': 'Asesino Profesional', // Traducción de 'Professional Assassin'
    'genero': Genero.hombre, // Género masculino
    'nacionalidad': 'Estadounidense',
  },
  {
    'id': 2,
    'nombreClave': 'The Adjudicator',
    'edad': 38,
    'asesinatos': 150,
    'imgUrl': 'assets/asesinos/the_adjudicator.jpg',
    'ciudadResidencia': 'Nueva York',
    'ocupacion': 'Ejecutor', // Traducción de 'Executioner'
    'genero': Genero.mujer, // Género femenino
    'nacionalidad': 'Estadounidense',
  },
  {
    'id': 3,
    'nombreClave': 'Zero',
    'edad': 35,
    'asesinatos': 75,
    'imgUrl': 'assets/asesinos/zero.jpg',
    'ciudadResidencia': 'Nueva York',
    'ocupacion': 'Asesino Profesional', // Traducción de 'Professional Assassin'
    'genero': Genero.hombre, // Género masculino
    'nacionalidad': 'Estadounidense',
  },
  {
    'id': 4,
    'nombreClave': 'Cassian',
    'edad': 40,
    'asesinatos': 100,
    'imgUrl': 'assets/asesinos/cassian.jpg',
    'ciudadResidencia': 'Nueva York',
    'ocupacion': 'Asesino Profesional', // Traducción de 'Professional Assassin'
    'genero': Genero.hombre, // Género masculino
    'nacionalidad': 'Estadounidense',
  },
  {
    'id': 5,
    'nombreClave': 'Santino D’Antonio',
    'edad': 45,
    'asesinatos': 50,
    'imgUrl': 'assets/asesinos/santino_dantonio.jpg',
    'ciudadResidencia': 'Roma',
    'ocupacion': 'Señor del crimen', // Traducción de 'Crime Lord'
    'genero': Genero.hombre, // Género masculino
    'nacionalidad': 'Italiana',
  },
  {
    'id': 6,
    'nombreClave': 'Vincent Bisset de Gramont',
    'edad': 42,
    'asesinatos': 200,
    'imgUrl': 'assets/asesinos/vincent_bisset_de_gramont.jpg',
    'ciudadResidencia': 'París',
    'ocupacion':
        'Miembro Senior de la Mesa Alta', // Traducción de 'Senior Member of the High Table'
    'genero': Genero.hombre, // Género masculino
    'nacionalidad': 'Francesa',
  },
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
];
