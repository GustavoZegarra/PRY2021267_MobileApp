import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaController extends ChangeNotifier {
  Map<MarkerId, Marker> _markers = {};

  Set<Marker> get markers => _markers.values.toSet();

  final initalCameraPosition = CameraPosition(
      //Chosica
      target: LatLng(-11.9430600, -76.7094400),
      zoom: 15);

  void onTap(LatLng position) {
    //unico identificador del marker
    final markerId = MarkerId("ola");
    final marker = Marker(
    markerId: markerId, 
    position: position,
    draggable: true
    
    );
    _markers[markerId] = marker;
    notifyListeners();
  }
}
