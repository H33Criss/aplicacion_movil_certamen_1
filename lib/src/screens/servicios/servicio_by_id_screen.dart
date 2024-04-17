import 'package:aplicacion_certamen1/data/fake_db.dart';
import 'package:aplicacion_certamen1/infrastructure/models/servicio_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

import '../../components/index.dart';

class ServicioById extends StatelessWidget {
  final int id;
  const ServicioById({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    double top = MediaQuery.of(context).viewPadding.top;
    double bottom = MediaQuery.of(context).viewPadding.bottom;
    Size size = MediaQuery.of(context).size;
    double perfectH = (size.height) - (top + bottom);

    final servicioFromDb = serviciosBase.firstWhere((s) => s['id'] == id);
    final servicio = ServicioModel.fromFakeDb(servicioFromDb);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Informacion del Servicio'),
        ),
        body: ListView(
          children: [
            Container(
              //El margin bottom es 0,12 radio del circleAvatar
              margin: EdgeInsets.only(bottom: perfectH * 0.12),
              child: _FondoYAvatar(
                size: size,
                perfectH: perfectH,
                servicio: servicio,
              ),
            ),
            _InformacionServicio(servicio: servicio)
          ],
        ));
  }
}

class _InformacionServicio extends StatelessWidget {
  const _InformacionServicio({
    required this.servicio,
  });

  final ServicioModel servicio;

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Column(
      children: [
        const SizedBox(height: 8),
        Text(servicio.encargado, style: textStyles.headlineLarge),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(MdiIcons.mapMarker, color: colors.primary),
            Text(
              servicio.localizacion,
              style: textStyles.titleLarge,
            ),
          ],
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 24, right: 24, top: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Descripcion ', style: textStyles.headlineSmall),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                      color: colors.inversePrimary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(servicio.statusToString,
                        style: textStyles.bodyLarge),
                  )
                ],
              ),
              Text(
                servicio.descripcion,
                //El height es la separacion entre lineas, por defecto era 1
                style: const TextStyle(height: 1.4),
              )
            ],
          ),
        )
      ],
    );
  }
}

class _FondoYAvatar extends StatelessWidget {
  const _FondoYAvatar({
    required this.size,
    required this.perfectH,
    required this.servicio,
  });

  final Size size;
  final double perfectH;
  final ServicioModel servicio;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: size.width,
          height: perfectH * 0.35,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(servicio.urlImgDescriptiva),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: size.width,
          height: perfectH * 0.35,
          child: const CustomGradient(
            stops: [0.2, 1.0],
            colors: [Colors.black, Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.center,
          ),
        ),
        Positioned(
          //Le resto el radio de la imagen para que quede al centro
          top: (perfectH * 0.35) - (perfectH * 0.12),
          child: CircleAvatar(
            radius: perfectH * 0.12,
            backgroundImage: AssetImage(servicio.urlImgEncargado),
            backgroundColor: Colors
                .transparent, // Fondo transparente para que el borde sea visible
            // Añade un borde alrededor del CircleAvatar
            foregroundColor: Colors
                .transparent, // Esto es importante para que el borde se muestre correctamente
            // Ajusta el grosor y color del borde según tus preferencias
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: colors.background, // Color del borde
                  width: 10.0, // Grosor del borde
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
