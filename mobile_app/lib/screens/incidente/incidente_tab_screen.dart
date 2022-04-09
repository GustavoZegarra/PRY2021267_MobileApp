import 'package:flutter/material.dart';
import 'package:mobile_app/screens/incidente/incidente_screen.dart';

class IncidenteTabScreen extends StatelessWidget {
  
  
  const IncidenteTabScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: const [
              
              TabBar(
                labelColor: Colors.black,
                tabs: [
                  Tab(text: 'Bandeja'),
                  Tab(text: 'Historial'),
                ]
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    IncidenteScreen(),
                    IncidenteScreen()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}