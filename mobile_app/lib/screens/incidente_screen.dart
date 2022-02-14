import 'package:flutter/material.dart';

class IncidenteScreen extends StatelessWidget {
   
  //const IncidenteScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safety Rain')
      ),
      body: Center(
         child: Text('IncidenteScreen'),
      ),
    );
  }
}