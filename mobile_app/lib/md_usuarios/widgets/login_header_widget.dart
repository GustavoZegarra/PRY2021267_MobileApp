import 'package:flutter/material.dart';
import 'package:mobile_app/themes/app_theme.dart';

class LoginHeaderWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: AppTheme.primaryColor,
            ),
            const Positioned(top: 100,left: 30,child: _Title(),),
            const Positioned(top: 160,left: 30,child: _Subtitle(),),
            const Positioned(top: 50,right: 50,child: _WaterDrop(),),
            const Positioned(top: 200,right: 100,child: _WaterDrop(),),
            const Positioned(bottom: 30,right: 50,child: _WaterDrop(),),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      AppTheme.nombre,
      style: TextStyle(fontSize: 50,fontWeight: FontWeight.w500,letterSpacing: 2,color: Colors.white)
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      AppTheme.frase,
      style: TextStyle(fontSize: 15,color: Colors.white)
    );
  }
}

class _WaterDrop extends StatelessWidget {
  const _WaterDrop({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.water_drop, color: Colors.white, size: 50);
  }
}