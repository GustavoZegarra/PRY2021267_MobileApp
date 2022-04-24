import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/helpers/snackbar_helper.dart';
import 'package:mobile_app/md_usuarios/ui/registerTextFormField_decoration.dart';
import 'package:mobile_app/themes/app_theme.dart';

class UsuarioFormWidget extends StatefulWidget {
  
  TextEditingController correoController;
  TextEditingController tokenController;

  UsuarioFormWidget({ 
    Key? key,
    required this.correoController,
    required this.tokenController
  }) : super(key: key);

  @override
  State<UsuarioFormWidget> createState() => _UsuarioFormWidgetState();
}

class _UsuarioFormWidgetState extends State<UsuarioFormWidget> {
  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          // TITULO
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
            child: ListTile(
              title: Text('Usuario'),
              subtitle: Text('Registra los credenciales necesarios para el acceso al sistema'),
            ),
          ),
          // CORREO
          SizedBox(
            width: MediaQuery.of(context).size.width*0.8,
            child: TextFormField(
              controller: widget.correoController,
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              decoration: RegisterTextFormFieldDecoration.decoration(
                label: 'Correo',
                prefixIcon: Icons.person
              ),
              validator: (value){
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = RegExp(pattern);
                return (value != null && regExp.hasMatch(value)) ? null : 'Ingrese un correo válido';
              },
            ),
          ),
          const SizedBox(height: 10),
          // TOKEN
          SizedBox(
            width: MediaQuery.of(context).size.width*0.8,
            child: TextFormField(
              controller: widget.tokenController,
              obscureText: isHiddenPassword,
              maxLines: 1,
              keyboardType: TextInputType.text,
              decoration: RegisterTextFormFieldDecoration.decoration(
                label: 'Contraseña',
                prefixIcon: Icons.lock,
                suffixIcon: InkWell(
                  onTap: () => setState(() { isHiddenPassword = !isHiddenPassword; }),
                  child: isHiddenPassword 
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
                ),
              ),
              validator: (value){
                return (value != null && value.length >= 5) ? null : 'Es requerido un mínimo de 5 caracteres';
              },
            ),
          ),
        ],
      ),
    );
  }
}