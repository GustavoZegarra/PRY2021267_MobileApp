import 'package:flutter/material.dart';
import 'package:mobile_app/themes/app_theme.dart';
import 'package:mobile_app/widgets/app_card_widget.dart';

class QuebradaListaScreen extends StatelessWidget {

  const QuebradaListaScreen({ Key? key }) : super(key: key);

  static List<AppCardWidget> quebradas = [
    AppCardWidget(
      title: 'Nicolas de Pierola',
      route: 'quebradaDetail'
    ),
    AppCardWidget(
      title: 'Carossio',
      route: 'quebradaDetail'
    ),
    AppCardWidget(
      title: 'La libertad',
      route: 'quebradaDetail'
    ),
    AppCardWidget(
      title: 'Santo Domingo',
      route: 'quebradaDetail',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTheme.appBarThemeSecondary,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            const _FilterWidget(),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: quebradas.length,
              itemBuilder: (_,i) => quebradas[i]
            )
          ],
        ),
      ),
    );
  }
}

class _FilterWidget extends StatelessWidget {
  const _FilterWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 20,right: 20,top:20),
        width: double.infinity,
        color: Colors.white,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: 'Buscar quebrada',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onChanged: (String quebrada){},
        ),
      ),
    );
  }
}