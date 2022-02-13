import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  //const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Safety SAT'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {}
          )
        ],
      ),
      body: Column( // Cambiar a ListView
        children: [
        // TODO: Informacion general de las quebradas
        CardInfo(),
        // TODO: Listado horizontal de quebradas
        ]
      )
    );
  }
}