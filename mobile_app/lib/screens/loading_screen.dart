import 'package:flutter/material.dart';
import 'package:mobile_app/themes/app_theme.dart';

class LoadingScreen extends StatelessWidget {

  String mensaje;

  LoadingScreen({
     Key? key,
     required this.mensaje
     }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTheme.appBarTheme,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: Colors.blue,
            ),
            const SizedBox(height: 10,),
            Text('Cargando $mensaje...',style: const TextStyle(fontSize: 15),),
          ],
        ),
      ),
    );
  }
}