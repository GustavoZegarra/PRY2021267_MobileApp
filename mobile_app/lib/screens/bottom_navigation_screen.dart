import 'package:flutter/material.dart';
import 'package:mobile_app/screens/screens.dart';
import 'package:mobile_app/themes/app_theme.dart';

class BottomNavigationScreen extends StatefulWidget {

  const BottomNavigationScreen({ Key? key }) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationState();
  
}

class _BottomNavigationState extends State<BottomNavigationScreen> {
  
  int _index = 0;
  final List<Widget> _pages = [ const HomeScreen(),const ReporteScreen(), const UsuarioDetailScreen() ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppTheme.appBarTheme,
      
      body: _pages[_index],
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        showUnselectedLabels: false,
        selectedItemColor: AppTheme.primaryColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'SAT'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_rounded),label: 'Reportar' ),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Mi cuenta')
        ],
        onTap: (index){setState(() {_index = index;});},
      ),

    );
  }
}