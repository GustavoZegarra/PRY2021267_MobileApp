import 'package:flutter/material.dart';

class DialogHelper {

  static showValidationUser(BuildContext context,String? correo, String? dni,String? celular) {
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(color: Colors.blueAccent),
            Text('Validando Correo...'+(correo ?? '(Revisando)')),
            Text('Validando DNI...'+(dni ?? '(Revisando)')),
            Text('Validando Celular...'+(celular ?? '(Revisando)')),
          ],
        )
      )
    );
  }

  static show(BuildContext context, String message) {
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(color: Colors.blueAccent),
            const SizedBox(width: 10),
            Text(message)
          ],
        )
      )
    );
  }
  static close(BuildContext context){
    Navigator.of(context).pop();
  }
}