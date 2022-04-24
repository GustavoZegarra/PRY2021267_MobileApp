import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/exports/services.dart';
import 'package:mobile_app/helpers/dialog_helper.dart';
import 'package:mobile_app/helpers/snackbar_helper.dart';
import 'package:mobile_app/md_usuarios/services/apiperu_service.dart';
import 'package:mobile_app/md_usuarios/services/dni_service.dart';
import 'package:mobile_app/md_usuarios/ui/registerTextFormField_decoration.dart';
import 'package:mobile_app/md_usuarios/ui/textFormField_decoration.dart';
import 'package:mobile_app/md_usuarios/widgets/celular_form_widget.dart';
import 'package:mobile_app/md_usuarios/widgets/dni_form_widget.dart';
import 'package:mobile_app/md_usuarios/widgets/register_form_widget2.dart';
import 'package:mobile_app/md_usuarios/widgets/usuario_form_widget.dart';
import 'package:mobile_app/themes/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController correoController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();
  final TextEditingController fechaController = TextEditingController();
  final TextEditingController codDniController = TextEditingController();
  final TextEditingController dniController = TextEditingController();
  final TextEditingController codCelularController = TextEditingController();
  final TextEditingController celularController = TextEditingController();
  int codVerCelular = 0;
  late TwilioFlutter twilioFlutter;

  int _enviarMensaje(String numero) {
    int codigo = Random().nextInt(89999) + 10000;
    twilioFlutter.sendSMS(
        toNumber: '+51 $numero',
        messageBody: 'SafetySat: Utiliza este número $codigo como código de validación para continuar con tu registro en nuestro sistema.');
    return codigo;
  }

  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'AC6a268689de3dc204cda8509153b59a1c',
        authToken: 'd293c2c519a0637652f7e6fcf5b2af12',
        twilioNumber: '+1 814 481 2299');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    final dniService = Provider.of<DniService>(context);
    final apiPeruService = Provider.of<ApiPeruService>(context);
    return Scaffold(
      appBar: AppTheme.appBarTheme,
      body: SingleChildScrollView(
        child: Column(
          children: [
            UsuarioFormWidget(correoController: correoController,tokenController:tokenController),
            DniFormWidget(fechaController:fechaController,dniController:dniController,codDniController:codDniController),
            TextButton(
              onPressed: (){
                showDialog(
                  context: context, 
                  builder: (_) => const AlertDialog(
                    backgroundColor: Colors.transparent,
                    content: Image(image: AssetImage('assets/consultar-cod-dni.jpg')),
                    //actions: [
                    //  TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Lo tengo!'))
                    //],
                    )
                  );
              },
              child: const Text('¿No sabes cual es tu código?',style: TextStyle(fontSize: 15,color: Colors.black))
            ),
            CelularFormWidget(codCelularController:codCelularController,celularController: celularController,),
            TextButton(
              onPressed: (){
                if(!celularController.selection.isValid){
                  SnackbarHelper.show(context, 'Por favor, ingrese un número de celular válido', Colors.grey);
                  return;
                }
                codVerCelular = _enviarMensaje(celularController.text);
                SnackbarHelper.show(context, 'Te enviamos un código, por favor revisa tus mensajes', Colors.grey);
              },
              child: const Text('Solicitar código',style: TextStyle(fontSize: 15,color: Colors.black))
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  elevation: 0,
                  color: Colors.grey,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 36,vertical: 12),
                    child: const Text('Volver',style: TextStyle(color: Colors.white))
                  ),
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, 'login');
                  }
                ),
                const SizedBox(width: 10),
                MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  elevation: 0,
                  color: Colors.amber,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 36,vertical: 12),
                    child: const Text('Registrar',style: TextStyle(color: Colors.white))
                  ),
                  onPressed: () async {
                    // VALIDAR CAMPOS
                    if (
                         !correoController.selection.isValid
                      || !tokenController.selection.isValid
                      || !fechaController.selection.isValid
                      || !codDniController.selection.isValid
                      || !dniController.selection.isValid
                      || !codCelularController.selection.isValid
                      || !celularController.selection.isValid
                    ){
                      SnackbarHelper.show(context, 'Por favor, valide los campos solicitados', Colors.grey);
                      return;
                    }
                    // VALIDACION DE CORREO
                    DialogHelper.show(context,'Validando correo...');
                    await usuarioService.getCorreo(correoController.text);
                    if(!usuarioService.isCorreoValid){
                      SnackbarHelper.show(context, 'El correo ya existe', Colors.grey);
                      DialogHelper.close(context);
                      return;
                    }
                    DialogHelper.close(context);
                    
                    // VALIDACIÓN DE DNI
                    DialogHelper.show(context,'Validando DNI...');
                    await dniService.get(dniController.text);
                    if(!dniService.isDniValid){
                      SnackbarHelper.show(context, 'El DNI ya existe', Colors.grey);
                      DialogHelper.close(context);
                      return;
                    }
                    await apiPeruService.get(int.parse(codDniController.text),dniController.text);
                    if(!apiPeruService.isValidDNI){
                      SnackbarHelper.show(context, 'El DNI no existe', Colors.grey);
                      DialogHelper.close(context);
                      return;
                    }
                    DialogHelper.close(context);
                    // VALIDACION DE NUMERO
                    //if (int.parse(codCelularController.text) != codVerCelular){
                    //  SnackbarHelper.show(context, 'El código de verificación no es válido', Colors.grey);
                    //  DialogHelper.close(context);
                    //  return;
                    //}
                    // POST
                    DialogHelper.show(context,'Registrando datos...');
                    await dniService.create(
                      dniController.text,
                      int.parse(codDniController.text),
                      apiPeruService.apiPeru.direccion,
                      'Cerca de mi casa',
                      3
                     );
                    await usuarioService.register(
                      apiPeruService.apiPeru.nombreCompleto,
                      correoController.text,
                      tokenController.text,
                      celularController.text,
                      DateFormat("dd/MM/yyyy").parseStrict(fechaController.text).toIso8601String(),
                      dniService.dni.idDni,
                      null
                    );
                    DialogHelper.close(context);
                    Navigator.pushReplacementNamed(context, 'bottomNavigationBar');
                  }
                ),
              ],
            ),
            const SizedBox(height: 20)
          ],
        ),
      )
    );
  }
}
