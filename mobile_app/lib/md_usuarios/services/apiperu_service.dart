import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/md_usuarios/models/apiperu_model.dart';

class ApiPeruService extends ChangeNotifier {

  final String _baseUrl = 'https://apiperu.dev/api/dni/';
  ApiPeru apiPeru = ApiPeru();
  bool isValidDNI = false;
  bool isStatusOk = false;

  Future get(int codVerDni, String dni) async {

    Map<String,String> headers = {
      'Content-Type': 'application/json',
      'Authorization' : 'Bearer fd6ecef87b7c987b4c1e3f641f5bc3e0443ad40770ec789fe85051808f8c3841',
    };

    final url = Uri.parse(_baseUrl+dni);
    final resp = await http.get(url, headers: headers);

    switch (resp.statusCode) {
      case 200:
        isStatusOk = true;
        String body = utf8.decode(resp.bodyBytes);
        if (jsonDecode(body)['data']['numero'] == null){
          isValidDNI = false;
          break;
        }
        apiPeru = ApiPeru.fromMap(jsonDecode(body)['data']);
        if(apiPeru.codigoVerificacion == codVerDni && apiPeru.numero == dni){
          isValidDNI = true;
        } else {
          isValidDNI = false;
        }
        break;
      default:
        isStatusOk = false;
        break;
    }
  }

}