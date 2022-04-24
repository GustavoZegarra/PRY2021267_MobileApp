import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/exports/models.dart';
import 'package:mobile_app/helpers/dialog_helper.dart';
import 'package:mobile_app/helpers/snackbar_helper.dart';

class DniService extends ChangeNotifier {

  final String _baseUrl = 'https://safetysat.azurewebsites.net/';
  Dni dni = Dni(idDni: 0,dni: '00000000');
  bool isDniStatusOk = false;
  bool isDniValid = false;

  DniService();

  Future create(String nrodni,int codVerificacion,String direccion,String referencia, int idDistrito) async {

    final Map<String,dynamic> data = {
      'dni':nrodni,
      'codVerificacion':codVerificacion,
      'direccion': direccion,
      'referencia': referencia,
      'idDistrito': idDistrito
    };

    final url = Uri.parse(_baseUrl+'api/DNIs');
    final resp = await http.post(url, headers: {'Content-Type':'application/json'}, body: json.encode(data));
    switch (resp.statusCode) {
      case 201:
        isDniStatusOk = true;
        isDniValid = true;
        String body = utf8.decode(resp.bodyBytes);
        dni = Dni.fromJson(jsonDecode(body));
        return;
    }
    isDniStatusOk = false;
    isDniValid = false;
  }

  Future get(String dni) async{
    final url = Uri.parse(_baseUrl+'api/DNIs/GetDniByNombre/'+dni);
    final resp = await http.get(url, headers: {'Content-Type':'application/json'});
    switch (resp.statusCode) {
      case 200:
        isDniValid = false;
        return;
    }
    isDniValid = true;
    return;
  }

}