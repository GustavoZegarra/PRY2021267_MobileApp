import 'package:flutter/material.dart';

class ReporteDescripcionWidget extends StatelessWidget {

  TextEditingController descripcionController;

  ReporteDescripcionWidget({ 
    Key? key,
    required this.descripcionController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: descripcionController,
      minLines: 3,
      maxLines: 7,
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration(
          hintText: 'Ingresar un detalle (opcional)',
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(5)))),
    );
  }
}