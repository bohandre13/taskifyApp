import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF5B4FE8);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Rajdhani',

    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.white,

    appBarTheme: const AppBarTheme(elevation: 0, centerTitle: false),
  );
}
