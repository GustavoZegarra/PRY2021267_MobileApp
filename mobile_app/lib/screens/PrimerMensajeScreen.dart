import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/controllers/PrimerMensajeController.dart';
import 'package:permission_handler/permission_handler.dart';

class PrimerMensajeScreen extends StatefulWidget {
  @override
  PrimerMensajeState createState() => PrimerMensajeState();
}

class PrimerMensajeState extends State<PrimerMensajeScreen> {
  final _controller = PrimerMensajeController(Permission.locationWhenInUse);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _controller.checkPermission();
    });
    _controller.addListener(() {
      if (_controller.routeName != null) {
        Navigator.pushReplacementNamed(context, _controller.routeName!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
