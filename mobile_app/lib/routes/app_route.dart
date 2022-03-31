import 'package:flutter/material.dart';
import 'package:mobile_app/screens/screens.dart';

class AppRoute {
  
  static const initialRoute = 'pMensaje';

  static Map<String, Widget Function(BuildContext)> routes = {
          'login'             : (BuildContext context) => const LoginScreen(),
          'register'          : (BuildContext context) => const RegisterScreen(),
          'home'              : (BuildContext context) => HomeScreen(),
          'detail'            : (BuildContext context) => DetailScreen(),
          'tab'               : (BuildContext context) => TabScreen(),
          'requestPermission' : (BuildContext context) => RequestPermissionScreen(),
          'pMensaje'          : (BuildContext context) => PrimerMensajeScreen(),
          'bottom_navigation' : (BuildContext context) => const BottomNavigationScreen(),
          'user'              : (BuildContext context) => const UserScreen(),
          'configuration'     : (BuildContext context) => const ConfigurationScreen()
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }

}