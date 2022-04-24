import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/exports/blocs.dart';
import 'package:mobile_app/exports/screens.dart';
import 'package:mobile_app/exports/services.dart';
import 'package:mobile_app/exports/widgets.dart';
import 'package:mobile_app/themes/app_theme.dart';
import 'package:provider/provider.dart';

class QuebradaListScreen extends StatelessWidget {
  const QuebradaListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final quebradaService = Provider.of<QuebradaService>(context);
    if (quebradaService.isLoading) return LoadingScreen(mensaje: 'Quebradas');

    final quebradaBloc = BlocProvider.of<QuebradaBloc>(context);
    quebradaBloc.add(SetQuebradasEvent(quebradaService.quebradas));

    return Scaffold(
      appBar: AppTheme.appBarTheme,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: BlocBuilder<QuebradaBloc, QuebradaState>(
          builder: (context, state) {
            return Column(
              children: [
                //const QuebradaListFilterWidget(),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.quebradas.length,
                    itemBuilder: (_, index) => 
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: QuebradaListCardWidget(quebrada: quebradaBloc.state.quebradas.elementAt(index),),
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