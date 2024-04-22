import 'package:aplicacion_certamen1/src/pages/auth/login_page.dart';
import 'package:aplicacion_certamen1/src/pages/home_page.dart';
import 'package:go_router/go_router.dart';

import '../../src/screens/index.dart';

final appRouter = GoRouter(
  //Al cargar la app vamos a primera a esta ruta
  initialLocation: '/login',
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
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/asesinos',
      builder: (context, state) => const AsesinosScreen(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final idAsesino = state.pathParameters['id'] ?? '0';
            return AsesinoById(id: int.parse(idAsesino));
          },
        ),
      ],
    ),
    GoRoute(
      path: '/contratos',
      builder: (context, state) => const ContratosScreen(),
    ),
    GoRoute(
      path: '/servicios',
      builder: (context, state) => const ServiciosScreen(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final idServicio = state.pathParameters['id'] ?? '0';
            return ServicioById(id: int.parse(idServicio));
          },
        ),
      ],
    ),
    GoRoute(
      path: '/hoteles',
      builder: (context, state) => const HotelesScreen(),
    ),
  ],
);
