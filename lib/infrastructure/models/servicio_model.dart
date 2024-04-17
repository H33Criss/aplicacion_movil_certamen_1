enum TipoDeServicio {
  sommelier,
  doctor,
  sastre,
  limpiadores,
}

enum Status {
  activo,
  inactivo,
  vivo,
  muerto,
}

class Producto {
  String nombre;
  String descripcion;
  String urlImg;
  int precio;

  Producto({
    required this.nombre,
    required this.descripcion,
    required this.urlImg,
    required this.precio,
  });

  factory Producto.fromFakeDb(Map<String, dynamic> producto) {
    return Producto(
      nombre: producto['nombre'],
      descripcion: producto['descripcion'],
      urlImg: producto['urlImg'],
      precio: producto['precio'],
    );
  }
}

class ServicioModel {
  int id;
  String encargado;
  String urlImgEncargado;
  String urlImgDescriptiva;
  String descripcion;
  Status status;
  TipoDeServicio tipoServicio;
  String localizacion;
  int coste;
  List<Producto>? productos;

  ServicioModel({
    required this.id,
    required this.encargado,
    required this.status,
    required this.descripcion,
    required this.tipoServicio,
    required this.localizacion,
    required this.urlImgEncargado,
    required this.urlImgDescriptiva,
    required this.coste,
    this.productos,
  });

  factory ServicioModel.fromFakeDb(Map<String, dynamic> servicio) {
    return ServicioModel(
      id: servicio['id'],
      encargado: servicio['encargado'],
      descripcion: servicio['descripcion'],
      status: servicio['status'] as Status,
      tipoServicio: servicio['tipoServicio'] as TipoDeServicio,
      localizacion: servicio['localizacion'],
      urlImgEncargado: servicio['urlImgEncargado'],
      urlImgDescriptiva: servicio['urlImgDescriptiva'],
      coste: servicio['coste'],
      //Se castea como lista, para que aparezca el metodo map.
      productos: (servicio['productos'] as List<dynamic>?)?.map((p) {
        return Producto.fromFakeDb(p);
      }).toList(),
    );
  }

  String get statusToString {
    switch (status) {
      case Status.activo:
        return 'Activo';
      case Status.inactivo:
        return 'Inactivo';
      case Status.vivo:
        return 'Vivo';
      case Status.muerto:
        return 'Muerto';
    }
  }

  String get tipoToString {
    switch (tipoServicio) {
      case TipoDeServicio.doctor:
        return 'Doctor';
      case TipoDeServicio.limpiadores:
        return 'Limpiador';
      case TipoDeServicio.sastre:
        return 'Sastre';
      case TipoDeServicio.sommelier:
        return 'Sommelier';
    }
  }
}
