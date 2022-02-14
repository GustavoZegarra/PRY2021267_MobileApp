import 'package:flutter/material.dart';

class QuebradaWidget extends StatelessWidget {
   
  //const QuebradaWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              child: const Image(
                image: AssetImage('assets/normal.jpg'),
                width: double.infinity,
                height: 50,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('asdsss')
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}


