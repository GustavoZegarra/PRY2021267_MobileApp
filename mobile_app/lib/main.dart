import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mobile_app/routes/app_route.dart';
import 'package:mobile_app/screens/screens.dart';
import 'package:mobile_app/themes/app_theme.dart';

//para correr un api que no esta en la nube
//class MyHttpOverrides extends HttpOverrides {
//  @override
//  HttpClient createHttpClient(SecurityContext? context) {
//    return super.createHttpClient(context)
//      ..badCertificateCallback =
//          (X509Certificate cert, String host, int port) => true;
//  }
//}

void main() {
  //HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _pages = [ HomeScreen(),QuebradaScreen(),IncidenteScreen() ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoute.initialRoute,
        routes: AppRoute.routes,
        theme: AppTheme.lightTheme,
    );
  }
}