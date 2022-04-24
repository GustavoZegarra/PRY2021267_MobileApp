import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/exports/models.dart';
import 'package:mobile_app/helpers/dialog_helper.dart';
import 'package:mobile_app/md_usuarios/models/apiperu_model.dart';

class RecomendacionService extends ChangeNotifier {
  final String _baseUrl = 'https://safetysat.azurewebsites.net';
  List<Recomendacion> recomendaciones = [];
  bool isLoading = true;

  RecomendacionService() {
    loadRecomendaciones();
  }

  Future loadRecomendaciones() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(_baseUrl + '/api/recomendaciones');
    final resp =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    String body = utf8.decode(resp.bodyBytes);
    final jsonData = jsonDecode(body) as List;
    recomendaciones = jsonData.map((e) => Recomendacion.fromJson(e)).toList();
    isLoading = false;
    notifyListeners();
  }
}
