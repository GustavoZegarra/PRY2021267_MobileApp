import 'package:flutter/material.dart';

class ListCardWidget extends StatelessWidget {

  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final String route;

  const ListCardWidget({ 
    Key? key, 
    this.icon = Icons.abc, 
    this.color = Colors.white, 
    this.title = 'No data', 
    this.subtitle = 'No data', 
    this.route = 'home',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,left: 20,top: 20),
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context,route),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(1),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10) 
            )),
          ),
        child: Card(
          elevation: 0,
          child: SizedBox(
            height: 100,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  child: Icon(icon,color: Colors.white),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(title,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      Text(subtitle)
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}