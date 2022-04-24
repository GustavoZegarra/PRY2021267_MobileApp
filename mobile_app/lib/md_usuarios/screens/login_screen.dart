import 'package:flutter/material.dart';
import 'package:mobile_app/md_usuarios/widgets/login_form_widget.dart';
import 'package:mobile_app/md_usuarios/widgets/login_header_widget.dart';

class InicioSesionScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LoginHeaderWidget(),
            LoginFormWidget()
          ],
        ),
      )
    );
  }
}