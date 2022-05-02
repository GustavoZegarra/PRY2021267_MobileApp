import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/exports/models.dart';

class MotivoService extends ChangeNotifier {

 final String _baseUrl = 'https://safetysat.azurewebsites.net/api/Motivos';
  List<Motivo> motivos = [];
  List<Motivo> motivos2 = [];
  List<Motivo> motivosFiltered = [];
  bool isLoading = true;

  MotivoService(){
    loadMotivos();
  }

  Future loadMotivos() async {
    isLoading = true;
    notifyListeners(); 
    final url = Uri.parse(_baseUrl);
    final resp = await http.get(url,headers: {'Content-Type':'application/json'});
    String body = utf8.decode(resp.bodyBytes);
    final data = jsonDecode(body) as List;
    motivos = data.map((e) => Motivo.fromJson(e)).toList();
    isLoading = false;
    notifyListeners();
  }

  update(int idCategoria){
    motivos2 = [];
    for(int i = 0; i < motivos.length; i++){
      if(motivos[i].idCategoria == idCategoria){
        motivos2.add(motivos[i]);
      }
    }
  }

  filterByIdCategoria(int idCategoria){
    List<Motivo> values = [];
    for(int i = 0; i < motivos.length; i++){
      if(motivos[i].idCategoria == idCategoria){
        values.add(motivos[i]);
      }
    }
    return values;
  }

}