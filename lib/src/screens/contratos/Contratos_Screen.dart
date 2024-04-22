import 'package:aplicacion_certamen1/data/fake_db.dart';
import 'package:aplicacion_certamen1/infrastructure/models/contrato_model.dart';
import 'package:flutter/material.dart';
import 'package:group_list_view/group_list_view.dart';

class ContratosScreen extends StatelessWidget {
  const ContratosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    Map<String, List> contratos = {
      'En Progreso': contratosBase
          .where((c) => c['estado'] == EstadoContrato.enProgreso)
          .toList(),
      'Completados': contratosBase
          .where((c) => c['estado'] == EstadoContrato.completado)
          .toList(),
      'Fallidos': contratosBase
          .where((c) => c['estado'] == EstadoContrato.fallido)
          .toList(),
    };
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Contratos'),
        ),
        body: GroupListView(
          sectionsCount: 3,
          separatorBuilder: (context, index) => const SizedBox(height: 2),
          countOfItemInSection: (int section) {
            return contratos.values.toList()[section].length;
          },
          groupHeaderBuilder: (BuildContext context, int section) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Text(
                contratos.keys.toList()[section],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            );
          },
          itemBuilder: (context, i) {
            final contratoFromDb =
                contratos.values.toList()[i.section][i.index];
            final contrato = ContratoModel.fromFakeDb(contratoFromDb);
            return ListTile(
              splashColor: colors.surface,
              tileColor: colors.surfaceVariant,
              onTap: () {},
              title: Text(contrato.asesino.nombreClave),
              leading: Column(
                children: [
                  Text(
                    '(${contrato.estadoToString})',
                    style: TextStyle(
                        color: contrato.estado == EstadoContrato.completado
                            ? Colors.green
                            : contrato.estado == EstadoContrato.fallido
                                ? Colors.red
                                : Colors.orange[400]),
                  ),
                  Text('Limite: ${contrato.fechaLimiteToString}'),
                ],
              ),
              subtitle: Flexible(
                child: Wrap(
                  children: [
                    Text(
                      'OBJETIVO:  ${contrato.objetivo}',
                      softWrap:
                          true, // permite el salto de linea junto al widget wrap
                    ),
                  ],
                ),
              ),
              trailing: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('\$${contrato.recompensa}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
