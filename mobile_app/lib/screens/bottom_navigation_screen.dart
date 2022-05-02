import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/exports/blocs.dart';
import 'package:mobile_app/md_incidentes/blocs/categoria_blocs/categoria_bloc.dart';
import 'package:mobile_app/md_incidentes/blocs/incidente_blocs/incidente_bloc.dart';
import 'package:mobile_app/md_incidentes/blocs/motivo_blocs/motivo_bloc.dart';
import 'package:mobile_app/md_incidentes/services/categoria_service.dart';
import 'package:mobile_app/md_incidentes/services/incidente_service.dart';
import 'package:mobile_app/md_incidentes/services/motivo_service.dart';
import 'package:mobile_app/md_quebradas/services/quebrada_service.dart';
import 'package:mobile_app/screens/screens.dart';
import 'package:mobile_app/themes/app_theme.dart';
import 'package:provider/provider.dart';

import 'loading_screen.dart';

class BottomNavigationScreen extends StatefulWidget {

  const BottomNavigationScreen({ Key? key }) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationState();
  
}

class _BottomNavigationState extends State<BottomNavigationScreen> {
  
  int _index = 0;
  final List<Widget> _pages = [ const HomeScreen(),const ReporteScreen(), const UsuarioDetailScreen() ];

  @override
  Widget build(BuildContext context) {
    final categoriaService = Provider.of<CategoriaService>(context);
    final motivoService = Provider.of<MotivoService>(context);
    final quebradaService = Provider.of<QuebradaService>(context);
    
    if (categoriaService.isLoading 
        && motivoService.isLoading 
        && quebradaService.isLoading
      ) return LoadingScreen(mensaje: 'datos');
    
    final categoiraBloc = BlocProvider.of<CategoriaBloc>(context);
    categoiraBloc.add(SetCategoriasEvent(categoriaService.categorias));

    final motivoBloc = BlocProvider.of<MotivoBloc>(context);
    motivoBloc.add(SetMotivosEvent(motivoService.motivos));

    final quebradaBloc = BlocProvider.of<QuebradaBloc>(context);
    quebradaBloc.add(SetQuebradasEvent(quebradaService.quebradas));

    return Scaffold(

      appBar: AppTheme.appBarTheme,
      
      body: _pages[_index],
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        showUnselectedLabels: false,
        selectedItemColor: AppTheme.primaryColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'SAT'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_rounded),label: 'Reportar' ),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Mi cuenta')
        ],
        onTap: (index){setState(() {_index = index;});},
      ),

    );
  }
}