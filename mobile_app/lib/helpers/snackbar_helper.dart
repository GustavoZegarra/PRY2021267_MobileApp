import 'package:flutter/material.dart';

class SnackbarHelper {

  static show(BuildContext context,String message,Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(message)
      )
    );
  }
  
}