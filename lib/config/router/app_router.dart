import 'package:aplicacion_certamen1/src/pages/auth/login.dart';
import 'package:aplicacion_certamen1/src/pages/home.dart';
import 'package:go_router/go_router.dart';

import '../../src/screens/index.dart';

final appRouter = GoRouter(
  //Al cargar la app vamos a primera a esta ruta
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/asesinos',
      builder: (context, state) => const AsesinosScreen(),
    ),
    GoRoute(
      path: '/contratos',
      builder: (context, state) => const ContratosScreen(),
    ),
    GoRoute(
      path: '/servicios',
      builder: (context, state) => const ServiciosScreen(),
    ),
    GoRoute(
      path: '/hoteles',
      builder: (context, state) => const HotelesScreen(),
    ),
  ],
);
