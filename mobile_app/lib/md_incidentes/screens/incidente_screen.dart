import 'package:flutter/material.dart';
import 'package:mobile_app/themes/app_theme.dart';
import 'package:mobile_app/widgets/app_card_widget.dart';

class IncidenteScreen extends StatelessWidget {

  const IncidenteScreen({ Key? key }) : super(key: key);

  static List<AppCardWidget> usuarios = [
    AppCardWidget(
      title: 'Frank Gustavo Zegarra Arones',
      route: 'incidenteDetail'
    ),
    AppCardWidget(
      title: 'Fernando Piero Valdiviezo Chumbes',
      route: 'incidenteDetail'
    ),
    AppCardWidget(
      title: 'Christian Fast Sanchez Virto',
      route: 'incidenteDetail'
    ),
    AppCardWidget(
      title: 'Hillary Moscoso Acuña',
      route: 'incidenteDetail',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTheme.appBarThemeSecondary,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            const _FilterWidget(),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: usuarios.length,
              itemBuilder: (_,i) => usuarios[i]
            )
          ],
        ),
      ),
    );
  }
}

class _FilterWidget extends StatelessWidget {
  const _FilterWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 20,right: 20,top:20),
        width: double.infinity,
        color: Colors.white,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: 'Buscar quebrada',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onChanged: (String quebrada){},
        ),
      ),
    );
  }
}