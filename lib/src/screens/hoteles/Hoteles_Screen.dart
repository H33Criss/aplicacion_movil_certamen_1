import 'package:aplicacion_certamen1/data/fake_db.dart';
import 'package:aplicacion_certamen1/infrastructure/models/hotel_model.dart';
import 'package:aplicacion_certamen1/src/components/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HotelesScreen extends StatelessWidget {
  const HotelesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double top = MediaQuery.of(context).viewPadding.top;
    double bottom = MediaQuery.of(context).viewPadding.bottom;
    Size size = MediaQuery.of(context).size;
    double perfectH = (size.height) - (top + bottom);

    final hoteles = hotelesBase.map((h) => HotelModel.fromFakeDb(h)).toList();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hoteles'),
        ),
        body: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: hoteles.map((hotel) {
            return StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 3,
              child: Stack(
                children: [
                  //Imagen de fondo
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(hotel.fotoHotel),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //Gradiente para la caja
                  const CustomGradient(
                    stops: [0.2, 1.0],
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  ),
                  //Caja con informacion del hotel
                  _InformationBox(
                    size: size,
                    perfectH: perfectH,
                    hotel: hotel,
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _InformationBox extends StatelessWidget {
  const _InformationBox({
    required this.size,
    required this.perfectH,
    required this.hotel,
  });
  final HotelModel hotel;
  final Size size;
  final double perfectH;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        width: size.width * 0.5,
        height: perfectH * 0.1,
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Nombre: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  hotel.nombre,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(MdiIcons.mapMarkerOutline),
                Flexible(
                  child: Wrap(
                    children: [
                      Text(
                        hotel.direccion.split(',')[0],
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(MdiIcons.currencyUsd, color: Colors.green[500]),
                      Text(
                        '${hotel.cobroPorDia}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const Text(' x Día')
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
