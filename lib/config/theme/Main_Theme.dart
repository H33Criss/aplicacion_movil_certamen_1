import 'package:flutter/material.dart';

class MainTheme {
  ThemeData getTheme() => ThemeData(
        fontFamily: 'Kanit',
        brightness: Brightness.dark,
        useMaterial3: true,
        //Apartir del color orange, se genera una paleta de colores
        colorSchemeSeed: Colors.orange[300],
        // colorSchemeSeed: Colors.yellow[600],

        // scaffoldBackgroundColor: Colors.red[900]?.withOpacity(0.15),
      );
}
