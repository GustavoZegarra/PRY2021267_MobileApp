import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/widgets.dart';

class IncidenteScreen extends StatelessWidget {



  const IncidenteScreen({ Key? key }) : super(key: key);

  final EdgeInsets padding = const EdgeInsets.only(right: 10,left: 10,top: 10);
  final double height = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            ListCardWidget(
              title: 'Gustavo Zegarra',
              footer: '04 de mayo',
            ),
            ListCardWidget(
              title: 'Fernando Valdiviezo',
              footer: '04 de mayo',
            ),
            ListCardWidget(
              title: 'Christian Sanchez'),
          ],
        )
      ),
    );
  }
}