import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/themes/app_theme.dart';
import 'package:mobile_app/widgets/app_card_widget.dart';

import '../blocs/incidente_blocs/incidente_bloc.dart';
import '../widgets/incidente_nuevos_card_widget.dart';

class IncidenteHistoricoScreen extends StatelessWidget {

  const IncidenteHistoricoScreen({ Key? key }) : super(key: key);

  static List<AppCardWidget> usuarios = [
    AppCardWidget(
      title: 'Historicooooooos',
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
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: BlocBuilder<IncidenteBloc, IncidenteState>(
          builder: (context, incidenteState) {
            return Column(
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: incidenteState.incidentes.length,
                    itemBuilder: (_, i) => IncidenteNuevosCardWidget(incidente:incidenteState.incidentes[i])
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}