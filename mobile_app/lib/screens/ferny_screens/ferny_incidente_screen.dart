import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_app/controllers/incidente_controller.dart';
import 'package:mobile_app/screens/screens.dart';
import 'package:location/location.dart';

import '../../themes/app_theme.dart';

import 'package:image_picker/image_picker.dart';

class ReporteScreen extends StatefulWidget {
  @override
  IncidenteState createState() => IncidenteState();
}

class IncidenteState extends State<ReporteScreen> {
  String _lng = 'longitud';
  String _ltd = 'latitud';

  final controller = IncidenteController();

  @override
  void initState() {
    super.initState();
    controller.lista_categoria.insert(0, 'Seleccione');
    controller.lista_motivo.insert(0, 'Seleccione');
  }

  var location = Location();

  late LocationData userLocation;

  Future<LocationData?> _getLocation() async {
    LocationData? currentLocation;
    try {
      currentLocation = await location.getLocation();
      print(currentLocation.latitude.toString() +
          " " +
          currentLocation.longitude.toString());
      ActualizarPosicion(currentLocation.longitude.toString(),
          currentLocation.latitude.toString());
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  void mostrarCuadro() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text(
                'En el mapa puede colocar un marcador para obtener la ubicación del lugar donde ocurre el incidente'),
            actions: [
              TextButton(
                  onPressed: () {
                    sacarCuadro();
                  },
                  child: Text('Cerrar')),
              TextButton(
                onPressed: () {
                  sacarCuadro();
                  moveToMapaScreen();
                },
                child: Text('Ok'),
              )
            ],
          );
        });
  }

  void sacarCuadro() {
    Navigator.pop(context);
  }

  void ActualizarPosicion(String longitud, String latitud) {
    setState(
      () {
        _lng = longitud;
        _ltd = latitud;
      },
    );
  }

  void moveToMapaScreen() async {
    LatLng ubicacion = await Navigator.push(
      context,
      CupertinoPageRoute(
          fullscreenDialog: true, builder: (context) => MapaScreen()),
    );
    ActualizarPosicion(
        ubicacion.longitude.toString(), ubicacion.latitude.toString());
  }

  Uint8List imagenUtf8 = Uint8List(500); // averiguar el tamaño del 500
  String ferny_img = '';
  bool ver_imagen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: const Text('REPORTAR UN INCIDENTE',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: const Text('Seleccione una Categoria: ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 45,
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: DropdownButton(
                value: controller.temp_cate,
                onChanged: (String? newValue) {
                  setState(() {
                    controller.temp_cate = newValue!;
                  });
                },
                items: controller.lista_categoria.map((val) {
                  return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold)));
                }).toList(),
                isExpanded: true,
                elevation: 1,
                underline: Container(
                  height: 2,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: const Text('Seleccione un Motivo: ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 45,
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: DropdownButton(
                value: controller.temp_moti,
                onChanged: (String? newValue) {
                  setState(() {
                    controller.temp_moti = newValue!;
                  });
                },
                items: controller.lista_motivo.map((val) {
                  return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold)));
                }).toList(),
                isExpanded: true,
                elevation: 1,
                underline: Container(
                  height: 2,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                        width: 200,
                        height: 60,
                        margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: TextFormField(
                            controller: TextEditingController(text: _lng),
                            keyboardType: TextInputType.streetAddress,
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(fontSize: 15),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2.0)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0),
                              ),
                            ))),
                    Container(
                        width: 200,
                        height: 60,
                        margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: TextFormField(
                            controller: TextEditingController(text: _ltd),
                            keyboardType: TextInputType.streetAddress,
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(fontSize: 15),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2.0)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0),
                              ),
                            ))),
                  ],
                ),
                const SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    InkWell(
                      focusColor: Colors.green,
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.blue,
                        size: 50,
                      ),
                      onTap: () {
                        const snackBar = SnackBar(
                          duration: Duration(seconds: 3),
                          content: Text(
                              'Obteniendo Latitud y longitud de su ubicacion'),
                        );

                        _getLocation().then((value) {
                          setState(() {
                            userLocation = value!;
                          });
                        });
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      focusColor: Colors.green,
                      child: const Icon(
                        Icons.map_outlined,
                        color: Colors.black38,
                        size: 50,
                      ),
                      onTap: () {
                        mostrarCuadro();
                      },
                    ),
                  ],
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 5, //Normal textInputField will be displayed
                maxLines: 5, // when user presses enter it will adapt to it
                decoration: const InputDecoration(
                  hintText: 'DESCRIPCION DEL INCIDENTE (Opcional)',
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(color: Colors.black, width: 2.0)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () async {
                final picker = new ImagePicker();
                final XFile? pickedFile = await picker.pickImage(
                  source: ImageSource.camera,
                  imageQuality: 100
                );

                if(pickedFile == null){
                  ver_imagen = false;
                  return;
                }
                
                //final Uint8List imageUint8List = await pickedFile.readAsBytes();
                final String ferny = base64Encode(await pickedFile.readAsBytes());
                print(ferny);
                //print(imageUint8List.length); // conocer el tamaño de una imagen
                ver_imagen = true;

                setState(() {
                  //imagenUtf8 = imageUint8List;
                  ferny_img = ferny;
                });
              },
              icon: Icon(Icons.camera_alt_outlined)
            ),
            Text('ferny_img'),
            Visibility(
              visible: ver_imagen,
              //child: Image.memory(imagenUtf8)
              child: Image.memory(base64Decode(ferny_img))
            ),
            GestureDetector(
              onTap: () {
                print("ola_incidente");
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    color: AppTheme.primary),
                child: const Text("Reportar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                padding: const EdgeInsets.only(top: 10, bottom: 10),
              ),
            ),
          ],
        ));
  }
}
