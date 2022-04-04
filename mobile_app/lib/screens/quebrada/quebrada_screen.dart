import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/widgets.dart';

class QuebradaScreen extends StatefulWidget {

  QuebradaScreen({ Key? key }) : super(key: key);

  @override
  State<QuebradaScreen> createState() => _QuebradaScreenState();
}

class _QuebradaScreenState extends State<QuebradaScreen> {

  final List<ListCardWidget> quebradas = [
    ListCardWidget(title: 'Nicolas de Pierola',subtitle: 'Descripción de la quebrada',icon: Icons.water_drop,color: Colors.indigo,),
    ListCardWidget(title: 'Carossio'          ,subtitle: 'Descripción de la quebrada',icon: Icons.water_drop,color: Colors.indigo,),
    ListCardWidget(title: 'La libertad'       ,subtitle: 'Descripción de la quebrada',icon: Icons.water_drop,color: Colors.indigo,),
    ListCardWidget(title: 'Santo Domingo'     ,subtitle: 'Descripción de la quebrada',icon: Icons.water_drop,color: Colors.indigo,),
    ListCardWidget(title: 'Nicolas de Pierola',subtitle: 'Descripción de la quebrada',icon: Icons.water_drop,color: Colors.indigo,),
    ListCardWidget(title: 'Carossio'          ,subtitle: 'Descripción de la quebrada',icon: Icons.water_drop,color: Colors.indigo,),
    ListCardWidget(title: 'La libertad'       ,subtitle: 'Descripción de la quebrada',icon: Icons.water_drop,color: Colors.indigo,),
    ListCardWidget(title: 'Santo Domingo'     ,subtitle: 'Descripción de la quebrada',icon: Icons.water_drop,color: Colors.indigo,),
    ListCardWidget(title: 'Nicolas de Pierola',subtitle: 'Descripción de la quebrada',icon: Icons.water_drop,color: Colors.indigo,),
    ListCardWidget(title: 'Carossio'          ,subtitle: 'Descripción de la quebrada',icon: Icons.water_drop,color: Colors.indigo,),
    ListCardWidget(title: 'La libertad'       ,subtitle: 'Descripción de la quebrada',icon: Icons.water_drop,color: Colors.indigo,),
    ListCardWidget(title: 'Santo Domingo'     ,subtitle: 'Descripción de la quebrada',icon: Icons.water_drop,color: Colors.indigo,)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            const _FilterWidget(),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: quebradas.length,
              itemBuilder: (context,index) {
                return quebradas[index];
              }
            )
          ],
        ),
      ),
    );
  }
}

class _FilterWidget extends StatelessWidget {
  const _FilterWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 20,right: 20,top:20),
        width: double.infinity,
        color: Colors.white,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: 'Buscar quebrada',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onChanged: (String quebrada){},
        ),
      ),
    );
  }
}