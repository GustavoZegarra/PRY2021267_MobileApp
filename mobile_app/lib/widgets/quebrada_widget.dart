import 'package:flutter/material.dart';

class QuebradaWidget extends StatelessWidget {
   
  //const QuebradaWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Image(
            image: AssetImage('assets/normal.jpg'),
            width: double.infinity,
            height: 60,
          ),
          Text('Nombre de la quebrada'),
          Text('Información de la quebrada')
        ],
      ),
    );
  }
}