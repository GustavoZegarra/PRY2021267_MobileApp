import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/helpers/methos.dart';
import 'package:mobile_app/helpers/snackbar_helper.dart';
import 'package:mobile_app/md_usuarios/ui/registerTextFormField_decoration.dart';
import 'package:mobile_app/themes/app_theme.dart';

class DniFormWidget extends StatelessWidget {
  DniFormWidget({ 
    Key? key,
    required this.fechaController,
    required this.dniController,
    required this.codDniController
  }) : super(key: key);

  TextEditingController fechaController = TextEditingController();
  TextEditingController dniController = TextEditingController();
  TextEditingController codDniController = TextEditingController();

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
              title: Text('DNI'),
              subtitle: Text('Registra los datos según tu documento nacional de identidad'),
            ),
          ),
          // FECHA NACIMIENTO
          SizedBox(
            width: MediaQuery.of(context).size.width*0.8,
            child: TextFormField(
                controller: fechaController,
                maxLines: 1,
                keyboardType: TextInputType.text,
                decoration: RegisterTextFormFieldDecoration.decoration(
                  label: 'Fecha de nacimiento',
                  prefixIcon: Icons.date_range
                ),
                validator: (value) => (value != null && Methods.isDateTime(value) && Methods.isYearReal(DateFormat("dd/MM/yyyy").parseStrict(value).year)) ? null : 'Ingrese una fecha válida dd/mm/yyyy',
            ),
          ),
          const SizedBox(height: 10),
          // DNI
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.3,
                child: TextFormField(
                  controller: codDniController,
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    decoration: RegisterTextFormFieldDecoration.decoration(
                      label: 'Cod.',
                      prefixIcon: Icons.lock
                  ),
                  validator: (value) => (value != null && Methods.isInt(value) && value.length == 1) ? null : '',
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.48,
                child: TextFormField(
                  controller: dniController,
                    maxLength: 8,
                    keyboardType: TextInputType.number,
                    decoration: RegisterTextFormFieldDecoration.decoration(
                      label: 'DNI',
                      prefixIcon: Icons.credit_card
                  ),
                  validator: (value) => (value != null && Methods.isInt(value) && int.parse(value) >= 10000000) ? null : 'Ingrese un DNI válido',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}