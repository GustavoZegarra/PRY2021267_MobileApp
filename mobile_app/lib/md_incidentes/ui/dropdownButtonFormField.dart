import 'package:flutter/material.dart';

class DropDownButtonFormFieldDecoration{
  
  static InputDecoration decoration(){
    return const InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: 2
        )
      ),
      labelStyle: TextStyle(
        color: Colors.grey
      )
    );
  }

}