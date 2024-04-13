import 'package:flutter/material.dart';

class MainTheme {
  ThemeData getTheme() => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorSchemeSeed: Colors.yellow[600],
        // scaffoldBackgroundColor: Colors.red[900]?.withOpacity(0.15),
      );
}
