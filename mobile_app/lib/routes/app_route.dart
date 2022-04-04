import 'package:flutter/material.dart';
import 'package:mobile_app/screens/screens.dart';

class AppRoute {
  
  static const initialRoute = 'pMensaje';

  static Map<String, Widget Function(BuildContext)> routes = {
          'pMensaje'          : (BuildContext context) => PrimerMensajeScreen(),
          'requestPermission' : (BuildContext context) => RequestPermissionScreen(),
          'login'             : (BuildContext context) => const LoginScreen(),
          'register'          : (BuildContext context) => const RegisterScreen(),
          'bottom_navigation' : (BuildContext context) => const BottomNavigationScreen(),
          
          'home'              : (BuildContext context) => const HomeScreen(),
          'quebrada'          : (BuildContext context) => QuebradaScreen(),
          'incidente'         : (BuildContext context) => IncidenteScreen(),
          'alerta'            : (BuildContext context) => AlertaScreen(),
          'recomendacion'     : (BuildContext context) => RecomendacionScreen(),

          'reporte'           : (BuildContext context) => ReporteScreen(),

          'usuario'           : (BuildContext context) => ReporteScreen(),
  };
}