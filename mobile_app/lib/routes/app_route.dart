import 'package:flutter/material.dart';
import 'package:mobile_app/md_incidentes/screens/incidente_nuevos_screen.dart';
import 'package:mobile_app/md_incidentes/screens/inciente_tab_screen.dart';
import 'package:mobile_app/screens/screens.dart';

class AppRoute {
  
  static const initialRoute = 'login';

  static Map<String, Widget Function(BuildContext)> routes = {
    'alerta_detalle'        : (_) => const AlertaDetalleScreen(),
    'alerta_list'           : (_) => const AlertaListScreen(),
    'bottomNavigationBar'   : (_) => const BottomNavigationScreen(),
    'gps_acceso'            : (_) => const GpsAccesoScreen(),
    'home'                  : (_) => const HomeScreen(),
    'incidenteDetail'       : (_) => const IncidenteDetalleScreen(),
    'login'                 : (_) => InicioSesionScreen(),
    'quebrada_list'         : (_) => const QuebradaListScreen(),
    'quebrada_detail'       : (_) => const QuebradaDetailScreen(),
    'reporte'               : (_) => const ReporteScreen(),
    'recomendacion_list'    : (_) => const RecomendacionListScreen(),
    'register'              : (_) => RegisterScreen(),
    'usuario_detail'              : (_) => const UsuarioDetailScreen(),
    'incidente_tab'              : (_) => const IncidenteTabScreen(),
    'incidente_list'              : (_) => const IncidenteBandejaScreen(),
    'incidente_detail'              : (_) => const IncidenteDetalleScreen()
  };
}