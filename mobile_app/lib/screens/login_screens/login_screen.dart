import 'package:flutter/material.dart';
import 'package:mobile_app/ui/auth_input_decorations.dart';
import 'package:mobile_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
   
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.3),
              SizedBox(height: 50),
              Text('Safety Rain', style: Theme.of(context).textTheme.displaySmall),
              SizedBox(height: 50),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),child: _LoginForm()),
              SizedBox(height: 20),
              //Text('¿No tienes una cuenta?',style: TextStyle(fontSize: 15))
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, 'register'),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.blueAccent)
                ), 
                child: Text('¿No tienes una cuenta?',style: TextStyle(fontSize: 15))
              )
            ],
          ),
        )
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
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
            SizedBox(height: 20),
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
            SizedBox(height: 20),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.blueAccent,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text('Ingresar',style: TextStyle(color: Colors.white))
              ),
              onPressed: () => Navigator.pushReplacementNamed(context, 'bottom_navigation')
            )
          ],
        ),
      ),
    );
  }
}