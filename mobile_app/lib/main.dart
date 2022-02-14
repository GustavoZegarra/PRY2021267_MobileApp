import 'package:flutter/material.dart';
import 'package:mobile_app/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistema de Alerta Temprana',
      initialRoute: 'tab',
      routes: {
        'home': (_) => HomeScreen(),
        'detail': (_) => DetailScreen(),
        'tab': (_) => TabScreen(),
      },
      theme: ThemeData.light(),
    );
  }
}