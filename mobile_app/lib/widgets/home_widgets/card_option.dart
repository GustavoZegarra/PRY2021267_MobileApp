import 'package:flutter/material.dart';

class CardOptionScreen extends StatelessWidget {

  final IconData icon;
  final Color iconBackgroundColor;
  final String title;
  final String subtitle;
  final void func;

  const CardOptionScreen({ 
    Key? key, 
    required this.icon, 
    required this.iconBackgroundColor, 
    required this.title, 
    required this.subtitle, 
    this.func 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,left: 20,top: 20),
      child: ElevatedButton(
        onPressed: () { Navigator.pushNamed(context, 'quebrada');},
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(1),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10) 
            )),
          ),
        child: Card(
          elevation: 0,
          child: Container(
            height: 100,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: iconBackgroundColor,
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