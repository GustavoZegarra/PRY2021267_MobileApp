import 'package:flutter/material.dart';
import 'package:mobile_app/themes/app_theme.dart';
import 'package:mobile_app/widgets/app_card_widget.dart';

class AlertaListScreen extends StatefulWidget {

  const AlertaListScreen({ Key? key }) : super(key: key);

  static List<AppCardWidget> quebradas = [
    AppCardWidget(
      title: 'Nicolas de Pierola',
      route: 'alerta_detalle'
    ),
    AppCardWidget(
      title: 'Carossio',
      route: 'alerta_detalle'
    ),
    AppCardWidget(
      title: 'La libertad',
      route: 'alerta_detalle'
    ),
    AppCardWidget(
      title: 'Santo Domingo',
      route: 'alerta_detalle',
    ),
  ];

  @override
  State<AlertaListScreen> createState() => _AlertaListScreenState();
}

class _AlertaListScreenState extends State<AlertaListScreen> {

  bool isAltIntesoActive = true;
  bool isAltAltoActive = false;
  bool isAltModeradoActive = false;
  bool isAltBajoActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTheme.appBarThemeSecondary,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            
            // NIVEL ALERTA: INTENSO

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 15),
              child: Card(
                elevation: 1,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                color: isAltIntesoActive ? Colors.redAccent : Colors.white,
                child: ListTile(
                  leading: isAltIntesoActive
                    ? const Icon(Icons.arrow_drop_up, color: Colors.white, size: 40)
                    : const Icon(Icons.arrow_drop_down, color: Colors.redAccent, size: 40),
                  title: isAltIntesoActive
                    ? const Text('Nivel de alerta: Intenso',style: TextStyle(color:Colors.white))
                    : const Text('Nivel de alerta: Intenso',style: TextStyle(color:Colors.black)),
                  subtitle: isAltIntesoActive
                    ? const Text('Visualizar lista de quebradas con nivel de alerta de la lluvia intenso.',style: TextStyle(color:Colors.white))
                    : const Text('Visualizar lista de quebradas con nivel de alerta de la lluvia intenso.'),
                  onTap: () => setState(() { isAltIntesoActive = !isAltIntesoActive; }),
                ),
              ),
            ),
            Visibility(
              visible: isAltIntesoActive,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: AlertaListScreen.quebradas.length,
                itemBuilder: (_,i) => AlertaListScreen.quebradas[i]
              ),
            ),

            // NIVEL ALERTA: MODERADO

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
              child: Card(
                elevation: 2,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                color: isAltAltoActive ? Colors.orangeAccent : Colors.white,
                child: ListTile(
                  leading: isAltAltoActive
                    ? const Icon(Icons.arrow_drop_up, color: Colors.white, size: 40)
                    : const Icon(Icons.arrow_drop_down, color: Colors.orangeAccent, size: 40),
                  title: isAltAltoActive
                    ? const Text('Nivel de alerta: Alto',style: TextStyle(color:Colors.white))
                    : const Text('Nivel de alerta: Alto',style: TextStyle(color:Colors.black)),
                  onTap: () => setState(() { isAltAltoActive = !isAltAltoActive; }),
                ),
              ),
            ),
            Visibility(
              visible: isAltAltoActive,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: AlertaListScreen.quebradas.length,
                itemBuilder: (_,i) => AlertaListScreen.quebradas[i]
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 15),
              child: Card(
                elevation: 1,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                color: isAltModeradoActive ? Colors.amberAccent : Colors.white,
                child: ListTile(
                  leading: isAltModeradoActive
                    ? const Icon(Icons.arrow_drop_up, color: Colors.white, size: 40)
                    : const Icon(Icons.arrow_drop_down, color: Colors.amberAccent, size: 40),
                  title: isAltModeradoActive
                    ? const Text('Nivel de alerta: Moderado',style: TextStyle(color:Colors.white))
                    : const Text('Nivel de alerta: Moderado',style: TextStyle(color:Colors.black)),
                  subtitle: isAltModeradoActive
                    ? const Text('Visualizar lista de quebradas con nivel de alerta de la lluvia intenso.',style: TextStyle(color:Colors.white))
                    : const Text('Visualizar lista de quebradas con nivel de alerta de la lluvia intenso.'),
                  onTap: () => setState(() { isAltModeradoActive = !isAltModeradoActive; }),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 15),
              child: Card(
                elevation: 1,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                color: isAltBajoActive ? Colors.greenAccent : Colors.white,
                child: ListTile(
                  leading: isAltBajoActive
                    ? const Icon(Icons.arrow_drop_up, color: Colors.white, size: 40)
                    : const Icon(Icons.arrow_drop_down, color: Colors.greenAccent, size: 40),
                  title: isAltBajoActive
                    ? const Text('Nivel de alerta: Bajo',style: TextStyle(color:Colors.white))
                    : const Text('Nivel de alerta: Bajo',style: TextStyle(color:Colors.black)),
                  subtitle: isAltBajoActive
                    ? const Text('Visualizar lista de quebradas con nivel de alerta de la lluvia intenso.',style: TextStyle(color:Colors.white))
                    : const Text('Visualizar lista de quebradas con nivel de alerta de la lluvia intenso.'),
                  onTap: () => setState(() { isAltBajoActive = !isAltBajoActive; }),
                ),
              ),
            ),
            

          ],
        ),
      ),
    );
  }
}