import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/exports/models.dart';
import 'package:mobile_app/helpers/dialog_helper.dart';
import 'package:mobile_app/md_usuarios/models/apiperu_model.dart';

class UsuarioService extends ChangeNotifier {

  final String _baseUrl = 'https://safetysat.azurewebsites.net/';
  Usuario usuario = Usuario(correo: 'empty',token: 'empty');
  bool isLoading = true;
  bool isLoadingLogin = true;
  bool isTokenValid = false;
  // CORREO
  bool isCorreoValid = false;

  UsuarioService();

  Future register(
    String nombre, 
    String correo, 
    String token,
    String celular,
    String? fechaNacimiento,
    int idDni,
    int? idPasaporte
    ) async {

    final Map<String,dynamic> data = {
      'nombre':nombre,
      'correo':correo,
      'token': base64.encode(utf8.encode(token)),
      'celular':celular,
      'fechaNacimiento':fechaNacimiento,
      'idDni':idDni,
      'idPasaporte':idPasaporte,
      'pasaporte': null,
      'incidentes': null
    };

    isLoading = true;
    notifyListeners(); 

    final url = Uri.parse(_baseUrl+'api/usuarios');
    final resp = await http.post(url, headers: {'Content-Type':'application/json'}, body: json.encode(data));
    String body = utf8.decode(resp.bodyBytes);
    final user = Usuario.fromJson(jsonDecode(body));

    isLoading = false;
    notifyListeners();
  }

  Future<Usuario> getUsuarioById(int id) async {
    final url = Uri.parse(_baseUrl+'api/usuarios/'+id.toString());
    final resp = await http.get(url, headers: {'Content-Type':'application/json'});
    String body = utf8.decode(resp.bodyBytes);
    final user = Usuario.fromJson(jsonDecode(body));
    return user;
  }

  Future login (BuildContext context,String correo, String token) async {

    showDialog(
                  context: context, 
                  barrierDismissible: false,
                  builder: (_) => AlertDialog(
                    content: Row(
                      children: const [
                        Text('Validando usuario'),
                        SizedBox(width: 20),
                        CircularProgressIndicator(color: Colors.blue),
                      ],
                    ),
                    
                  )
                );

    isLoadingLogin = true;
    notifyListeners(); 

    final url = Uri.parse(_baseUrl+'api/usuarios/getUsuarioByCorreo/'+correo);
    final resp = await http.get(url, headers: {'Content-Type':'application/json'});

    switch (resp.statusCode) {
      case 200:
          String body = utf8.decode(resp.bodyBytes);
          usuario = Usuario.fromJson(jsonDecode(body));
          if (token == String.fromCharCodes(base64Decode(usuario.token))) {
            isTokenValid = true;
            Navigator.of(context).pop();
            Navigator.pushNamed(context, 'bottomNavigationBar');
          } else {
            isTokenValid = false;
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text('La contraseña ingresada no es válida')
              )
            );
          }
        break;
      case 400:
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('El correo ingresado no es válido')
          )
        );
        break;
      default:
    }
    
    isLoadingLogin = false;
    notifyListeners();

  }

  Future getCorreo(String correo) async{

    final url = Uri.parse(_baseUrl+'api/usuarios/getUsuarioByCorreo/'+correo);
    final resp = await http.get(url, headers: {'Content-Type':'application/json'});

     switch (resp.statusCode) {
      case 200:
        isCorreoValid = false;
        break;
      default:
        isCorreoValid = true;
        break;
    }
  }
}