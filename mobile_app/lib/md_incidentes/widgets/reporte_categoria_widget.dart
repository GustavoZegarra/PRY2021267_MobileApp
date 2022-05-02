import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/md_incidentes/blocs/categoria_blocs/categoria_bloc.dart';
import 'package:mobile_app/md_incidentes/services/categoria_service.dart';
import 'package:mobile_app/md_incidentes/ui/dropdownButtonFormField.dart';
import 'package:provider/provider.dart';

class ReporteCategoriaWidget extends StatefulWidget {
  const ReporteCategoriaWidget({Key? key}) : super(key: key);

  @override
  State<ReporteCategoriaWidget> createState() => _ReporteCategoriaWidgetState();
}

class _ReporteCategoriaWidgetState extends State<ReporteCategoriaWidget> {
  @override
  Widget build(BuildContext context) {
    final categoriaBloc = BlocProvider.of<CategoriaBloc>(context);
    return BlocBuilder<CategoriaBloc, CategoriaState>(
      builder: (context, categoriaState) {
        return DropdownButtonFormField(
          decoration: ReporteDropdownButtonFormFieldDecoration.decoration(
            label: 'Categoría'
          ),
          value: categoriaState.categorias.first.detalle,
          items: categoriaState.categorias
              .map((e) => DropdownMenuItem(
                    value: e.detalle,
                    child: Text(e.detalle),
                    alignment: AlignmentDirectional.center,
                  ))
              .toList(),
          onChanged: (value) => {
            setState(
              () {
                categoriaBloc.add(SetIdCategoriaEvent(categoriaState.categorias
                    .where((element) => element.detalle == value)
                    .first
                    .idCategoria));
                categoriaBloc.add(SetIsCategoriaSelectedEvent(true));
              },
            )
          },
          onTap: () => categoriaBloc.add(SetIsCategoriaSelectedEvent(false)),
        );
      },
    );
  }
}
