import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  //const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Safety SAT'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {}
          )
        ],
      ),
      body: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return QuebradaWidget();
            },
          ),
    );
  }
}