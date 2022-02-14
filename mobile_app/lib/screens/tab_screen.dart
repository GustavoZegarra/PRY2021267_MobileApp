import 'package:flutter/material.dart';
import 'package:mobile_app/screens/home_screen.dart';

class TabScreen extends StatelessWidget {
   
  //const TabScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Column(
          children: [
            const Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text('General')),
                  Center(child: Text('Quebradas')),
                  Center(child: Text('Incidencias')),
                  Center(child: Text('Usuario')),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
              child: const TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Icon(Icons.home_filled),
                  Icon(Icons.water),
                  Icon(Icons.assignment_rounded),
                  Icon(Icons.account_circle_rounded),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}