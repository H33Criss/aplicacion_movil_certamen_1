import 'package:aplicacion_certamen1/data/fake_db.dart';
import 'package:aplicacion_certamen1/infrastructure/models/asesinos_model.dart';
import 'package:aplicacion_certamen1/infrastructure/models/contrato_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

class AsesinoById extends StatelessWidget {
  final int id;
  const AsesinoById({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    final asesinoFromDb = asesinosBase
        .firstWhere((asesino) => asesino['id'] == id, orElse: () => {});
    final asesino = AsesinoModel.fromFakeDb(asesinoFromDb);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalles del asesino'),
        ),
        body: SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _ImageAndTitle(asesino: asesino),
              const SizedBox(height: 8),
              _AsesinoInformation(asesino: asesino),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  children: [
                    Text('Contratos',
                        style:
                            TextStyle(fontSize: 20, color: colors.secondary)),
                    Icon(
                      MdiIcons.listBoxOutline,
                      color: colors.secondary,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              _Contratos(idAsesino: asesino.id),
            ],
          ),
        ));
  }
}

class _ImageAndTitle extends StatelessWidget {
  final AsesinoModel asesino;
  const _ImageAndTitle({required this.asesino});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: size.height * 0.3,
          height: size.height * 0.3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: Image.asset(
              asesino.imgUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          asesino.nombreClave,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _AsesinoInformation extends StatelessWidget {
  final AsesinoModel asesino;
  const _AsesinoInformation({required this.asesino});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          width: size.width * 0.9,
          height: size.height * 0.2,
          decoration: BoxDecoration(
            color: colors.surfaceVariant,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(MdiIcons.skull, size: 33, color: colors.secondary),
                  Text(
                    '${asesino.asesinatos}',
                    style: TextStyle(
                      fontSize: 30,
                      color: colors.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(MdiIcons.knifeMilitary,
                      size: 33, color: colors.secondary),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Edad:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    '${asesino.edad}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Ciudad:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    asesino.ciudadResidencia,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _Contratos extends StatelessWidget {
  final int idAsesino;
  const _Contratos({required this.idAsesino});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    final contratosFromDb = contratosBase
        .where((contrato) => contrato['idAsesinoContratado'] == idAsesino)
        .toList();
    final contratos = contratosFromDb
        .map((contrato) => ContratoModel.fromFakeDb(contrato))
        .toList();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      height: size.height * 0.1,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: contratos.isNotEmpty ? contratos.length : 1,
        itemBuilder: (context, i) {
          if (contratos.isEmpty) {
            return DottedBorder(
              dashPattern: const [4, 4, 4, 4],
              borderType: BorderType.RRect,
              color: colors.secondary,
              radius: const Radius.circular(12),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Container(
                  width: size.width * 0.4,
                  height: size.width * 0.4,
                  color: colors.secondaryContainer,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        MdiIcons.timelineQuestionOutline,
                        color: colors.secondary,
                      ),
                      Text(
                        'Nada aún.',
                        style: TextStyle(color: colors.secondary),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          final contrato = contratos[i];
          return Container(
              width: size.width * 0.4,
              height: size.width * 0.4,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: colors.secondaryContainer,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    contrato.estado,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(MdiIcons.cashMultiple, color: Colors.green[600]),
                      Text('\$${contrato.dineroAcordado}')
                    ],
                  )
                ],
              ));
        },
      ),
    );
  }
}
