import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_app/models/quebrada_model.dart';
import 'package:mobile_app/screens/login_screen.dart';
import 'package:mobile_app/screens/registro_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_app/globals/globals.dart' as globals;

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
    //print(Quebradas);
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
    HttpClient httpClient = HttpClient();
    //PARA QUE ESTO FUNCION EN EL ASP NETCORE DEBE ESTAR CORRIENDO DESDE API APPLICATION (PUERTOS 5000 Y 5001) Y NO DESDE ISSL(ACA NO FUNCIONA EN FLUTTER)
    //https://10.0.2.2:5001/api/Alerta
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(
        "https://my-json-server.typicode.com/GustavoZegarra/JSONPlaceholder/posts"));
    //request.headers.add("user-agent", "");
    HttpClientResponse response = await request.close();
    ola = await response.transform(utf8.decoder).join();
    //print(ola);
    httpClient.close();

    String quebradas2 =
        '[{"nombre": "Quirio", "precipitacion": 0.3, "ola":"peluca"}, {"nombre": "Pedregal ", "precipitacion": 6.3562}, {"nombre": "Rayo de Sol", "precipitacion": 4.2698}]';
    List ListaJson2 = jsonDecode(quebradas2) as List;
    Quebradas = ListaJson2.map((e) => Quebrada.fromJson(e)).toList();
    //print(Quebradas);
  }

  @override
  void initState() {
    List ListaJson = jsonDecode(quebradas) as List;
    Quebradas = ListaJson.map((e) => Quebrada.fromJson(e)).toList();
    //print(Quebradas[0].nombre + " " + Quebradas[0].precipitacion.toString());
    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      setState(() {
        RefreshListaQuebradas();
      });
    });
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
            icon:
                const Icon(Icons.account_circle_outlined, color: Colors.white),
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
                globals.idUsuario++;
                print(globals.idUsuario);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              } else if (menu == 2) {
                globals.idUsuario--;
                print(globals.idUsuario);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegistroScreen()));
              }
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
            child: const Text('QUEBRADAS ACTIVAS',
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
                    decoration: const BoxDecoration(
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
                  ),
                  Container(
                    child: Text("26/03/2022 - 10:00 pm"),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: const BoxDecoration(
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
                  ),
                  Container(
                    child: Text("26/03/2022 - 10:00 pm"),
                  )
                ],
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: const BoxDecoration(
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
                  ),
                  Container(
                    child: Text("26/03/2022 - 10:00 pm"),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: const BoxDecoration(
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
                  ),
                  Container(
                    child: Text("26/03/2022 - 10:14 pm"),
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
