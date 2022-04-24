import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/exports/models.dart';

class QuebradaService extends ChangeNotifier {

  final String _baseUrl = 'https://safetysat.azurewebsites.net';
  List<Quebrada> quebradas = [];
  bool isLoading = true;

  QuebradaService() {
    loadQuebradas();
  }

  Future loadQuebradas() async {
    isLoading = true;
    notifyListeners(); 
    final url = Uri.parse(_baseUrl+'/api/quebradas');
    final resp = await http.get(url,headers: {'Content-Type':'application/json'});
    String body = utf8.decode(resp.bodyBytes);
    final jsonData = jsonDecode(body) as List;
    quebradas = jsonData.map((e) => Quebrada.fromJson(e)).toList();
    isLoading = false;
    notifyListeners();
  }
}