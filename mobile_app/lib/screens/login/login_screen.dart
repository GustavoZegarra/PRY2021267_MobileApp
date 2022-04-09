import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile_app/ui/auth_input_decorations.dart';
import 'package:mobile_app/widgets/widgets.dart';

import '../../themes/app_theme.dart';

class LoginScreen extends StatelessWidget {
   
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: size.height * 0.3,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.blue,AppTheme.primary])),
                  ),
                  SafeArea(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      margin: const EdgeInsets.all(50),
                      child: const Icon(Icons.water_drop, color: Colors.white, size: 100),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: const [
                  Text('Safety Rain', style: TextStyle(fontSize: 50,fontWeight: FontWeight.w500,letterSpacing: 2)),
                  SizedBox(height: 10),
                  Text('Sistema de Alerta Temprana')
                ],
              )
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),child: _LoginForm()),
            SizedBox(height: 20),
          ],
        ),
      )
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: AuthInputDecorations.authInputDecoration(
                hintText: 'example@gmail.com',
                labelText: 'Correo',
                prefixIcon: Icons.alternate_email
              ),
              validator: (value){
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);
                return regExp.hasMatch(value ?? '') ? null : 'El campo ingresado no sigue el formato de correo';
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: AuthInputDecorations.authInputDecoration(
                hintText: '******',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline
              ),
              validator: (value){
                return (value != null && value.length >= 6) ? null : 'El campo debe ser mayor o igual a 6 caracteres';
              },
            ),
            const SizedBox(height: 20),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Color.fromARGB(255, 29, 134, 217),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 12),
                child: Text('Ingresar',style: TextStyle(color: Colors.white))
              ),
              onPressed: () => Navigator.pushReplacementNamed(context, 'bottom_navigation')
            ),
            MaterialButton(
              onPressed: () => Navigator.pushReplacementNamed(context, 'register'),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              elevation: 0,
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 12),
                child: const Text('¿No tienes una cuenta?',style: TextStyle(color: Colors.black))
              ),
            )
          ],
        ),
      ),
    );
  }
}