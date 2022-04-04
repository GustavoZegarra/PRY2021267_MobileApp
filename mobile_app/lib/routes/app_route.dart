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
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }

}