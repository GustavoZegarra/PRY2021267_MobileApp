import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/exports/blocs.dart';
import 'package:mobile_app/exports/models.dart';

class QuebradaListCardWidget extends StatelessWidget {

  final Quebrada quebrada;

  const QuebradaListCardWidget({ 
    Key? key,
    required this.quebrada
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        BlocProvider.of<QuebradaBloc>(context).add(SetIndexEvent(quebrada.idQuebrada));
        Navigator.pushNamed(context,'quebrada_detail');
      },
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(2),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.grey)
          )),
        ),
      child: Card(
        elevation: 0,
        child: SizedBox(
          height: 100,
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/empty.png'),
                radius: 25
              ),
              const SizedBox(width: 20),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(quebrada.nombre,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                    Text(quebrada.descripcion ?? 'Valor nulo identificado en quebrada_list_card_widget',maxLines: 2,style: const TextStyle(fontSize: 12))
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}