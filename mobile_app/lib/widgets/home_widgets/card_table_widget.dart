import 'package:flutter/material.dart';
import 'package:mobile_app/themes/app_theme.dart';

class CardTableWidget extends StatelessWidget {
  const CardTableWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(
          children: [
            _SingleCard(icon: Icons.water_drop, text: 'Quebradas'),
            _SingleCard(icon: Icons.bug_report, text: 'Incidentes')
          ]
        ),
        TableRow(
          children: [
            _SingleCard(icon: Icons.sim_card_alert, text: 'Alertas'),
            _SingleCard(icon: Icons.tips_and_updates, text: 'Tips')
          ]
        )
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  
  final IconData icon;
  final String   text;

  const _SingleCard({
    Key? key,
    required this.icon,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
          color: Colors.grey[10],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,size:50,color: Colors.grey,),
          SizedBox(height: 10),
          Text(text,style: TextStyle(color:Colors.black, fontSize: 16))
        ],
      ),
    );
  }
}