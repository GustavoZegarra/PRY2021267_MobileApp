import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            _SingleCard(),
            _SingleCard()
          ]
        )
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  const _SingleCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 200,
      decoration: BoxDecoration(
        color: Color.fromRGBO(20, 167, 181,1),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.pie_chart,size:30),
            radius: 30,
          ),
          SizedBox(height: 10),
          Text('General',style: TextStyle(color:Colors.blue, fontSize: 18))
        ],
      ),
    );
  }
}