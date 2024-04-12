import 'package:flutter/material.dart';

class MainTheme {
  ThemeData getTheme() => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorSchemeSeed: Colors.red[900],
      );
}
