import 'package:flutter/material.dart';
import 'package:mobile_app/themes/app_theme.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({ Key? key, required this.child }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _Box(),
          _HeaderIcon(),
          this.child
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 50),
        child: Icon(Icons.person_pin, color: Colors.white, size: 100,),
      ),
    );
  }
}

class _Box extends StatelessWidget {
  _Box({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.3,
      decoration: _boxDecoration(),
    );
  }

  BoxDecoration _boxDecoration() => const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.blueAccent,
        AppTheme.primary,
      ]
    )
  );
}