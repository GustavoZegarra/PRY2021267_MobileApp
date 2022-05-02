import 'package:flutter/material.dart';
import 'package:mobile_app/md_incidentes/screens/incidente_nuevos_screen.dart';
import 'package:mobile_app/md_incidentes/screens/incidente_historico_screen.dart';
import 'package:mobile_app/themes/app_theme.dart';

class IncidenteTabScreen extends StatelessWidget {
  const IncidenteTabScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppTheme.appBarTheme,
        body: SafeArea(
          child: Column(
            children: const [
              
              TabBar(
                labelColor: Colors.black,
                tabs: [
                  Tab(text: 'Esta semana'),
                  Tab(text: 'Otros'),
                ]
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    IncidenteBandejaScreen(),
                    IncidenteHistoricoScreen()
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