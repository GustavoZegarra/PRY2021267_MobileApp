import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromARGB(255, 10, 70, 160);
  static final ThemeData lightTheme = ThemeData.light().copyWith(
        primaryColor: primary,
        appBarTheme: const AppBarTheme(
          color: primary,
          foregroundColor: Colors.white,
          elevation: 0
        ),
        cardTheme: const CardTheme(
          elevation: 0,
        )
  );
}