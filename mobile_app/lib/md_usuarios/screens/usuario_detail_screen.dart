import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/exports/blocs.dart';
import 'package:mobile_app/themes/app_theme.dart';

class UsuarioDetailScreen extends StatelessWidget {

  const UsuarioDetailScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: _ImageWidget()),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: _QuebradaDetailWidget()),
          ],
        ),
      ),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundImage: const AssetImage('assets/empty.png'),
        radius: MediaQuery.of(context).size.width * 0.4,
      ),
    );
  }
}

class _QuebradaDetailWidget extends StatelessWidget {

  const _QuebradaDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
    );
  }
}
