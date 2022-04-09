import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/widgets.dart';

class RecomendacionScreen extends StatelessWidget {
  const RecomendacionScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recomendaciones'),backgroundColor: Colors.green,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListCardWidget(),
            ListCardWidget(),
            ListCardWidget(),
            ListCardWidget(),
            ListCardWidget(),
            ListCardWidget(),
            ListCardWidget(),
            ListCardWidget(),
            ListCardWidget(),
          ],
        ),
      ),
    );
  }
}