import 'package:flutter/material.dart';

class AppTheme {
  
  static const String nombre = 'SatefySat';
  static const String frase = 'Sistema de alerta temprana para lluvias';

  static const Color primaryColor = Color.fromARGB(255, 30, 135, 215);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
    ),
    scaffoldBackgroundColor: Colors.white,
  );

  static AppBar appBarTheme = AppBar(
    toolbarHeight: 80,  
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          nombre,
          style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,letterSpacing: 1),
        ),
        Text(
          frase,
          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),
        ),
      ]
    )
  );
  static AppBar appBarThemeSecondary = AppBar(
    toolbarHeight: 50,  
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          nombre,
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
        ),
      ]
    )
  );
}