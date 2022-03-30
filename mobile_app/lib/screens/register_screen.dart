import 'package:flutter/material.dart';
import 'package:mobile_app/ui/auth_input_decorations.dart';
import 'package:mobile_app/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
   
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.1),
            SizedBox(height: 30),
            Text('Crear cuenta',style: TextStyle(fontSize: 40)),
            SizedBox(height: 30),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),child: _RegisterForm()),
            SizedBox(height: 20),
            TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.blueAccent)
              ), 
              child: Text('¿Ya tienes una cuenta?',style: TextStyle(fontSize: 15))
            )
          ],
        ),
      )
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: AuthInputDecorations.authInputDecoration(
                hintText: '',
                labelText: 'Nombres',
                prefixIcon: Icons.person
              )
            ),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: AuthInputDecorations.authInputDecoration(
                hintText: '',
                labelText: 'Apellidos',
                prefixIcon: Icons.person
              )
            ),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: AuthInputDecorations.authInputDecoration(
                hintText: '',
                labelText: 'DNI',
                prefixIcon: Icons.credit_card
              ),
              validator: (value){
                return (value != null && value.length == 8) ? null : 'El campo DNI requiere 8 dígitos';
              },
            ),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: AuthInputDecorations.authInputDecoration(
                hintText: '',
                labelText: 'Celular',
                prefixIcon: Icons.phone_iphone
              ),
              validator: (value){
                return (value != null && value.length == 9) ? null : 'El campo Celular requiere 9 dígitos';
              },
            ),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: AuthInputDecorations.authInputDecoration(
                hintText: '',
                labelText: 'Correo',
                prefixIcon: Icons.email
              ),
              validator: (value){
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);
                return regExp.hasMatch(value ?? '') ? null : 'El campo ingresado no sigue el formato de correo';
              },
            ),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: AuthInputDecorations.authInputDecoration(
                hintText: '',
                labelText: 'Dirección',
                prefixIcon: Icons.place
              ),
              validator: (value){
                return (value != null && value.length > 5) ? null : 'El campo debe ser mayor a 5 caracteres';
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
              onPressed: (){}
            )
          ],
        ),
      ),
    );
  }
}