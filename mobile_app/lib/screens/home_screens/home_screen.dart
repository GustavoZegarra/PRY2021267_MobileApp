import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/home_widgets/card_option.dart';
import 'package:mobile_app/widgets/home_widgets/card_title_widget.dart';
import 'package:mobile_app/widgets/home_widgets/home_widgets.dart';

class HomeScreen extends StatelessWidget {
  
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
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
            ),
            CardOptionScreen(
              icon: Icons.water_drop,
              iconBackgroundColor: Colors.indigo,
              title: 'Quebradas',
              subtitle: 'Ver información de las quebradas registradas en el distrito de Chosica',
              func: () => Navigator.pushReplacementNamed(context, 'quebrada'),
            ),
            CardOptionScreen(
              icon: Icons.report_sharp,
              iconBackgroundColor: Colors.amber,
              title: 'Incidentes',
              subtitle: 'Ver información de los incidentes reportado por los ciudadanos',
            ),
            CardOptionScreen(
              icon: Icons.report_sharp,
              iconBackgroundColor: Colors.red,
              title: 'Alertas',
              subtitle: 'Revisar alertas emitidas por nuestros sensores en las diversas quebradas',
            ),
            CardOptionScreen(
              icon: Icons.tips_and_updates,
              iconBackgroundColor: Colors.green,
              title: 'Recomendaciones',
              subtitle: '¿No sabes que hacer ante, durante y después de una posible inundación? Revisa aquí!',
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}