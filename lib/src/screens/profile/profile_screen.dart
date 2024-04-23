import 'package:aplicacion_certamen1/data/fake_db.dart';
import 'package:aplicacion_certamen1/infrastructure/models/usuario_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    double top = MediaQuery.of(context).viewPadding.top;
    double bottom = MediaQuery.of(context).viewPadding.bottom;
    Size size = MediaQuery.of(context).size;
    //el height perfecto disponible
    double perfectH = (size.height) - (top + bottom);

    final usuario = UsuarioModel.fromFakeDb(usuariosBase[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tu Perfil'),
      ),
      body: SizedBox(
        width: size.width,
        height: perfectH,
        child: ListView(
          children: [
            const SizedBox(height: 35),
            _ImageAndNombre(
              usuario: usuario,
              textStyles: textStyles,
              perfectH: perfectH,
              colors: colors,
            ),
            _CamposYPropiedadesList(
              colors: colors,
              usuario: usuario,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Text('Habilidades', style: textStyles.titleLarge),
                  Icon(MdiIcons.boxingGlove, color: colors.primary)
                ],
              ),
            ),
            const SizedBox(height: 5),
            _ListaDeHabilidades(
              size: size,
              perfectH: perfectH,
              usuario: usuario,
              colors: colors,
            ),
            const SizedBox(height: 10),
            _ListaDeEnemigos(
              textStyles: textStyles,
              colors: colors,
              size: size,
              perfectH: perfectH,
              usuario: usuario,
            )
          ],
        ),
      ),
    );
  }
}

class _ListaDeEnemigos extends StatelessWidget {
  const _ListaDeEnemigos({
    required this.textStyles,
    required this.colors,
    required this.size,
    required this.perfectH,
    required this.usuario,
  });

  final TextTheme textStyles;
  final ColorScheme colors;
  final Size size;
  final double perfectH;
  final UsuarioModel usuario;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              Text('Lista de Enemigos', style: textStyles.titleLarge),
              Icon(MdiIcons.pistol, color: colors.primary),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_circle_outline,
                  color: colors.primary,
                  size: 30,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          width: size.width,
          height: perfectH * 0.3,
          child: ListView.builder(
            itemCount: usuario.enemigos.length,
            itemBuilder: (context, i) {
              final enemigo = usuario.enemigos[i];
              return Padding(
                padding: EdgeInsets.only(left: i * 10),
                child: Row(
                  children: [
                    Text(
                      ' ${i + 1}.',
                      style: TextStyle(
                        fontSize: 18 - (i * 3),
                        color: colors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '  ⚔️ $enemigo ☠️',
                      style: TextStyle(
                        fontSize: 18 - (i * 3),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ListaDeHabilidades extends StatelessWidget {
  const _ListaDeHabilidades({
    required this.size,
    required this.perfectH,
    required this.usuario,
    required this.colors,
  });

  final Size size;
  final double perfectH;
  final UsuarioModel usuario;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: perfectH * 0.15,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: usuario.habilidades.length + 1,
        itemBuilder: (context, i) {
          if (i == usuario.habilidades.length) {
            return DottedBorder(
              color: colors.primary,
              strokeWidth: 2,
              strokeCap: StrokeCap.round,
              borderType: BorderType.RRect,
              radius: const Radius.circular(10),
              dashPattern: const [8, 4],
              child: SizedBox(
                width: size.width * 0.3,
                height: double.infinity,
                child: Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_box_rounded,
                      color: colors.primary,
                      size: 40,
                    ),
                  ),
                ),
              ),
            );
          }
          final skill = usuario.habilidades[i];
          return Container(
            margin: const EdgeInsets.only(right: 15),
            width: size.width * 0.3,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(skill),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Icon(
                    MdiIcons.seal,
                    color: colors.primary,
                    size: 35,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CamposYPropiedadesList extends StatelessWidget {
  final ColorScheme colors;
  final UsuarioModel usuario;
  const _CamposYPropiedadesList({required this.colors, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CampoYPropiedadWidget(
          colors: colors,
          campo: 'Ocupación',
          propiedad: usuario.ocupacion,
          icono: Icons.work,
        ),
        _CampoYPropiedadWidget(
          colors: colors,
          campo: 'Arma Preferisa',
          propiedad: usuario.armaPreferida,
          icono: MdiIcons.pistol,
        ),
        _CampoYPropiedadWidget(
          colors: colors,
          campo: 'Especialidad',
          propiedad: usuario.especialidad,
          icono: MdiIcons.humanMaleBoardPoll,
        ),
        _CampoYPropiedadWidget(
          colors: colors,
          campo: 'Nacionalidad',
          propiedad: usuario.nacionalidad,
          icono: MdiIcons.flagCheckered,
        ),
        _CampoYPropiedadWidget(
          colors: colors,
          campo: 'Residencia',
          propiedad: usuario.ciudadResidencia,
          icono: MdiIcons.homeSiloOutline,
        ),
      ],
    );
  }
}

class _CampoYPropiedadWidget extends StatelessWidget {
  final ColorScheme colors;
  final String campo;
  final String propiedad;
  final IconData icono;
  const _CampoYPropiedadWidget({
    required this.colors,
    required this.campo,
    required this.propiedad,
    required this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Icon(icono, color: colors.primary, size: 30),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                campo,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                propiedad,
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              MdiIcons.pencilCircle,
              color: colors.primary,
              size: 35,
            ),
          )
        ],
      ),
    );
  }
}

class _ImageAndNombre extends StatelessWidget {
  final UsuarioModel usuario;
  final TextTheme textStyles;
  final double perfectH;
  final ColorScheme colors;
  const _ImageAndNombre({
    required this.usuario,
    required this.textStyles,
    required this.perfectH,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: colors.primary,
                spreadRadius: 5,
                blurRadius: 15,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            border: Border.all(
              color: colors.primary,
              width: 3.0,
            ),
          ),
          child: Stack(
            children: [
              CircleAvatar(
                radius: perfectH * 0.12,
                backgroundImage: AssetImage(usuario.fotoPerfil),
              ),
              Positioned(
                bottom: perfectH * 0.0075,
                right: perfectH * 0.007,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(MdiIcons.pencilCircle),
                  color: colors.primary,
                  iconSize: perfectH * 0.05,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: perfectH * 0.03),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(usuario.nombre, style: textStyles.headlineMedium),
            const SizedBox(width: 10),
            usuario.isActive
                ? Icon(MdiIcons.checkDecagram, color: Colors.green[500])
                : Icon(MdiIcons.lockOff, color: Colors.red[600])
          ],
        ),
        Text(usuario.alias, style: textStyles.titleMedium),
        SizedBox(
          height: perfectH * 0.08,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    MdiIcons.knife,
                    color: colors.primary,
                  ),
                  Text(
                    '${usuario.contratosCompletados}',
                    style: textStyles.labelLarge,
                  ),
                  Icon(
                    MdiIcons.sword,
                    color: colors.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
