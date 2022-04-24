import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/exports/screens.dart';
import 'package:mobile_app/exports/services.dart';
import 'package:mobile_app/md_gps/blocs/gps_bloc.dart';
import 'package:mobile_app/md_incidentes/ui/dropdownButtonFormField.dart';
import 'package:mobile_app/themes/app_theme.dart';
import 'package:provider/provider.dart';

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
    if(Provider.of<CategoriaService>(context).isLoading || Provider.of<MotivoService>(context).isLoading) return LoadingScreen(mensaje: 'Actualizando datos, por favor espere.');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: DropdownButtonFormField(
                      decoration: ReporteDropdownButtonFormFieldDecoration.decoration(
                        label: 'Categoría'
                      ),
                      hint: Text(categoria),
                      items: categorias.map((e) => DropdownMenuItem(value: e,child: Text(e),alignment: AlignmentDirectional.center,)).toList(),
                      onChanged: (value) => {
                        setState(() {
                          categoria = value.toString();
                        },)
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: DropdownButtonFormField(
                      hint: Text(motivo),
                      icon: const Icon(Icons.arrow_drop_down),
                      decoration: ReporteDropdownButtonFormFieldDecoration.decoration(
                        label: 'Motivos'
                      ),
                      items: motivos.map((e) => DropdownMenuItem(value: e,child: Text(e))).toList(),
                      onChanged: (value) => {
                        setState(() {
                          motivo = value.toString();
                        },)
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: DropdownButtonFormField(
                      hint: Text(quebrada),
                      icon: const Icon(Icons.arrow_drop_down),
                      decoration: ReporteDropdownButtonFormFieldDecoration.decoration(
                        label: 'Quebradas'
                      ),
                      items: quebradas.map((e) => DropdownMenuItem(value: e,child: Text(e))).toList(),
                      onChanged: (value) => {
                        setState(() {
                          quebrada = value.toString();
                        },)
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        hintText: 'Ingrese algun detalle adicional',
                        hintStyle: TextStyle(
                          color: Colors.grey
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))
                        )
                      ),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(
                        color: Colors.white,
                        width: 1,
                      )
                    ),
                    elevation: 0,
                    color: Colors.amber,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                      child: const Text('Registrar incidente',style: TextStyle(color: Colors.black))
                    ),
                    //onPressed: () => usuarioService.login(context,_correoController.text,_tokenController.text)
                    onPressed: () => Navigator.pushReplacementNamed(context, 'bottomNavigationBar')
                  ),
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}