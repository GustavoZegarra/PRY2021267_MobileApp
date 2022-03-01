import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/screens/screens.dart';

class IncidenteScreen extends StatefulWidget {
  @override
  IncidenteState createState() => IncidenteState();
}

class IncidenteState extends State<IncidenteScreen> {

   String _information = 'No Information Yet';

  void updateInformation(String information) {
    setState(() => _information = information);
  }

  void moveToMapaScreen() async {
    final information = await Navigator.push(
      context,
      CupertinoPageRoute(
          fullscreenDialog: true, builder: (context) => MapaScreen()),
    );
    updateInformation(information);
  }

  String temp_cate = 'Seleccione';
  final List<String> lista_categoria = <String>[
    'Seleccione',
    'LLuvia fuerte',
    'Inundacion',
    'Huayco'
  ];
  String temp_moti = 'Seleccione';
  final List<String> lista_motivo = <String>[
    'Seleccione',
    'Inundacion en mi casa',
    'Huayco por mi casa',
    'Caida de poste de luz'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Safety Rain')),
        body: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text('REPORTAR UN INCIDENTE',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text('Seleccione una Categoria: ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 45,
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: DropdownButton(
                value: temp_cate,
                onChanged: (String? newValue) {
                  setState(() {
                    temp_cate = newValue!;
                  });
                },
                items: lista_categoria.map((val) {
                  return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold)));
                }).toList(),
                isExpanded: true,
                elevation: 1,
                underline: Container(
                  height: 2,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text('Seleccione un Motivo: ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 45,
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: DropdownButton(
                value: temp_moti,
                onChanged: (String? newValue) {
                  setState(() {
                    temp_moti = newValue!;
                  });
                },
                items: lista_motivo.map((val) {
                  return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold)));
                }).toList(),
                isExpanded: true,
                elevation: 1,
                underline: Container(
                  height: 2,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                    width: 260,
                    height: 60,
                    margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: TextFormField(
                        controller: TextEditingController(text: _information),
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 15),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                        ))),
                SizedBox(width: 15),
                InkWell(
                  focusColor: Colors.green,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 50,
                  ),
                  onTap: () {
                   moveToMapaScreen();

                  },
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 5, //Normal textInputField will be displayed
                maxLines: 5, // when user presses enter it will adapt to it
                decoration: InputDecoration(
                  hintText: 'DESCRIPCION DEL INCIDENTE (Opcional)',
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(color: Colors.black, width: 2.0)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
