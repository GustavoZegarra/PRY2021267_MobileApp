import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/quebrada_widgets/card_quebrada.dart';

class QuebradaScreen extends StatefulWidget {

  QuebradaScreen({ Key? key }) : super(key: key);

  @override
  State<QuebradaScreen> createState() => _QuebradaScreenState();
}

class _QuebradaScreenState extends State<QuebradaScreen> {
  final List<CardQuebradaWidget> quebradas = [
    const CardQuebradaWidget(name: 'Nicolas de Pierola'),
    const CardQuebradaWidget(name: 'Carossio'),
    const CardQuebradaWidget(name: 'La libertad'),
    const CardQuebradaWidget(name: 'Santo Domingo'),
    const CardQuebradaWidget(name: 'Nicolas de Pierola'),
    const CardQuebradaWidget(name: 'Carossio'),
    const CardQuebradaWidget(name: 'La libertad'),
    const CardQuebradaWidget(name: 'Santo Domingo'),
    const CardQuebradaWidget(name: 'Nicolas de Pierola'),
    const CardQuebradaWidget(name: 'Carossio'),
    const CardQuebradaWidget(name: 'La libertad'),
    const CardQuebradaWidget(name: 'Santo Domingo')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: quebradas.length,
        itemBuilder: (context,index) {
          return quebradas[index];
        }
      ),
    );
  }
}