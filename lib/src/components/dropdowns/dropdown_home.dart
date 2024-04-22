import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:go_router/go_router.dart';

class DropDownHome extends StatefulWidget {
  const DropDownHome({super.key});

  @override
  State<DropDownHome> createState() => _DropDownHomeState();
}

class _DropDownHomeState extends State<DropDownHome> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: colors.primary.withOpacity(.1),
      ),
      child: PopupMenuButton(
        // color: colors.primary,
        tooltip: 'Opciones',
        offset: const Offset(0, 40),
        icon: Row(
          children: [
            Icon(
              Icons.person,
              color: colors.primary,
            ),
            const SizedBox(width: 5),
            Text('John Wick', style: textStyles.labelMedium)
          ],
        ),
        onSelected: (value) {
          //Sería mejor un swich case aquí
          if (value == 'logout') {
            context.go('/login');
          }
          if (value == 'profile') {
            context.push('/profile');
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
          PopupMenuItem(
            value: 'profile',
            child: Row(
              children: [
                Icon(
                  MdiIcons.accountArrowRightOutline,
                  color: colors.secondary,
                ),
                const SizedBox(width: 10),
                Text('Perfil', style: TextStyle(color: colors.secondary)),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'logout',
            child: Row(
              children: [
                Icon(
                  MdiIcons.logout,
                  color: colors.secondary,
                ),
                const SizedBox(width: 10),
                Text('Cerrar sesión',
                    style: TextStyle(color: colors.secondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
