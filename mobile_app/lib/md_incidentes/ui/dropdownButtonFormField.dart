import 'package:flutter/material.dart';
import 'package:mobile_app/themes/app_theme.dart';

class ReporteDropdownButtonFormFieldDecoration{
  
  static InputDecoration decoration({
    required String label,
    IconData? prefixIcon,
    Widget? suffixIcon,
    bool enabled = true,
  }){
    return InputDecoration(
      enabled: enabled,
      hintStyle: const TextStyle(color: Colors.grey),
      focusColor: Colors.grey,
      label: Text(label, style: const TextStyle(color: Colors.grey)),
      //labelText: labelText,
      //floatingLabelBehavior: FloatingLabelBehavior.always,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2),
      ),
      prefixIcon: Icon(prefixIcon),
      suffixIcon: suffixIcon
    );
  }

}