import 'package:flutter/material.dart';
import 'package:mobile_app/models/quebrada_model.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'dart:convert';

import 'package:path/path.dart';

class HomeScreen extends StatelessWidget {
  //const HomeScreen({Key? key}) : super(key: key);
  late List<Quebrada> Quebradas;
  String quebradas =
      '[{"nombre": "Quirio", "precipitacion": 5.69698}, {"nombre": "Pedregal ", "precipitacion": 6.3562}, {"nombre": "Rayo de Sol", "precipitacion": 4.2698}]';

  HomeScreen() {
    List ListaJson = jsonDecode(quebradas) as List;
    Quebradas = ListaJson.map((e) => Quebrada.fromJson(e)).toList();
    print(Quebradas[0].nombre + " " + Quebradas[0].precipitacion.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safety Rain'),
        actions: [
            PopupMenuButton(
               icon: Icon(Icons.account_circle_outlined,color: Colors.white),
               itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                 const PopupMenuItem(
                   child: ListTile(
                     leading: Icon(Icons.login_rounded),
                     title: Text('Iniciar Sesion'),
                   ),
                 ),
                 const PopupMenuItem(
                   child: ListTile(
                     leading: Icon(Icons.app_registration_sharp),
                     title: Text('Registrarse'),
                   ),
                 ),
               ],
             ),
        ],
      ),
      
      body: Column(
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
                    child: Text("Quebrada: "+Quebradas[0].nombre),
                  ),
                  Container(
                    child: Text("Precipitacion: "+Quebradas[0].precipitacion.toString()),
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
                    child: Text("Quebrada: "+Quebradas[1].nombre),
                  ),
                  Container(
                    child: Text("Precipitacion: "+Quebradas[1].precipitacion.toString()),
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
                    child: Text("Quebrada: "+Quebradas[0].nombre),
                  ),
                  Container(
                    child: Text("Precipitacion: "+Quebradas[0].precipitacion.toString()),
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
                    child: Text("Quebrada: "+Quebradas[2].nombre),
                  ),
                  Container(
                    child: Text("Precipitacion: "+Quebradas[2].precipitacion.toString()),
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
