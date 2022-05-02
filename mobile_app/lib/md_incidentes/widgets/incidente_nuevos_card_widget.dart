import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/md_incidentes/blocs/incidente_blocs/incidente_bloc.dart';
import 'package:mobile_app/md_incidentes/services/incidente_service.dart';
import 'package:mobile_app/screens/loading_screen.dart';
import 'package:provider/provider.dart';

import '../models/incidente_model.dart';

class IncidenteNuevosCardWidget extends StatelessWidget {

  final Incidente incidente;

  const IncidenteNuevosCardWidget({
    Key? key,
    required this.incidente
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncidenteBloc, IncidenteState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            //BlocProvider.of<QuebradaBloc>(context).add(SetIndexEvent(quebrada.idQuebrada));
            //Navigator.pushNamed(context, 'incidente_detail');
          },
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.white))),
          ),
          child: Card(
            elevation: 0,
            child: SizedBox(
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: incidente.imagen == null
                          ? Container()
                          : Image.memory(
                              base64Decode(incidente.imagen??''),
                              height: 80,
                              width: 80,
                              fit: BoxFit.fill,
                              frameBuilder: (context, child, frame, loaded){
                                if(loaded){
                                  return child;
                                }
                                return AnimatedOpacity(
                                  child: child,
                                  opacity: frame == null ? 0 : 1, 
                                  duration: const Duration(seconds: 2),
                                  curve: Curves.easeOut,
                                );
                              },
                            ),
                      ),
                      const SizedBox(width: 20),
                      Flexible(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(incidente.usuario?.nombre??'',maxLines: 1,style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            Text(incidente.descripcion??'',maxLines: 2,style: const TextStyle(fontSize: 12)),
                            Text('Fecha: '+incidente.fechaRegistro.toString().split(' ')[0],maxLines: 1,style: const TextStyle(fontSize: 12)),
                        ],
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
