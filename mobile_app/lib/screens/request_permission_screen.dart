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

  @override
  void initState() {
    super.initState();
    //Escuchando eventros desde este screen
    _subscription = _controller.onStatusChanged.listen(
      (status) {
        //si nos dan acceso a la ubicacion del dispositivo
        if (status == PermissionStatus.granted) {
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
    return Scaffold(
        appBar: AppBar(title: const Text('Safety Rain')),
        body: Center(
            child: Container(
                margin: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                height: 160,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45, width: 8.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: const Text(
                          'Permita que Safety Rain acceda a la ubicacion del dispositivo. Presione "OK" para continuar.',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            child: Text("OK"),
                            onPressed: () {
                              _controller.request();
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            child: Text("Cancelar"),
                            onPressed: () {
                              exit(0);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ))));
  }
}
