import 'package:flutter/material.dart';
import 'package:mobile_app/themes/app_theme.dart';

const String lorem_ipsum3 = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis ipsum odio, sed semper sapien lobortis id. Proin eu ullamcorper ante, a tincidunt dolor. Sed sit amet turpis sollicitudin, facilisis est at, ultricies sapien. Nam finibus aliquet ex, sit amet sagittis felis lacinia eu. Duis ante felis, auctor eu metus nec, tempus pulvinar diam. Nam vulputate tincidunt magna in consectetur. Integer eget eros at nibh porttitor sollicitudin.';

class AlertaDetalleScreen extends StatelessWidget {
  const AlertaDetalleScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTheme.appBarThemeSecondary,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Padding(padding: EdgeInsets.symmetric(vertical: 40), child: _ImageWidget()),
            Padding(padding: EdgeInsets.symmetric(vertical: 20), child: _QuebradaDetailWidget()),
          ],
        ),
      ),
      
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundImage: const AssetImage('assets/empty.png'),
        radius: MediaQuery.of(context).size.width*0.4,
      ),
    );
  }
}

class _QuebradaDetailWidget extends StatelessWidget {
  const _QuebradaDetailWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const Text('Nicolas de Pierola',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text('Quebrada'),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(lorem_ipsum3,style: TextStyle(fontSize: 15)),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Precipitacion: 1.4',style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(width: 20),
              Text('Sensores: 5',style: TextStyle(fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
    );
  }
}
