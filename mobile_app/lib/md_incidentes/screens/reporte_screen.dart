import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/md_gps/blocs/gps_bloc.dart';
import 'package:mobile_app/md_incidentes/ui/dropdownButtonFormField.dart';

class ReporteScreen extends StatefulWidget {
  const ReporteScreen({ Key? key }) : super(key: key);

  @override
  State<ReporteScreen> createState() => _ReporteScreenState();
}

class _ReporteScreenState extends State<ReporteScreen> {

  String categoria = 'Seleccione una categoria';
  final categorias = ['Categoria 1','Categoria 2','Categoria 3','Categoria 4'];

  String motivo = 'Seleccione un motivo';
  final motivos = ['Motivo 1','Motivo 2','Motivo 3','Motivo 4'];

  String quebrada = 'Seleccione una quebrada';
  final quebradas = ['Quebrada 1','Quebrada 2','Quebrada 3','Quebrada 4'];

  String location = 'No se ha detectado tu ubicación.';


  // LOCATION
  bool isLocationPicked = false;
  Color iconLocationActive = Colors.amber;

  // CAMARA
  bool isPicturePicked = false;
  Color iconCamaraActive = Colors.amber;
  String pictureBase64Encoded = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            const Text('Reportar incidentes',style: TextStyle(fontSize: 30),),
            Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: DropdownButtonFormField(
                      hint: Text(categoria),
                      items: categorias.map((e) => DropdownMenuItem(value: e,child: Text(e))).toList(),
                      onChanged: (value) => {
                        setState(() {
                          categoria = value.toString();
                        },)
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: DropdownButtonFormField(
                      hint: Text(motivo),
                      icon: const Icon(Icons.arrow_drop_down),
                      //decoration: DropDownButtonFormFieldDecoration.decoration(),
                      items: motivos.map((e) => DropdownMenuItem(value: e,child: Text(e))).toList(),
                      onChanged: (value) => {
                        setState(() {
                          motivo = value.toString();
                        },)
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: DropdownButtonFormField(
                      hint: Text(quebrada),
                      icon: const Icon(Icons.arrow_drop_down),
                      //decoration: DropDownButtonFormFieldDecoration.decoration(),
                      items: quebradas.map((e) => DropdownMenuItem(value: e,child: Text(e))).toList(),
                      onChanged: (value) => {
                        setState(() {
                          quebrada = value.toString();
                        },)
                      },
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.location_on,color: isLocationPicked ? iconLocationActive : Colors.black,size: 30),
                        onPressed: () async {
                          final gpsBloc = BlocProvider.of<GpsBloc>(context);
                          if (!gpsBloc.state.isGpsEnabled) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Es necesario que habilite su ubicación!'),
                                duration: Duration(seconds: 2),
                              )
                            );
                          }
                          else{
                            gpsBloc.askGpsAcces();
                            if (gpsBloc.state.isAllgranted){
                            location = await gpsBloc.getCurrentLocation();
                            isLocationPicked = true;
                            setState((){});
                            }
                          }
                        },
                      ),
                      Text(location)
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.camera_alt,color: isPicturePicked ? iconCamaraActive : Colors.black,size: 30),
                        onPressed: () async {
                          final picker = ImagePicker();
                          final XFile? pickedFile = await picker.pickImage(
                            source: ImageSource.camera,
                            imageQuality: 100
                          );
                          if(pickedFile == null) {
                            isPicturePicked = false;
                            return
                          ;}
                          final String _pictureBase64Encoded = base64Encode(await pickedFile.readAsBytes());
                          setState(() {
                            isPicturePicked = true;
                            pictureBase64Encoded = _pictureBase64Encoded;
                          });
                        }
                      ),
                      Text(isPicturePicked ? 'Se ha detectado una imagen!' : 'No se ha detectado una imagen.'),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      minLines: 3,
                      maxLines: 7,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Ingresa algun detalle de tu reporte',
                        hintStyle: TextStyle(
                          color: Colors.grey
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        )
                      ),
                    ),
                  )
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}