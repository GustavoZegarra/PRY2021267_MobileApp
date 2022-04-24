import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/helpers/methos.dart';
import 'package:mobile_app/helpers/snackbar_helper.dart';
import 'package:mobile_app/md_usuarios/ui/registerTextFormField_decoration.dart';
import 'package:mobile_app/themes/app_theme.dart';

class CelularFormWidget extends StatelessWidget {

  TextEditingController codCelularController = TextEditingController();
  TextEditingController celularController = TextEditingController();

  CelularFormWidget({ 
    Key? key,
    required this.codCelularController,
    required this.celularController
  }) : super(key: key);

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
              title: Text('Celular'),
              subtitle: Text('Registra un celular válido para el correcto envío de tus alertas'),
            ),
          ),
          // CELULAR
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.3,
                child: TextFormField(
                    controller: codCelularController,
                    maxLength: 5,
                    keyboardType: TextInputType.number,
                    decoration: RegisterTextFormFieldDecoration.decoration(
                      label: 'Cod.',
                      prefixIcon: Icons.lock
                  ),
                  validator: (value) => (value != null && Methods.isInt(value) && int.parse(value) >= 10000) ? null : '',
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.48,
                child: TextFormField(
                  controller: celularController,
                    maxLength: 9,
                    keyboardType: TextInputType.number,
                    decoration: RegisterTextFormFieldDecoration.decoration(
                      label: 'Celular',
                      prefixIcon: Icons.phone
                  ),
                  validator: (value) => (value != null && Methods.isInt(value) && int.parse(value) >= 100000000) ? null : 'Ingrese un celular válido',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}