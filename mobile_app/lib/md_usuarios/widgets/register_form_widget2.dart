import 'package:flutter/material.dart';
import 'package:mobile_app/exports/services.dart';
import 'package:mobile_app/md_usuarios/services/dni_service.dart';
import 'package:mobile_app/md_usuarios/ui/textFormField_decoration.dart';
import 'package:provider/provider.dart';

class RegisterFormWidget2 extends StatefulWidget {

  @override
  State<RegisterFormWidget2> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget2> {

  late TextEditingController _nombreController;
  late TextEditingController _apellidoController;
  late TextEditingController _codVerificacionController;
  late TextEditingController _dniController;
  late TextEditingController _celularController;
  late TextEditingController _correoController;
  late TextEditingController _tokenController;
  late TextEditingController _direccionController;
  late TextEditingController _referenciaController;

  @override
  void initState() {
    _nombreController= TextEditingController();
    _apellidoController = TextEditingController();
    _codVerificacionController = TextEditingController();
    _dniController = TextEditingController();
    _celularController = TextEditingController();
    _correoController = TextEditingController();
    _tokenController = TextEditingController();
    _direccionController = TextEditingController();
    _referenciaController = TextEditingController();
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    final dniService = Provider.of<DniService>(context);
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          // _nombreController
          TextFormField(
            controller: _nombreController,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: TextFormFieldDecoration.decoration(
              hintText: '',
              labelText: 'Nombre',
              prefixIcon: Icons.person
            )
          ),
          // _apellidoController
          TextFormField(
            controller: _apellidoController,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: TextFormFieldDecoration.decoration(
              hintText: '',
              labelText: 'Apellido',
              prefixIcon: Icons.circle
            )
          ),
          // _codVerificacionController
          //TextFormField(
          //  controller: _codVerificacionController,
          //  autocorrect: false,
          //  keyboardType: TextInputType.text,
          //  decoration: TextFormFieldDecoration.decoration(
          //    hintText: '',
          //    labelText: 'Código de Verificación DNI',
          //    prefixIcon: Icons.credit_card
          //  ),
          //  validator: (value){
          //    return (value != null) ? null : 'Ingrese un código de verificación de DNI válido';
          //  },
          //),
          // _dniController
          TextFormField(
            controller: _dniController,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: TextFormFieldDecoration.decoration(
              hintText: '',
              labelText: 'Número de DNI',
              prefixIcon: Icons.credit_card
            ),
            validator: (value){
              return (value != null && value.length == 8) ? null : 'Ingrese un número de DNI válido 8 dígitos';
            },
          ),
          // _celularController
          TextFormField(
            controller: _celularController,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: TextFormFieldDecoration.decoration(
              hintText: '',
              labelText: 'Celular',
              prefixIcon: Icons.phone_iphone
            ),
            validator: (value){
              return (value != null && value.length == 9) ? null : 'Ingrese un número de celular válido de 9 dígitos';
            },
          ),
          // _correoController
          TextFormField(
            controller: _correoController,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: TextFormFieldDecoration.decoration(
              hintText: '',
              labelText: 'Correo',
              prefixIcon: Icons.email
            ),
          validator: (value){
            String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regExp  = new RegExp(pattern);
            return regExp.hasMatch(value ?? '') ? null : 'Ingrese un correo válido';
          },
          ),
          // _tokenController
          TextFormField(
                  controller: _tokenController,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  decoration: TextFormFieldDecoration.decoration(
                    hintText: '******',
                    labelText: 'Contraseña',
                    prefixIcon: Icons.lock_outline
                  ),
                  validator: (value){
                    return (value != null && value.length >= 6) ? null : 'La contraseña requiere más de 5 caracteres';
                  },
                ),
          // _direccionController
          TextFormField(
            controller: _direccionController,
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: TextFormFieldDecoration.decoration(
              hintText: '',
              labelText: 'Dirección',
              prefixIcon: Icons.place
            ),
            validator: (value){
              return (value != null) ? null : 'El campo es requerido';
            },
          ),
          // _referenciaController
          //TextFormField(
          //  controller: _referenciaController,
          //  autocorrect: false,
          //  obscureText: true,
          //  keyboardType: TextInputType.text,
          //  decoration: TextFormFieldDecoration.decoration(
          //    hintText: '',
          //    labelText: 'Referencia',
          //    prefixIcon: Icons.place
          //  ),
          //  validator: (value){
          //    return (value != null) ? null : 'El campo es requerido';
          //  },
          //),
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
            onPressed: () {
            },
          )
        ],
      ),
    );
  }
}