import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/md_gps/models/Gps_model.dart';
import 'package:mobile_app/md_incidentes/models/incidente_model.dart';

class IncidenteService extends ChangeNotifier {

 final String _baseUrl = 'https://safetysat.azurewebsites.net/';
  List<Incidente> incidentes = [];
  bool isLoading = true;

  IncidenteService(){
    loadIncidentes();
  }

  Future loadIncidentes() async {
    isLoading = true;
    notifyListeners(); 
    final url = Uri.parse(_baseUrl+'api/Incidentes/GetIncidenteWithUsuario');
    final resp = await http.get(url,headers: {'Content-Type':'application/json'});
    String body = utf8.decode(resp.bodyBytes);
    final data = jsonDecode(body) as List;
    incidentes = data.map((e) => Incidente.fromJson(e)).toList();
    isLoading = false;
    notifyListeners();
  }

  Future register(
    String descripcion, 
    String imagen, 
    int idUsuario,
    int idQuebrada,
    int idMotivo,
    double latitud,
    double longitud
  ) async {

    isLoading = true;
    notifyListeners();

    Gps gps = await registerGPS(latitud,longitud);

    final Map<String,dynamic> data = {
      'descripcion':descripcion,
      'imagen':imagen,
      'fechaRegistro': DateTime.now().toIso8601String(),
      'fechaActualizacion':DateTime.now().toIso8601String(),
      'resuelto':false,
      'idUsuario':idUsuario,
      'usuario':null,
      'idQuebrada':idQuebrada,
      'quebrada':null,
      'idMotivo':idMotivo,
      'motivo':null,
      'idGPS':gps.idGps,
      "gps": null
    };

    final url = Uri.parse(_baseUrl+'api/Incidentes');
    await http.post(url, headers: {'Content-Type':'application/json'}, body: json.encode(data));

    isLoading = false;
    notifyListeners();

  }

  Future registerGPS(
    double latitud,
    double longitud
  ) async{

    final Map<String,dynamic> data = {
      'latitud':latitud,
      'longitud':longitud
    };

    final url = Uri.parse(_baseUrl+'api/GPS');
    final resp = await http.post(url, headers: {'Content-Type':'application/json'}, body: json.encode(data));
    String body = utf8.decode(resp.bodyBytes);
    final gps = Gps.fromJson(jsonDecode(body));
    return gps;
  }

}