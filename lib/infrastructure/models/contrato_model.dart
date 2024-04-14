import 'package:aplicacion_certamen1/data/fake_db.dart';
import 'package:aplicacion_certamen1/infrastructure/models/asesinos_model.dart';

enum EstadoContrato {
  enProgreso,
  fallido,
  completado,
}

class ContratoModel {
  int id;
  EstadoContrato estado;
  String nombreContratista;
  String descripcionDelObjetivo;
  String objetivo;
  DateTime fechaLimite;
  int recompensa;
  bool esAbierto;
  int idAsesinoContratado;

  ContratoModel({
    required this.id,
    required this.nombreContratista,
    required this.fechaLimite,
    required this.descripcionDelObjetivo,
    required this.objetivo,
    required this.estado,
    required this.recompensa,
    required this.esAbierto,
    required this.idAsesinoContratado,
  });
  factory ContratoModel.fromFakeDb(Map<String, dynamic> contrato) {
    return ContratoModel(
      id: contrato['id'],
      nombreContratista: contrato['nombreContratista'],
      descripcionDelObjetivo: contrato['descripcionDelObjetivo'],
      objetivo: contrato['objetivo'],
      fechaLimite: contrato['fechaLimite'],
      estado: contrato['estado'] as EstadoContrato,
      recompensa: contrato['recompensa'],
      esAbierto: contrato['esAbierto'] as bool,
      idAsesinoContratado: contrato['idAsesinoContratado'],
    );
  }
  String get fechaLimiteToString {
    return '${fechaLimite.day}/${fechaLimite.month}/${fechaLimite.year}';
  }

  String get abiertoCerrado {
    return esAbierto ? 'Abierto' : 'Cerrrado';
  }

  AsesinoModel get asesino {
    final asesinoFromDb =
        asesinosBase.firstWhere((a) => a['id'] == idAsesinoContratado);
    final asesino = AsesinoModel.fromFakeDb(asesinoFromDb);

    return asesino;
  }

  String get estadoToString {
    switch (estado) {
      case EstadoContrato.enProgreso:
        return 'En Progreso';
      case EstadoContrato.fallido:
        return 'Fallido';
      case EstadoContrato.completado:
        return 'Completado';
    }
  }
}
