import 'package:flutter/material.dart';
import 'package:mobile_app/globals/globals.dart' as globals;


class LoginScreen extends StatelessWidget {
   
  //const UsuarioScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safety Rain'),
      ),
      body: const Center(
         child: Text('LoginScreen'),
      ),
    );
  }
}