import 'package:flutter/material.dart';
import 'package:mobile_app/models/quebrada_model.dart';
import 'package:mobile_app/themes/app_theme.dart';

class QuebradaScreen extends StatelessWidget {
  //const QuebradaScreen({Key? key}) : super(key: key);

  final List<String> quebradas = [
    'Nicolas de Pierola',
    'Carossio',
    'La libertad',
    'Santo Domingo',
    'Nicolas de Pierola',
    'Carossio',
    'La libertad',
    'Santo Domingo',
    'Nicolas de Pierola',
    'Carossio',
    'La libertad',
    'Santo Domingo'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          itemCount: quebradas.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(quebradas[index]),
            subtitle: ListBody(
              children: const [
                Text('Estado de actividad: Baja'),
                Text('Reportes de incidentes: 0'),
                Text('Última actualización hace 6 minutos')
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded,
                color: AppTheme.primary),
            onTap: () {
              print('ola');
            },
          ),
          separatorBuilder: (_, __) => const Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
        ));
  }
}
