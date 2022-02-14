import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  //const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safety Rain'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Información de las quebradas')),
          Center(child: Text('Quebradas activas: 4')),
          Center(child: Text('Reportes registrados: 25')),
          Center(child: Text('Última actualización hace 2 minutos'))
        ],
      ),
    );
  }
}