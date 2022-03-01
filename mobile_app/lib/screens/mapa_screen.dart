import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_app/controllers/map_controller.dart';
import 'package:provider/provider.dart';

//Aca falta editar que en vez de que madne safety rain que mande una coordenada de latitud o long
class MapaScreen extends StatelessWidget {
  String ola = "Safety Rain";

  void actualizando(LatLng pos) {
    ola = pos.latitude.toString();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MapaController>(
      create: (context) => MapaController(),
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, ola);
          return true;
        },
        child: Scaffold(
          appBar: AppBar(title: Text(ola)),
          body: Consumer<MapaController>(
            builder: (_, controller, __) => GoogleMap(
                markers: controller.markers,
                initialCameraPosition: controller.initalCameraPosition,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: true,
                onTap: (position) {
                  controller.onTap(position);
                  actualizando(position);
                }),
          ),
        ),
      ),
    );
  }
}
