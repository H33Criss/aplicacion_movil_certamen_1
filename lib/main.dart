import 'package:aplicacion_certamen1/config/theme/Main_Theme.dart';
import 'package:flutter/material.dart';

import 'config/router/app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'The High Table',
      routerConfig: appRouter,
      theme: MainTheme().getTheme(),
    );
  }
}
