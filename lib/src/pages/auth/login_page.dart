import 'package:aplicacion_certamen1/src/components/index.dart';
import 'package:aplicacion_certamen1/src/components/inputs/usm_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    double top = MediaQuery.of(context).viewPadding.top;
    double bottom = MediaQuery.of(context).viewPadding.bottom;
    Size size = MediaQuery.of(context).size;
    //este seria el height exacto utilizable por la app
    double perfectH = (size.height) - (top + bottom);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            height: perfectH,
            child: Stack(
              children: [
                _HeaderLogin(
                  size: size,
                  perfectH: perfectH,
                  colors: colors,
                  textStyles: textStyles,
                ),
                Positioned(
                  right: 0,
                  top: perfectH * 0.12,
                  child: Image.asset(
                    'assets/imgs/john_wickv2.png',
                    width: size.width * 0.4,
                  ),
                ),
                _FormularioLogin(size: size, perfectH: perfectH, colors: colors)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FormularioLogin extends StatelessWidget {
  const _FormularioLogin({
    required this.size,
    required this.perfectH,
    required this.colors,
  });

  final Size size;
  final double perfectH;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Positioned(
      bottom: 0,
      child: Container(
        width: size.width,
        height: perfectH * 0.7,
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 100,
          bottom: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          color: colors.background,
        ),
        child: Column(
          children: [
            const UsmFormField(
              label: 'Correo Electronico',
              prefixIcon: MdiIcons.emailArrowRightOutline,
              type: TextInputType.emailAddress,
            ),
            const SizedBox(height: 22),
            const UsmFormField(
              label: 'Contraseña',
              prefixIcon: MdiIcons.keyArrowRight,
              obscureText: true,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('¿Olvidaste tu contraseña?'),
                Icon(MdiIcons.knife, color: colors.primary)
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('¿No tienes cuenta?'),
                const SizedBox(width: 5),
                Text(
                  'Vete de aquí',
                  style: TextStyle(color: colors.primary),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomFilledButton(
                  text: 'ingresar',
                  onPressed: () => context.push('/'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderLogin extends StatelessWidget {
  const _HeaderLogin({
    required this.size,
    required this.perfectH,
    required this.colors,
    required this.textStyles,
  });

  final Size size;
  final double perfectH;
  final ColorScheme colors;
  final TextTheme textStyles;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: perfectH * 0.35,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          colors.primary,
          colors.background,
        ],
      )),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 70, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Iniciar sesión',
              style: textStyles.displaySmall,
            ),
            const SizedBox(height: 5),
            Text(
              'Entra a The Hight Table',
              style: textStyles.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
