import 'package:flutter/material.dart';
import 'package:mobile_app/themes/app_theme.dart';
import 'package:mobile_app/ui/textFormField_decoration.dart';


class InicioSesionScreen extends StatelessWidget {
   
  const InicioSesionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SafeArea(child: _HeaderWidget()),
            Padding(padding: EdgeInsets.symmetric(vertical: 30),child: _TitleWidget(),),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),child: _LoginFormWidget()),
            SizedBox(height: 20),
          ],
        ),
      )
    );
  }
}

// ============================== _HeaderWidget

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: AppTheme.primaryColor,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.all(50),
            child: const Icon(Icons.water_drop, color: Colors.white, size: 100),
          ),
        ],
      ),
    );
  }
}

// ============================== _TitleWidget

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('Safety Rain', style: TextStyle(fontSize: 50,fontWeight: FontWeight.w500,letterSpacing: 2)),
        SizedBox(height: 10),
        Text('Sistema de alerta temprana para lluvias')
      ],
    );
  }
}

// ============================== _LoginWidget

class _LoginFormWidget extends StatelessWidget {
  const _LoginFormWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: TextFormFieldDecoration.decoration(
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
            decoration: TextFormFieldDecoration.decoration(
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
            color: AppTheme.primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 12),
              child: const Text('Ingresar',style: TextStyle(color: Colors.white))
            ),
            onPressed: () => Navigator.pushReplacementNamed(context, 'bottomNavigationBar')
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            elevation: 0,
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 12),
              child: const Text('¿No tienes una cuenta?',style: TextStyle(color: Colors.black))
            ),
            onPressed: () => Navigator.pushReplacementNamed(context, 'register'),
          )
        ],
      ),
    );
  }
}