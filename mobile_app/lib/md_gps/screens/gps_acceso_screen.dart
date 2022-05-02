import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/exports/blocs.dart';

class GpsAccesoScreen extends StatelessWidget {
  const GpsAccesoScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<GpsBloc, GpsState>(
          builder: (context, state){
            return !state.isGpsEnabled
              ? const _HabilitarMensajeGps()
              : const _BotonAcceso();
          },
        ),
      ),
    );
  }
}

class _BotonAcceso extends StatefulWidget {
  const _BotonAcceso({ Key? key }) : super(key: key);

  @override
  State<_BotonAcceso> createState() => _BotonAccesoState();
}

class _BotonAccesoState extends State<_BotonAcceso> {

  String location = '0.0';


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Es necesario el acceso  a GPS'),
        MaterialButton(
          child: const Text('Solicitar acceso'),
          onPressed: () async {
            final gpsBloc = BlocProvider.of<GpsBloc>(context);
            gpsBloc.askGpsAcces();
            if (gpsBloc.state.isAllgranted){
              List<double> location = await gpsBloc.getCurrentLocation();
              setState(() { });
            }
          },
        ),
        Visibility(
          visible: BlocProvider.of<GpsBloc>(context).state.isAllgranted,
          child: Text(location)
        )
      ],
    );
  }
}

class _HabilitarMensajeGps extends StatelessWidget {
  const _HabilitarMensajeGps({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Debe habilitar el GPS')
    );
  }
}