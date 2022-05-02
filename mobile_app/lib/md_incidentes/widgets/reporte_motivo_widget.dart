import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/md_incidentes/blocs/categoria_blocs/categoria_bloc.dart';
import 'package:mobile_app/md_incidentes/blocs/motivo_blocs/motivo_bloc.dart';
import 'package:mobile_app/md_incidentes/models/motivo_model.dart';
import 'package:mobile_app/md_incidentes/ui/dropdownButtonFormField.dart';
import 'package:provider/provider.dart';

class ReporteMotivoWidget extends StatefulWidget {
  const ReporteMotivoWidget({Key? key}) : super(key: key);

  @override
  State<ReporteMotivoWidget> createState() => _ReporteMotivoWidgetState();
}

class _ReporteMotivoWidgetState extends State<ReporteMotivoWidget> {
  @override
  Widget build(BuildContext context) {
    final motivoBloc = Provider.of<MotivoBloc>(context);
    return BlocBuilder<MotivoBloc, MotivoState>(
      builder: (context, motivoState) {
        return BlocBuilder<CategoriaBloc, CategoriaState>(
          builder: (context, stateCategoria) {
            return DropdownButtonFormField(
              value: stateCategoria.isCategoriaSelected
                  ? motivoState.motivos.where((element) => element.idCategoria == stateCategoria.idCategoria).first
                  : motivoState.motivos.first,
              icon: const Icon(Icons.arrow_drop_down),
              decoration: ReporteDropdownButtonFormFieldDecoration.decoration(
                  label: 'Motivo'),
              items: stateCategoria.isCategoriaSelected
                  ? motivoState.motivos
                      .where((element) => element.idCategoria == stateCategoria.idCategoria)
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.detalle),
                          alignment: AlignmentDirectional.center))
                      .toList()
                  : motivoState.motivos
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.detalle),
                          alignment: AlignmentDirectional.center))
                      .toList(),
              onChanged: (Motivo? value) {
                motivoBloc.add(SetMotivoEvent(value??Motivo()));
              },
            );
          },
        );
      },
    );
  }
}
