import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/md_incidentes/ui/dropdownButtonFormField.dart';
import 'package:mobile_app/md_quebradas/blocs/quebrada_bloc.dart';
import 'package:mobile_app/md_quebradas/models/quebrada_model.dart';
import 'package:provider/provider.dart';

class ReporteQuebradaWidget extends StatefulWidget {
  const ReporteQuebradaWidget({Key? key}) : super(key: key);

  @override
  State<ReporteQuebradaWidget> createState() => _ReporteQuebradaWidgetState();
}

class _ReporteQuebradaWidgetState extends State<ReporteQuebradaWidget> {
  bool? isCheckboxQuebradaSelected = false;
  @override
  Widget build(BuildContext context) {
    final quebradaBloc = Provider.of<QuebradaBloc>(context);
    return BlocBuilder<QuebradaBloc, QuebradaState>(
      builder: (context, quebradaState) {
        quebradaBloc.add(SetIndexEvent(quebradaBloc.getIdQuebradaByNombre(quebradaState.quebradas,quebradaState.quebradas.first.nombre)));
        return Column(
          children: [
            CheckboxListTile(
              title: const Text('Registrar quebrada',style: TextStyle(fontSize: 15)),
              secondary: const Icon(Icons.water_drop),
              controlAffinity: ListTileControlAffinity.platform,
              value: isCheckboxQuebradaSelected, 
              onChanged: (bool? value){
                setState(() {
                  isCheckboxQuebradaSelected = value;
                });
              }
            ),
            Visibility(
              visible: isCheckboxQuebradaSelected ?? true,
              child: DropdownButtonFormField(
                icon: const Icon(Icons.arrow_drop_down),
                decoration: ReporteDropdownButtonFormFieldDecoration.decoration(
                  label: 'Quebradas'
                ),
                value: quebradaState.quebradas.first,
                items: quebradaState.quebradas.map((e) => DropdownMenuItem(value: e,child: Text(e.nombre))).toList(),
                onChanged: (Quebrada? value){
                  quebradaBloc.add(SetQuebradaEvent(value??Quebrada(idQuebrada: 0, nombre: '', descripcion: '')));
                },
              ),
            )
          ],
        );
      },
    );
  }
}
