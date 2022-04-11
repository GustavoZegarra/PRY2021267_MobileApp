import 'package:flutter/material.dart';
import 'package:mobile_app/screens/screens.dart';

class AppRoute {
  
  static const initialRoute = 'login';

  static Map<String, Widget Function(BuildContext)> routes = {
    'alerta_detalle'      : (_) => const AlertaDetalleScreen(),
    'alerta_list'         : (_) => const AlertaListScreen(),
    'bottomNavigationBar' : (_) => const BottomNavigationScreen(),
    'gps_acceso'          : (_) => const GpsAccesoScreen(),
    'home'                : (_) => HomeScreen(),
    'incidente_list'           : (_) => const IncidenteScreen(),
    'incidenteDetail'     : (_) => const IncidenteDetalleScreen(),
    'login'               : (_) => const InicioSesionScreen(),
    'quebrada_list'            : (_) => const QuebradaListaScreen(),
    'quebradaDetail'      : (_) => const QuebradaDetalleScreen(),
    'reporte'             : (_) => const ReporteScreen(),
  };
}