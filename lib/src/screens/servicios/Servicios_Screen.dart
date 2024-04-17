import 'package:aplicacion_certamen1/data/fake_db.dart';
import 'package:aplicacion_certamen1/infrastructure/models/servicio_model.dart';
import 'package:aplicacion_certamen1/src/components/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class ServiciosScreen extends StatelessWidget {
  const ServiciosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double top = MediaQuery.of(context).viewPadding.top;
    double bottom = MediaQuery.of(context).viewPadding.bottom;
    double perfectH = (size.height) - (top + bottom);
    final servicios =
        serviciosBase.map((s) => ServicioModel.fromFakeDb(s)).toList();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Servicios'),
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(8),
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: perfectH * 0.1,
                  child: UsmFormField(
                    label: 'Buscar',
                    prefixIcon: Icons.search_sharp,
                    suffixWidget: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter_list_outlined,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: perfectH * 0.8,
                  child: StaggeredGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    children: servicios.map((s) {
                      return _ServiceTile(servicio: s, perfectH: perfectH);
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ServiceTile extends StatelessWidget {
  final ServicioModel servicio;
  final double perfectH;
  const _ServiceTile({required this.servicio, required this.perfectH});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    return StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 3,
      child: InkResponse(
        radius: 70,
        onTap: () => context.push('/servicios/${servicio.id}'),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 1,
          ),
          child: Stack(
            children: [
              Container(
                height: perfectH * 0.3,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(10),
                    top: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: AssetImage(servicio.urlImgEncargado),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    const ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                      child: CustomGradient(
                        stops: [0.2, 1.0],
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          servicio.encargado,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 5,
                left: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  height: perfectH * 0.1,
                  decoration: BoxDecoration(
                    color: colors.surfaceVariant,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Estado: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(servicio.statusToString),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            MdiIcons.creditCardCheckOutline,
                            color: Colors.green[600],
                          ),
                          Text('\$${servicio.coste}'),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: colors.inversePrimary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              servicio.tipoToString,
                              style: textStyles.labelLarge,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            MdiIcons.mapMarkerCheckOutline,
                            color: colors.primary,
                            size: 18,
                          ),
                          Text(
                            servicio.localizacion,
                            style: const TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
