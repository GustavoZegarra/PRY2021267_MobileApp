import 'package:flutter/material.dart';
import 'package:mobile_app/screens/screens.dart';
import 'package:mobile_app/widgets/list_card_widget.dart';

class HomeScreen extends StatelessWidget {
  
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ImagenFondo(),
            _CardQuebrada(),
            _CardIncidente(),
            _CardAlerta(),
            _CardRecomendacion()
          ],
        ),
      ),
    );
  }
}

class _ImagenFondo extends StatelessWidget {
  const _ImagenFondo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.5,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            child: const Image(image: AssetImage('assets/LLUVIAS-INTENSAS-TABASCO.jpg'),fit: BoxFit.fill)
          ),
        )
      ],
    );
  }
}

class _CardQuebrada extends StatelessWidget {
  const _CardQuebrada({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListCardWidget(
      icon: Icons.water_drop,
      color: Colors.indigo,
      title: 'Quebradas',
      subtitle: 'Ver información de las quebradas registradas en el distrito de Chosica',
      route: 'quebrada',
    );
  }
}

class _CardIncidente extends StatelessWidget {
  const _CardIncidente({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListCardWidget(
      icon: Icons.report_sharp,
      color: Colors.amber,
      title: 'Incidentes',
      subtitle: 'Ver información de los incidentes reportado por los ciudadanos',
      route: 'incidente_tab',
    );
  }
}

class _CardAlerta extends StatelessWidget {
  const _CardAlerta({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListCardWidget(
      icon: Icons.report_sharp,
      color: Colors.red,
      title: 'Alertas',
      subtitle: 'Revisar alertas emitidas por nuestros sensores en las diversas quebradas',
      route: 'alerta',
    );
  }
}

class _CardRecomendacion extends StatelessWidget {
  const _CardRecomendacion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListCardWidget(
      icon: Icons.tips_and_updates,
      color: Colors.green,
      title: 'Recomendaciones',
      subtitle: '¿No sabes que hacer ante, durante y después de una posible inundación? Revisa aquí!',
      route: 'recomendacion',
    );
  }
}




