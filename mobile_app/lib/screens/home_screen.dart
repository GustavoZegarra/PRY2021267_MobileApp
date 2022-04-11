import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/widgets/app_card_widget.dart';

class HomeScreen extends StatelessWidget {

  static List<_CardOpcion> opciones = const [
    _CardOpcion(
      icon: Icon(Icons.water_drop,color: Colors.blueAccent),
      title: 'Quebradas',
      subtitle: 'Ver información de las quebradas registradas en el distrito de Chosica',
      route: 'quebrada_list'),
    _CardOpcion(
      icon: Icon(Icons.assessment,color: Colors.amberAccent),
      title: 'Incidentes',
      subtitle: 'Ver información de los incidentes reportado por los ciudadanos',
      route: 'incidente_list'),
    _CardOpcion(
      icon: Icon(Icons.assessment,color: Colors.redAccent),
      title: 'Alertas',
      subtitle: 'Revisar alertas emitidas por nuestros sensores en las diversas quebradas',
      route: 'alerta_list'),
    _CardOpcion(
      icon: Icon(Icons.tips_and_updates,color: Colors.greenAccent),
      title: 'Recomendaciones',
      subtitle: '¿No sabes que hacer en caso de una inundación? Revisa aquí!',
      route: 'alerta_list'),
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        _CardRecomendacion(),
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

class _CardRecomendacion extends StatefulWidget {

  _CardRecomendacion({
    Key? key
  }) : super(key: key);

  @override
  State<_CardRecomendacion> createState() => _CardRecomendacionState();
}

class _CardRecomendacionState extends State<_CardRecomendacion> {

  int idxRecomendaciones = 0;

  final List<String> recomendaciones = [
    'En caso de que viva en una casa, revise los techos. Evite que haya objetos en ellos que puedan causar males mayores. Fíjese en los canales por donde corre el agua en su casa, verifique que las tuberías no estén obstruidas.',
    'No arroje basura a la calle, ni a los ríos. Deposítela en los basureros.',
    'Evite que las corrientes de agua sean obstaculizadas. En caso de que vea algún escombro apresúrese a quitarlo antes de que convierta su zona en un estanque.'
  ];

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height*0.3;
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Opacity(
          opacity: 0.5,
          child: SizedBox(
            height: height,
            width: width,
            child: const Image(image: AssetImage('assets/home.jpg'),fit: BoxFit.fill)
          ),
        ),
        SizedBox(
          height: height,
          width: width,
          child: Opacity(
            opacity: 0.8,
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.all(40),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      recomendaciones[idxRecomendaciones],
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.keyboard_arrow_left,size: 20),
                          onPressed: (){
                            setState((){
                              idxRecomendaciones -= 1;
                              if (idxRecomendaciones == -1) idxRecomendaciones = 0;
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.keyboard_arrow_right,size: 20),
                          onPressed: (){
                            setState((){
                              idxRecomendaciones += 1;
                              if (idxRecomendaciones == 3) idxRecomendaciones = 2;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                )
              ),
            ),
          ),
        )
      ],
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
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      child: Card(
        elevation: 1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: ListTile(
          leading: icon,
          title: Text(title),
          subtitle: Text(subtitle),
          onTap: () => Navigator.pushNamed(context,route),
        ),
      )
    );
  }
}




