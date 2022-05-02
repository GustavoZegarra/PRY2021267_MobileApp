import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/exports/blocs.dart';
import 'package:mobile_app/exports/services.dart';
import 'package:mobile_app/md_incidentes/blocs/categoria_blocs/categoria_bloc.dart';
import 'package:mobile_app/md_incidentes/blocs/incidente_blocs/incidente_bloc.dart';
import 'package:mobile_app/md_incidentes/services/incidente_service.dart';
import 'package:mobile_app/md_usuarios/services/dni_service.dart';
import 'package:mobile_app/routes/app_route.dart';
import 'package:mobile_app/themes/app_theme.dart';
import 'package:provider/provider.dart';

import 'md_alertas/services/socket_service.dart';
import 'md_incidentes/blocs/motivo_blocs/motivo_bloc.dart';

void main() {
  
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppTheme.primaryColor,
      systemNavigationBarColor: Colors.black
    )
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<GpsBloc>(create: (_) => GpsBloc()),
        BlocProvider<QuebradaBloc>(create: (_) => QuebradaBloc()),
        BlocProvider<RecomendacionBloc>(create: (_) => RecomendacionBloc()),
        BlocProvider<CategoriaBloc>(create: (_) => CategoriaBloc()),
        BlocProvider<MotivoBloc>(create: (_) => MotivoBloc()),
        BlocProvider<IncidenteBloc>(create: (_) => IncidenteBloc()),
      ], 
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<UsuarioService>(create: (_) => UsuarioService()),
          ChangeNotifierProvider<DniService>(create: (_) => DniService()),
          ChangeNotifierProvider<ApiPeruService>(create: (_) => ApiPeruService()),
          ChangeNotifierProvider<QuebradaService>(create: (_) => QuebradaService()),
          ChangeNotifierProvider<CategoriaService>(create: (_) => CategoriaService()),
          ChangeNotifierProvider<MotivoService>(create: (_) => MotivoService()),
          ChangeNotifierProvider<RecomendacionService>(create: (_) => RecomendacionService()),
          ChangeNotifierProvider<SocketService>(create: (_) => SocketService()),
          ChangeNotifierProvider<IncidenteService>(create: (_) => IncidenteService())
        ],
        child: const MyApp())
        )
  );
  
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoute.initialRoute,
        routes: AppRoute.routes,
        theme: AppTheme.lightTheme,
    );
  }

}