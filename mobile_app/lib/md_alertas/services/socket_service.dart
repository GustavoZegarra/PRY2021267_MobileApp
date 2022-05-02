import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/exports/models.dart';
import 'package:mobile_app/helpers/dialog_helper.dart';
import 'package:mobile_app/md_usuarios/models/apiperu_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket;

class SocketService extends ChangeNotifier {

  final client = socket.io('https://safetysat-socket.herokuapp.com/');

  SocketService(){
    load();
  }

  load(){
    client.onConnect((_) => print('conectado'));
  }

}