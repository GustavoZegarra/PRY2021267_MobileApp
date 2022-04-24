import 'package:flutter/material.dart';
import 'package:mobile_app/themes/app_theme.dart';
import 'package:mobile_app/widgets/app_card_widget.dart';

class IncidenteListScreen extends StatelessWidget {

  const IncidenteListScreen({ Key? key }) : super(key: key);

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