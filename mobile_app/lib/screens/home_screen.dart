import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_app/models/quebrada_model.dart';
import 'package:mobile_app/screens/screens.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:path/path.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeScreen> {
  //const HomeScreen({Key? key}) : super(key: key);
  late List<Quebrada> Quebradas;
  Timer? timer;
  String quebradas =
      '[{"nombre": "Quirio", "precipitacion": 5.69698, "ola":"peluca"}, {"nombre": "Pedregal ", "precipitacion": 6.3562}, {"nombre": "Rayo de Sol", "precipitacion": 4.2698}]';

  Future<void> RefreshListaQuebradas() async {
    //  List ListaJson = jsonDecode(quebradas) as List;
    //  List<Quebrada> Quebradas2 =
    //      ListaJson.map((e) => Quebrada.fromJson(e)).toList();
    //  print(Quebradas2[0].nombre + " " + Quebradas2[0].precipitacion.toString());
    //'http://10.0.2.2:32837/api/Alerta'
    //String url = 'http://10.0.2.2:32837/api/Alerta';
    //final response = await http.get(Uri.parse(url));
//
    //if (response.statusCode == 200) {
    //  print(response.body);
    //} else {
    //  print(response.reasonPhrase);
    //}
    String ola = "";
    HttpClient httpClient = new HttpClient();
    //PARA QUE ESTO FUNCION EN EL ASP NETCORE DEBE ESTAR CORRIENDO DESDE API APPLICATION (PUERTOS 5000 Y 5001) Y NO DESDE ISSL(ACA NO FUNCIONA EN FLUTTER)
    //https://10.0.2.2:5001/api/Alerta
    HttpClientRequest request =
        await httpClient.getUrl(Uri.parse("https://my-json-server.typicode.com/GustavoZegarra/JSONPlaceholder/posts"));
    //request.headers.add("user-agent", "");
    HttpClientResponse response = await request.close();
    ola = await response.transform(utf8.decoder).join();
    print(ola);
    httpClient.close();
  }

  @override
  void initState() {
    List ListaJson = jsonDecode(quebradas) as List;
    Quebradas = ListaJson.map((e) => Quebrada.fromJson(e)).toList();
    //print(Quebradas[0].nombre + " " + Quebradas[0].precipitacion.toString());
    timer = Timer.periodic(
        Duration(seconds: 5), (Timer t) => RefreshListaQuebradas());
    super.initState();
    //ScaffoldMessenger.of(this.context).showSnackBar(SnackBar(content: Text("Ayudaaaaaa")));
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safety Rain'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.account_circle_outlined, color: Colors.white),
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: 1,
                child: ListTile(
                  leading: Icon(Icons.login_rounded),
                  title: Text('Iniciar Sesion'),
                ),
              ),
              const PopupMenuItem(
                value: 2,
                child: ListTile(
                  leading: Icon(Icons.app_registration_sharp),
                  title: Text('Registrarse'),
                ),
              ),
            ],
            onSelected: (int menu) {
              if (menu == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UsuarioScreen()));
              } else if (menu == 2) {}
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(15),
            child: Text('QUEBRADAS ACTIVAS',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Quirio.jpg'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    child: Text("Quebrada: " + Quebradas[0].nombre),
                  ),
                  Container(
                    child: Text("Precipitacion: " +
                        Quebradas[0].precipitacion.toString()),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Pedregal.jpg'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    child: Text("Quebrada: " + Quebradas[1].nombre),
                  ),
                  Container(
                    child: Text("Precipitacion: " +
                        Quebradas[1].precipitacion.toString()),
                  )
                ],
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Quirio.jpg'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    child: Text("Quebrada: " + Quebradas[0].nombre),
                  ),
                  Container(
                    child: Text("Precipitacion: " +
                        Quebradas[0].precipitacion.toString()),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Pedregal.jpg'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    child: Text("Quebrada: " + Quebradas[2].nombre),
                  ),
                  Container(
                    child: Text("Precipitacion: " +
                        Quebradas[2].precipitacion.toString()),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
