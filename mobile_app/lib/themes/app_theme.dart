import 'package:flutter/material.dart';

class AppTheme {
  
  static const Color primary = Color.fromARGB(255, 61, 81, 194);
  static const Color primaryGradient = Color.fromARGB(255, 84, 178, 222);
  static const Color secondary = Color.fromARGB(245, 255, 255, 255);

  static final ThemeData lightTheme = ThemeData.light().copyWith(

        primaryColor: primary,

        appBarTheme: const AppBarTheme(
          color: primary,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true
        ),

        scaffoldBackgroundColor: secondary

  );
}