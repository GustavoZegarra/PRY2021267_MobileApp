import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/exports/models.dart';

class CategoriaService extends ChangeNotifier {

  final String _baseUrl = 'https://safetysat.azurewebsites.net/api/Categorias';
  List<Categoria> categorias = [];
  bool isLoading = true;

  CategoriaService(){
    loadCategorias();
  }

  Future loadCategorias() async {
    isLoading = true;
    notifyListeners(); 
    final url = Uri.parse(_baseUrl);
    final resp = await http.get(url,headers: {'Content-Type':'application/json'});
    String body = utf8.decode(resp.bodyBytes);
    final data = jsonDecode(body) as List;
    categorias = data.map((e) => Categoria.fromJson(e)).toList();
    isLoading = false;
    notifyListeners();
  }

}