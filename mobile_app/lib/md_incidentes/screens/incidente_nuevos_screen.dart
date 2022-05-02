import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/md_incidentes/blocs/incidente_blocs/incidente_bloc.dart';
import 'package:mobile_app/md_incidentes/services/incidente_service.dart';
import 'package:mobile_app/md_incidentes/widgets/incidente_nuevos_card_widget.dart';
import 'package:mobile_app/screens/loading_screen.dart';
import 'package:mobile_app/themes/app_theme.dart';
import 'package:provider/provider.dart';

class IncidenteBandejaScreen extends StatelessWidget {

  const IncidenteBandejaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final incidentesService = Provider.of<IncidenteService>(context);
    if (incidentesService.isLoading) return LoadingScreen(mensaje: 'incidentes');
    final incidenteBloc = BlocProvider.of<IncidenteBloc>(context);
    incidenteBloc.add(SetIncidentesEvent(incidentesService.incidentes));
    return Scaffold(
      appBar: AppTheme.appBarTheme,
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
                    itemBuilder: (_, i) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                      child: IncidenteNuevosCardWidget(incidente:incidenteState.incidentes[i]),
                    )
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
