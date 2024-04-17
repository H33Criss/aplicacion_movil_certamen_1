import 'package:aplicacion_certamen1/data/fake_db.dart';
import 'package:aplicacion_certamen1/infrastructure/models/servicio_model.dart';
import 'package:flutter/material.dart';
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
              //El margin bottom será de 0,12 es decir el radio del circleAvatar
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
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Nombre, tipo de servicio, localizacion
              _NombresYOtros(
                servicio: servicio,
                textStyles: textStyles,
                colors: colors,
              ),
              _DescripcionYStatus(
                  servicio: servicio, textStyles: textStyles, colors: colors),
              const SizedBox(height: 15),
              //Es muy pequeño para extraerlo
              Row(
                children: [
                  Text('Coste de Reunión', style: textStyles.headlineSmall),
                  const Spacer(),
                  Icon(MdiIcons.cash100, color: Colors.green[600]),
                  const SizedBox(width: 5),
                  Text('\$${servicio.coste}', style: textStyles.headlineSmall)
                ],
              ),
              const SizedBox(height: 15),
              //Productos del servicio
              _ProductosServicio(
                servicio: servicio,
                textStyles: textStyles,
                colors: colors,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  CustomFilledButton(text: 'contactar', onPressed: () {}),
                ],
              ),
              //Este es para que haya un pequeño espacio vacio al final
              const SizedBox(height: 30)
            ],
          ),
        )
      ],
    );
  }
}

class _ProductosServicio extends StatelessWidget {
  final ServicioModel servicio;
  final TextTheme textStyles;
  final ColorScheme colors;
  const _ProductosServicio({
    required this.servicio,
    required this.textStyles,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    double top = MediaQuery.of(context).viewPadding.top;
    double bottom = MediaQuery.of(context).viewPadding.bottom;
    Size size = MediaQuery.of(context).size;
    double perfectH = (size.height) - (top + bottom);

    return Column(
      children: [
        Row(
          children: [
            Text(
              'Productos disponibles',
              style: textStyles.headlineSmall,
            ),
          ],
        ),
        SizedBox(
          width: size.width,
          //Si no hay productos, disminuir el tamaño vacio de esta caja
          height:
              servicio.productos == null ? perfectH * 0.05 : perfectH * 0.18,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount:
                servicio.productos == null ? 1 : servicio.productos!.length,
            itemBuilder: (context, i) {
              if (servicio.productos == null) {
                return const Text('No hay productos 😢');
              }
              final producto = servicio.productos![i];
              return InkResponse(
                radius: 200,
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: size.width * 0.6,
                  height: perfectH * 0.14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(producto.urlImg),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        //1 pixel mas abajo que el padre
                        bottom: -1,
                        child: SizedBox(
                          height: perfectH * 0.2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CustomGradient(
                              stops: const [0.1, 0.5, 1.0],
                              colors: [
                                Colors.black,
                                Colors.black.withOpacity(0.9),
                                Colors.transparent
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          height: perfectH * 0.2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                producto.nombre,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(MdiIcons.cash, color: Colors.green[600]),
                                  Text(
                                    '\$${producto.precio}',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _DescripcionYStatus extends StatelessWidget {
  final ServicioModel servicio;
  final TextTheme textStyles;
  final ColorScheme colors;
  const _DescripcionYStatus({
    required this.servicio,
    required this.textStyles,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Descripcion ', style: textStyles.headlineSmall),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                color: colors.inversePrimary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(servicio.statusToString, style: textStyles.bodyLarge),
            )
          ],
        ),
        Text(
          servicio.descripcion,
          //El height es la separacion entre lineas, por defecto era 1
          style: const TextStyle(height: 1.4),
        ),
      ],
    );
  }
}

class _NombresYOtros extends StatelessWidget {
  final ServicioModel servicio;
  final TextTheme textStyles;
  final ColorScheme colors;
  const _NombresYOtros({
    required this.servicio,
    required this.textStyles,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
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
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.work_outline_rounded, color: colors.primary),
            const SizedBox(width: 5),
            Text(
              servicio.tipoToString,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 48, vertical: 10),
          child: Divider(),
        ),
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
          // 0.35 + 0.01 % de pixels mas que la imagen.
          height: perfectH * 0.36,
          child: CustomGradient(
            //Cada stop corresponde a la distancia de cada color en el array
            stops: const [0.07, 0.4, 1.0],
            colors: [
              colors.background, // --> este el stop 0.07
              Colors.black, // --> este es el stop 0.4
              Colors.transparent, // --> este el stop 1.0
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.center,
          ),
        ),
        Positioned(
          top: (perfectH * 0.35) - (perfectH * 0.12),
          child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: colors.background,
                  width: 10.0,
                ),
              ),
              child: CircleAvatar(
                //Recordar estar medida 0.12*********
                radius: perfectH * 0.12,
                backgroundImage: AssetImage(servicio.urlImgEncargado),
              )),
        ),
      ],
    );
  }
}
