import 'package:flutter/material.dart';

class CardQuebradaWidget extends StatelessWidget {

  final String name;

  const CardQuebradaWidget({ Key? key, required this.name }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(name)
    );
  }
}