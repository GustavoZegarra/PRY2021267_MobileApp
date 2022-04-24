import 'package:flutter/material.dart';
import 'package:mobile_app/themes/app_theme.dart';

class TextFormFieldDecoration{
  
  static InputDecoration decoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon
  }){
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppTheme.primaryColor,
          width: 2
        )
      ),
      hintText: hintText,
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Colors.grey
      ),
      prefixIcon: prefixIcon != null ? Icon(prefixIcon,color: AppTheme.primaryColor) : null
    );
  }

}