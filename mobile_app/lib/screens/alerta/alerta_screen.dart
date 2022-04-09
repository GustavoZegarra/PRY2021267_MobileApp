import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/widgets.dart';

class AlertaScreen extends StatelessWidget {
  const AlertaScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              ListCardWidget(),
              ListCardWidget(),
              ListCardWidget(),
            ],
          ),
        ),
      )
    );
  }
}