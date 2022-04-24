import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/exports/blocs.dart';
import 'package:mobile_app/exports/services.dart';
import 'package:mobile_app/md_usuarios/services/apiperu_service.dart';
import 'package:mobile_app/md_usuarios/services/dni_service.dart';
import 'package:mobile_app/routes/app_route.dart';
import 'package:mobile_app/themes/app_theme.dart';
import 'package:provider/provider.dart';

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
      ], 
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<UsuarioService>(create: (_) => UsuarioService()),
          ChangeNotifierProvider<DniService>(create: (_) => DniService()),
          ChangeNotifierProvider<ApiPeruService>(create: (_) => ApiPeruService()),
          ChangeNotifierProvider<QuebradaService>(create: (_) => QuebradaService()),
          ChangeNotifierProvider<CategoriaService>(create: (_) => CategoriaService()),
          ChangeNotifierProvider<MotivoService>(create: (_) => MotivoService())
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