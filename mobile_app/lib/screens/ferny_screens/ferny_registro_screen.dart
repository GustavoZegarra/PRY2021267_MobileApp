import 'package:flutter/material.dart';
import 'package:mobile_app/themes/app_theme.dart';
import 'package:email_validator/email_validator.dart';

class RegistroScreen extends StatelessWidget {
  //const UsuarioScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> keyForm = GlobalKey();
  TextEditingController nameCtrl = new TextEditingController();
  TextEditingController apellCtrl = new TextEditingController();
  TextEditingController dniCtrl = new TextEditingController();
  TextEditingController emailCtrl = new TextEditingController();
  TextEditingController direccionCtrl = new TextEditingController();
  TextEditingController mobileCtrl = new TextEditingController();
  TextEditingController passwordCtrl = new TextEditingController();
  TextEditingController repeatPassCtrl = new TextEditingController();

  String? validaNombre(String? value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "El nombre es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "El nombre debe de ser a-z y A-Z";
    }
    return null;
  }

  String? validaCorreo(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value!.isEmpty) {
      return "El correo es necesario";
    } else if (!EmailValidator.validate(value)) {
      return "Correo invalido";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Safety Rain'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: const Text('REGISTRO',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Form(
                  key: keyForm,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameCtrl,
                        maxLength: 50,
                        validator: validaNombre,
                        decoration: const InputDecoration(
                            labelText: 'Nombres',
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(0),
                              child: Icon(Icons.person),
                            )),
                      ),
                      TextFormField(
                        controller: apellCtrl,
                        maxLength: 50,
                        decoration: const InputDecoration(
                            labelText: 'Apellidos',
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(0),
                              child: Icon(Icons.person),
                            )),
                      ),
                      TextFormField(
                        controller: emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        maxLength: 40,
                        validator: validaCorreo,
                        decoration: const InputDecoration(
                            labelText: 'Correo',
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(0),
                              child: Icon(Icons.email),
                            )),
                      ),
                      TextFormField(
                        controller: dniCtrl,
                        maxLength: 8,
                        decoration: const InputDecoration(
                            labelText: 'DNI',
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(0),
                              child: Icon(Icons.credit_card),
                            )),
                      ),
                      TextFormField(
                        controller: mobileCtrl,
                        maxLength: 9,
                        decoration: const InputDecoration(
                            labelText: 'Celular',
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(0),
                              child: Icon(Icons.phone_android),
                            )),
                      ),
                      TextFormField(
                        controller: direccionCtrl,
                        keyboardType: TextInputType.streetAddress,
                        decoration: const InputDecoration(
                            labelText: 'Direccion',
                            prefixIcon: Padding(
                                padding: EdgeInsets.all(0),
                                child: Icon(Icons.place))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (keyForm.currentState!.validate()) {
                              print("Exito en formulario por el momento");
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          },
                          child: const Text('Registrarse'),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            primary: AppTheme.primary,
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        )));
  }
}
