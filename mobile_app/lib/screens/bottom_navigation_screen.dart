import 'package:flutter/material.dart';
import 'package:mobile_app/screens/screens.dart';
import 'package:mobile_app/themes/app_theme.dart';
import 'package:mobile_app/widgets/widgets.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({ Key? key }) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [ HomeScreen(),QuebradaScreen(),IncidenteScreen() ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Safety Rain'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppTheme.primaryGradient,AppTheme.primary]
            )
          ),
        ),
      ),
      drawer: SideMenu(),
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
            icon: Icon(Icons.water_drop),
            label: 'Quebrada'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_rounded),
            label: 'Reporte'
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