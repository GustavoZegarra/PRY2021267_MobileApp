import 'package:flutter/material.dart';
import 'package:mobile_app/screens/PrimerMensajeScreen.dart';
import 'package:mobile_app/screens/request_permission_screen.dart';
import 'package:mobile_app/screens/screens.dart';
import 'package:mobile_app/themes/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistema de Alerta Temprana',
      initialRoute: 'pMensaje',
      routes: {
        'home': (_) => HomeScreen(),
        'detail': (_) => DetailScreen(),
        'tab': (_) => TabScreen(),
        'requestPermission':(_)=>RequestPermissionScreen(),
        'pMensaje':(_)=>PrimerMensajeScreen()
      },
      theme: AppTheme.lightTheme
    );
  }
}