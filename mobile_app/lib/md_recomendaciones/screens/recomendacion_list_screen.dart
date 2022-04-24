import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/exports/services.dart';
import 'package:mobile_app/exports/screens.dart';
import 'package:mobile_app/exports/blocs.dart';
import 'package:mobile_app/exports/widgets.dart';
import 'package:mobile_app/themes/app_theme.dart';
import 'package:provider/provider.dart';

class RecomendacionListScreen extends StatelessWidget {
  const RecomendacionListScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final recomendacionService = Provider.of<RecomendacionService>(context);
    if (recomendacionService.isLoading) return LoadingScreen(mensaje: 'Recomendaciones');


    final recomendacionBloc = BlocProvider.of<RecomendacionBloc>(context);
    recomendacionBloc.add(SetRecomendacionesEvent(recomendacionService.recomendaciones));

    return Scaffold(
      appBar: AppTheme.appBarTheme,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: BlocBuilder<RecomendacionBloc, RecomendacionState>(
          builder: (context, state) {
            return Column(
              children: [
                //const QuebradaListFilterWidget(),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.recomendaciones.length,
                    itemBuilder: (_, index) => 
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: RecomendacionListCardWidget(recomendacion: recomendacionBloc.state.recomendaciones.elementAt(index),),
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