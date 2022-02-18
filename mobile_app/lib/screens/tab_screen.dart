import 'package:flutter/material.dart';
import 'package:mobile_app/screens/screens.dart';
import 'package:mobile_app/themes/app_theme.dart';

class TabScreen extends StatelessWidget {
   
  //const TabScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  HomeScreen(),
                  QuebradaScreen(),
                  IncidenteScreen()
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
              child: const TabBar(
                labelColor: AppTheme.primary,
                unselectedLabelColor: Colors.grey,
                indicatorColor: AppTheme.primary,
                tabs: [
                  Icon(Icons.home_filled),
                  Icon(Icons.water),
                  Icon(Icons.assignment_rounded)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}