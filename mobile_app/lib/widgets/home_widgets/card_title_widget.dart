import 'package:flutter/material.dart';
import 'package:mobile_app/themes/app_theme.dart';

class CardTitleWidget extends StatelessWidget {
  const CardTitleWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color.fromRGBO(255, 255, 255, 0.8)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 5),
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.amber,
            child: Icon(Icons.person,size:30,color: Colors.white),
          ),
          const SizedBox(width: 20), 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Fernando Valdiviezo'),
              Text('Usuario registrado'),
            ],
          )
        ],
      ),
    );
  }
}