import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mobile_app/controllers/map_controller.dart';
import 'package:provider/provider.dart';

//Aca falta editar que en vez de que madne safety rain que mande una coordenada de latitud o long
class MapaScreen extends StatelessWidget {
  String ola = "Safety Rain";

  LatLng _initialcameraposition = LatLng(-12.028914, -77.081833);
  late GoogleMapController _controllerm;
  Location _location = Location();

  void actualizando(LatLng pos) {
    ola = pos.latitude.toString();
  }

  void _onMapCreated(GoogleMapController _cntlr) {
    _controllerm = _cntlr;
    _location.onLocationChanged.listen((l) {
      print(l.latitude.toString() + " " + l.longitude.toString());
      actualizando(LatLng(l.latitude!, l.longitude!));
      _controllerm.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MapaController>(
      create: (context) => MapaController(),
      child: WillPopScope(
        onWillPop: () async {
          //envia el ola hacia atras
          Navigator.pop(context, ola);
          return true;
        },
        child: Scaffold(
          appBar: AppBar(title: Text(ola)),
          body: Consumer<MapaController>(
            builder: (_, controller, __) => GoogleMap(
                markers: controller.markers,
                initialCameraPosition:
                    CameraPosition(target: _initialcameraposition),
                onMapCreated: _onMapCreated,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                zoomControlsEnabled: true,
                onTap: (position) {
                  controller.onTap(position);
                  //actualizando(position);
                }),
          ),
        ),
      ),
    );
  }
}
