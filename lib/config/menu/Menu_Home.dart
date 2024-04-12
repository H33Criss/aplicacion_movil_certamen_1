import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const List<MenuItem> menuItems = [
  MenuItem(
    title: 'Asesinos',
    subTitle: 'Listado de todos los asesinos de la organización.',
    link: '/asesinos',
    icon: MdiIcons.knife,
  ),
  MenuItem(
    title: 'Contratos',
    subTitle: 'Lista de contratos realizados con asesinos.',
    link: '/contratos',
    icon: MdiIcons.windowRestore,
  ),
  MenuItem(
    title: 'Servicios',
    subTitle: 'Una guía con los servicios disponibles.',
    link: '/servicios',
    icon: MdiIcons.roomServiceOutline,
  ),
  MenuItem(
    title: 'Hoteles',
    subTitle: 'Los hoteles Continental proveen refugio a los asesinos.',
    link: '/hoteles',
    icon: MdiIcons.homeCityOutline,
  ),
];
