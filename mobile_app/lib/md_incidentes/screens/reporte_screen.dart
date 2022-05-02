import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/exports/blocs.dart';
import 'package:mobile_app/exports/screens.dart';
import 'package:mobile_app/exports/services.dart';
import 'package:mobile_app/md_gps/blocs/gps_bloc.dart';
import 'package:mobile_app/md_incidentes/blocs/incidente_blocs/incidente_bloc.dart';
import 'package:mobile_app/md_incidentes/models/categoria_model.dart';
import 'package:mobile_app/md_incidentes/services/incidente_service.dart';
import 'package:mobile_app/md_incidentes/ui/dropdownButtonFormField.dart';
import 'package:mobile_app/md_incidentes/widgets/reporte_categoria_widget.dart';
import 'package:mobile_app/md_incidentes/widgets/reporte_descripcion_widget.dart';
import 'package:mobile_app/md_incidentes/widgets/reporte_imagen_widget.dart';
import 'package:mobile_app/md_incidentes/widgets/reporte_motivo_widget.dart';
import 'package:mobile_app/md_incidentes/widgets/reporte_quebrada_widget.dart';
import 'package:mobile_app/md_incidentes/widgets/reporte_ubicacion_widget.dart';
import 'package:mobile_app/md_quebradas/models/quebrada_model.dart';
import 'package:mobile_app/themes/app_theme.dart';
import 'package:provider/provider.dart';

import '../blocs/motivo_blocs/motivo_bloc.dart';
import '../models/motivo_model.dart';

class ReporteScreen extends StatefulWidget {
  const ReporteScreen({Key? key}) : super(key: key);

  @override
  State<ReporteScreen> createState() => _ReporteScreenState();
}

class _ReporteScreenState extends State<ReporteScreen> {
  
  final TextEditingController descripcionController = TextEditingController();
  String categoria = 'Seleccione una categoria';
  final categorias = [
    'Categoria 1',
    'Categoria 2',
    'Categoria 3',
    'Categoria 4'
  ];

  String motivo = 'Seleccione un motivo';
  final motivos = ['Motivo 1', 'Motivo 2', 'Motivo 3', 'Motivo 4'];

  String quebrada = 'Seleccione una quebrada';
  final quebradas = ['Quebrada 1', 'Quebrada 2', 'Quebrada 3', 'Quebrada 4'];

  String location = 'No se ha detectado tu ubicación.';

  // LOCATION
  bool isLocationPicked = false;
  Color iconLocationActive = Colors.amber;

  // CAMARA
  bool isPicturePicked = false;
  Color iconCamaraActive = Colors.amber;
  String pictureBase64Encoded = '';

  // CATEGORIA & MOTIVO
  int idCategoria = 0;
  bool isCategoriaSelected = false;
  bool? isCheckboxQuebradaSelected = false;

  @override
  Widget build(BuildContext context) {
    final motivoService = Provider.of<MotivoService>(context);
    final quebradaService = Provider.of<QuebradaService>(context);
    final gpsBloc = BlocProvider.of<GpsBloc>(context);
    final incidenteService = Provider.of<IncidenteService>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 10),
          Form(
            child: Column(
              children: [
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: ReporteCategoriaWidget()),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: ReporteMotivoWidget()),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: ReporteQuebradaWidget()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: ReporteImagenWidget(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: ReporteUbicacionWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: ReporteDescripcionWidget(descripcionController: descripcionController),
                ),
                BlocBuilder<IncidenteBloc, IncidenteState>(
                  builder: (context, incidenteState) {
                    return BlocBuilder<MotivoBloc, MotivoState>(
                                  builder: (context, motivoState) {
                                    return BlocBuilder<QuebradaBloc, QuebradaState>(
                                      builder: (context, quebradaState) {
                                        return MaterialButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                side: const BorderSide(
                                                  color: Colors.white,
                                                  width: 1,
                                                )),
                                            elevation: 0,
                                            color: Colors.blueAccent,
                                            child: Container(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 30, vertical: 15),
                                                child: const Text('Registrar incidente',
                                                    style: TextStyle(color: Colors.white))),
                                            //onPressed: () => usuarioService.login(context,_correoController.text,_tokenController.text)
                                            onPressed: () {
                                              incidenteService.register(
                                                descripcionController.text, 
                                                incidenteState.imagen, 
                                                9, // idUsuario
                                                quebradaState.quebrada.idQuebrada, 
                                                motivoState.motivo.idMotivo,
                                                incidenteState.ubicacion[0], 
                                                incidenteState.ubicacion[1]
                                              );
                                            });
                                      },
                                    );
                                  },
                                );
                  },
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
