import 'package:flutter/material.dart';

class AppTheme {
  
  //static const Color primary = Color.fromRGBO(61, 81, 194, 1);
  //static const Color primaryGradient = Color.fromARGB(255, 84, 178, 222);
  static const Color primary = Color.fromARGB(255, 29, 134, 217);
  static const Color primaryGradient = primary;
  static const Color secondary = Color.fromARGB(255, 255, 255, 255);
  static const Color textColor = Color.fromARGB(200, 0, 0, 0);

  static final ThemeData lightTheme = ThemeData.light().copyWith(

        primaryColor: primary,

        appBarTheme: const AppBarTheme(
          color: primary,
          foregroundColor: Colors.white,
          elevation: 1,
          centerTitle: false
        ),

        scaffoldBackgroundColor: secondary

  );
}