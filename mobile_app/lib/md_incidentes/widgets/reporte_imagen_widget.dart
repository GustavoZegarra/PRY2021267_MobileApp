import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/md_incidentes/blocs/incidente_blocs/incidente_bloc.dart';
import 'package:mobile_app/md_incidentes/ui/dropdownButtonFormField.dart';
import 'package:provider/provider.dart';

class ReporteImagenWidget extends StatefulWidget {

  ReporteImagenWidget({Key? key}) : super(key: key);

  @override
  State<ReporteImagenWidget> createState() => _ReporteImagenWidgetState();
}

class _ReporteImagenWidgetState extends State<ReporteImagenWidget> {
  bool? isCheckboxQuebradaSelected = false;

  @override
  Widget build(BuildContext context) {
    final incidenteBloc = Provider.of<IncidenteBloc>(context);
    return BlocBuilder<IncidenteBloc, IncidenteState>(
      builder: (context, incidenteState) {
        return Column(
          children: [
            CheckboxListTile(
              title: const Text('Agregar imagen',style: TextStyle(fontSize: 15)),
              secondary: const Icon(Icons.camera_alt),
              controlAffinity: ListTileControlAffinity.platform,
              value: isCheckboxQuebradaSelected, 
              onChanged: (bool? value){
                setState(() {
                  isCheckboxQuebradaSelected = value;
                });
              }
            ),
            Visibility(
              visible: isCheckboxQuebradaSelected ?? true,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.camera_alt,
                            color: Colors.black,
                            size: 30),
                        onPressed: () async {
                          final picker = ImagePicker();
                          final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 100);
                          if (pickedFile == null) {
                            //isPicturePicked = false;
                            return;
                          }
                          final String _pictureBase64Encoded = base64Encode(await pickedFile.readAsBytes());
                          incidenteBloc.add(SetImagenEvent(_pictureBase64Encoded));
                    }),
                    const SizedBox(width: 20),
                    Container(
                    child: incidenteState.imagen.isEmpty
                      ? const Image(
                          image: AssetImage('assets/empty.png'),
                          height: 130,
                          width: 130,
                        )
                      : Image.memory(
                          base64Decode(incidenteState.imagen),
                          fit: BoxFit.fill,
                          height: 100,
                          width: 100,
                          //fit: BoxFit.fitWidth,
                          frameBuilder: (context, child, frame, loaded){
                            if(loaded){
                              return child;
                            }
                            return AnimatedOpacity(
                              child: child,
                              opacity: frame == null ? 0 : 1, 
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeOut,
                            );
                          },
                        ),
                  ),
                  ],
                ),
            )
          ],
        );
      },
    );
  }
}
