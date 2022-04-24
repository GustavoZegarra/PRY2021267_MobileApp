import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/exports/blocs.dart';
import 'package:mobile_app/themes/app_theme.dart';

class QuebradaDetailScreen extends StatelessWidget {

  const QuebradaDetailScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTheme.appBarThemeSecondary,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: _ImageWidget()),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: _QuebradaDetailWidget()),
          ],
        ),
      ),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundImage: const AssetImage('assets/empty.png'),
        radius: MediaQuery.of(context).size.width * 0.4,
      ),
    );
  }
}

class _QuebradaDetailWidget extends StatelessWidget {

  const _QuebradaDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<QuebradaBloc, QuebradaState>(
        builder: (context, state) {
          return Column(
            children: [
              Text(state.quebradas.firstWhere((element) => element.idQuebrada == state.idQuebrada).nombre,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text('Quebrada'),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(state.quebradas.firstWhere((element) => element.idQuebrada == state.idQuebrada).descripcion ?? 'Valor nulo identificado en quebrada_detail_sceen', style: const TextStyle(fontSize: 15)),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Precipitacion: 1.4',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 20),
                  Text('Sensores: 5',
                      style: TextStyle(fontWeight: FontWeight.bold))
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
