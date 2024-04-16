import 'package:aplicacion_certamen1/data/fake_db.dart';
import 'package:aplicacion_certamen1/infrastructure/models/asesinos_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:go_router/go_router.dart';

import '../../components/index.dart';

class AsesinosScreen extends StatelessWidget {
  const AsesinosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.primary,
        foregroundColor: colors.surface,
        onPressed: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: asesinosBase.length,
        itemBuilder: (context, i) {
          final asesinoFromDb = asesinosBase[i];
          final asesino = AsesinoModel.fromFakeDb(asesinoFromDb);

          return Container(
            height: size.height * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Image.asset(
                    asesino.imgUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  const CustomGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.topRight,
                    stops: [0.2, 1.0],
                    colors: [
                      Colors.transparent,
                      Colors.black87,
                    ],
                  ),
                  Positioned(
                    left: 20,
                    top: 10,
                    child: Row(
                      children: [
                        const Icon(MdiIcons.pistol),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          asesino.nombreClave,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 20,
                    child: ElevatedButton.icon(
                      onPressed: () => context.push('/asesinos/${asesino.id}'),
                      icon: const Icon(MdiIcons.eye),
                      label: const Text(
                        'Detalles',
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
