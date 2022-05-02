import 'package:flutter/material.dart';
import 'package:mobile_app/exports/services.dart';
import 'package:mobile_app/md_alertas/services/socket_service.dart';
import 'package:mobile_app/screens/loading_screen.dart';
import 'package:mobile_app/themes/app_theme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Provider.of<CategoriaService>(context).getCategorias();
    //Provider.of<MotivoService>(context).getMotivos();
    Provider.of<SocketService>(context);

    const List<_CardOpcion> opciones = [
    _CardOpcion(
      icon: Icon(Icons.water_drop,color: Colors.grey),
      title: 'Quebradas',
      subtitle: 'Observa el estado de las quebradas del distrito y la información de los sensores instalados',
      route: 'quebrada_list'),
    _CardOpcion(
      icon: Icon(Icons.assessment,color: Colors.grey),
      title: 'Incidentes',
      subtitle: 'Revisa los reportes registrados de incidentes identificados en el distrito',
      route: 'incidente_list')
    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Opacity(
          opacity: 0.5,
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.3,
            width: double.infinity,
            child: const Image(image: AssetImage('assets/home.jpg'),fit: BoxFit.fill)
          ),
        ),
        //const Divider(thickness: 15),
        Expanded(
          child: ListView.builder(
            itemCount: opciones.length,
            itemBuilder: (_,i) => opciones[i]
          ),
        )
        ],
      ),
    );
  }
}

class _CardOpcion extends StatelessWidget {
  final Icon icon;
  final String title;
  final String subtitle;
  final String route;
  const _CardOpcion({ 
    Key? key,
    required this.icon, 
    required this.title, 
    required this.subtitle,
    required this.route 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: SizedBox(
        height: 100,
        child: Card(
          elevation: 5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: Colors.white)
          ),
          child: Center(
            child: ListTile(
              leading: icon,
              title: Text(title),
              subtitle: Text(subtitle),
              onTap: () => Navigator.pushNamed(context,route),
            ),
          ),
        ),
      )
    );
  }
}




