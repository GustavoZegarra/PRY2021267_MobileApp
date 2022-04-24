import 'package:flutter/material.dart';

class QuebradaListFilterWidget extends StatelessWidget {
  const QuebradaListFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
        onChanged: (String quebrada) {},
      ),
    );
  }
}