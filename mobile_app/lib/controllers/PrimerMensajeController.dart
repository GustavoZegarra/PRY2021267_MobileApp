import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

class PrimerMensajeController extends ChangeNotifier {
  final Permission _locationPermission;
  String? _routeName;
  String? get routeName => _routeName;

  PrimerMensajeController(this._locationPermission);

  //comprobar accesos de ubicacion
  Future<void> checkPermission() async {
    final isGranted = await _locationPermission.isGranted;
    _routeName = isGranted ? 'login' : 'requestPermission';
    notifyListeners();
  }
}
