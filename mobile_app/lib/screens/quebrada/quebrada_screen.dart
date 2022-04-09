import 'package:flutter/material.dart';
import 'package:mobile_app/models/quebrada_model.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'dart:math';

final List<String> q = [
    'Nicolas de Pierola'
    ,'Carossio'          
    ,'La libertad'       
    ,'Santo Domingo'     
    ,'Nicolas de Pierola'
    ,'Carossio'          
    ,'La libertad'       
    ,'Santo Domingo'     
    ,'Nicolas de Pierola'
    ,'Carossio'          
    ,'La libertad'       
    ,'Santo Domingo'     
];

const description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dictum iaculis lorem in placerat.';


class QuebradaScreen extends StatefulWidget {

  QuebradaScreen({ Key? key }) : super(key: key);

  @override
  State<QuebradaScreen> createState() => _QuebradaScreenState();
}

class _QuebradaScreenState extends State<QuebradaScreen> {

  final List<ListCardWidget> quebradas = [
    ListCardWidget(title: q[Random().nextInt(q.length)].toString(),subtitle: description,icon: Icons.water_drop,color: Colors.indigo,route: 'quebrada_detail',),
    ListCardWidget(title: q[Random().nextInt(q.length)].toString(),subtitle: description,icon: Icons.water_drop,color: Colors.indigo,route: 'quebrada_detail',),
    ListCardWidget(title: q[Random().nextInt(q.length)].toString(),subtitle: description,icon: Icons.water_drop,color: Colors.indigo,route: 'quebrada_detail',),
    ListCardWidget(title: q[Random().nextInt(q.length)].toString(),subtitle: description,icon: Icons.water_drop,color: Colors.indigo,route: 'quebrada_detail',),
    ListCardWidget(title: q[Random().nextInt(q.length)].toString(),subtitle: description,icon: Icons.water_drop,color: Colors.indigo,route: 'quebrada_detail',),
    ListCardWidget(title: q[Random().nextInt(q.length)].toString(),subtitle: description,icon: Icons.water_drop,color: Colors.indigo,route: 'quebrada_detail',),
    ListCardWidget(title: q[Random().nextInt(q.length)].toString(),subtitle: description,icon: Icons.water_drop,color: Colors.indigo,route: 'quebrada_detail',),
    ListCardWidget(title: q[Random().nextInt(q.length)].toString(),subtitle: description,icon: Icons.water_drop,color: Colors.indigo,route: 'quebrada_detail',),
    ListCardWidget(title: q[Random().nextInt(q.length)].toString(),subtitle: description,icon: Icons.water_drop,color: Colors.indigo,route: 'quebrada_detail',),
    ListCardWidget(title: q[Random().nextInt(q.length)].toString(),subtitle: description,icon: Icons.water_drop,color: Colors.indigo,route: 'quebrada_detail',),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quebradas'),backgroundColor: Colors.indigo),
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