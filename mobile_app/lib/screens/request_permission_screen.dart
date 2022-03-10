import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_app/controllers/request_permission_controller.dart';
import 'package:mobile_app/screens/home_screen.dart';
import 'package:mobile_app/screens/mapa_screen.dart';
import 'package:mobile_app/screens/screens.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestPermissionScreen extends StatefulWidget {
  @override
  RequestPermissionState createState() => RequestPermissionState();
}

class RequestPermissionState extends State<RequestPermissionScreen> {
  final _controller = RequestPermissionController(Permission.locationWhenInUse);
  late StreamSubscription _subscription;

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Permisos de Ubicacion'),
            content: Text('Necesitaremos permisos para acceder a su ubicacion.'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _controller.request();
                  },
                  child: Text('ok')),
              TextButton(
                onPressed: () {
                  exit(0);
                },
                child: Text('Cancel'),
              )
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    //Escuchando eventros desde este screen
    _subscription = _controller.onStatusChanged.listen(
      (status) {
        //si nos dan acceso a la ubicacion del dispositivo
        if (status == PermissionStatus.granted) {
          Navigator.of(context).pop();
          Navigator.pushReplacementNamed(context, 'tab');
        }
      },
    );
  }

//cuando se elimina del arbol  se usa el dispose ekisde
  @override
  void dispose() {
    _subscription.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showAlert(context));
      return Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
