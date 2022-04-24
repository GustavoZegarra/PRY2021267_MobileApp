import 'package:flutter/material.dart';
import 'package:mobile_app/exports/services.dart';
import 'package:mobile_app/helpers/snackbar_helper.dart';
import 'package:mobile_app/md_usuarios/ui/textFormField_decoration.dart';
import 'package:mobile_app/themes/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class LoginFormWidget extends StatelessWidget {

  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _tokenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            const SizedBox(height: 80),
            TextFormField(
              controller: _correoController,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: TextFormFieldDecoration.decoration(
                hintText: 'example@gmail.com',
                labelText: 'Correo',
                prefixIcon: Icons.alternate_email
              ),
              validator: (value){
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = RegExp(pattern);
                return regExp.hasMatch(value ?? '') ? null : 'Ingrese un correo valido';
              },
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _tokenController,
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: TextFormFieldDecoration.decoration(
                hintText: '******',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline
              ),
              validator: (value){
                return (value != null && value.length >= 5) ? null : 'Es requerido un mínimo de 5 caracteres';
              },
            ),
            const SizedBox(height: 30),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              elevation: 0,
              color: AppTheme.primaryColor,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 12),
                child: const Text('Ingresar',style: TextStyle(color: Colors.white))
              ),
              //onPressed: () => usuarioService.login(context,_correoController.text,_tokenController.text)
              onPressed: () => Navigator.of(context).pushReplacementNamed('bottomNavigationBar')
            ),
            const SizedBox(height: 10),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              elevation: 0,
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 12),
                child: const Text('¿No tienes una cuenta?')
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'register');
              }
            )
          ],
        ),
      ),
    );
  }
}