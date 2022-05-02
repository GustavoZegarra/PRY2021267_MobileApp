import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/md_gps/blocs/gps_bloc.dart';
import 'package:mobile_app/md_incidentes/blocs/incidente_blocs/incidente_bloc.dart';
import 'package:mobile_app/md_incidentes/ui/dropdownButtonFormField.dart';

class ReporteUbicacionWidget extends StatefulWidget {
  const ReporteUbicacionWidget({ Key? key }) : super(key: key);

  @override
  State<ReporteUbicacionWidget> createState() => _ReporteUbicacionWidgetState();
}

class _ReporteUbicacionWidgetState extends State<ReporteUbicacionWidget> {
  bool? isCheckboxQuebradaSelected = false;
  @override
  Widget build(BuildContext context) {
    final gpsBloc = BlocProvider.of<GpsBloc>(context);
    final incidenteBloc = BlocProvider.of<IncidenteBloc>(context);
    return CheckboxListTile(
      title: const Text('Enviar ubicación actual',style: TextStyle(fontSize: 15)),
      secondary: const Icon(Icons.location_on),
      controlAffinity: ListTileControlAffinity.platform,
      value: isCheckboxQuebradaSelected, 
      onChanged: (bool? value) async {
        if(isCheckboxQuebradaSelected == false){
            if (!gpsBloc.state.isGpsEnabled) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Es necesario que habilite su ubicación!'),
              duration: Duration(seconds: 2),
            ));
          } else {
            gpsBloc.askGpsAcces();
            if (gpsBloc.state.isAllgranted) {
              List<double> ubicacion = await gpsBloc.getCurrentLocation();
              incidenteBloc.add(SetUbicacionEvent(ubicacion));
            }
          }
        }
        isCheckboxQuebradaSelected = value;
        setState(() {});
      }
    );
  }
}