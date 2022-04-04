import 'package:flutter/material.dart';
import 'package:mobile_app/screens/screens.dart';
import 'package:mobile_app/themes/app_theme.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({ Key? key }) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [ HomeScreen(),ReporteScreen(),UsuarioScreen() ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,  
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'SafetyRain',
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,letterSpacing: 1),
            ),
            Text(
              'Visualiza la salud de tu ciudad',
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),
            ),
          ]
        )
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showUnselectedLabels: false,
        selectedItemColor: AppTheme.primary,
        backgroundColor: AppTheme.secondary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Inicio'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_rounded),
            label: 'Reporte'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Cuenta'
          )
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}