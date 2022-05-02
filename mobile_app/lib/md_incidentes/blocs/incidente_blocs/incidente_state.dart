part of 'incidente_bloc.dart';

class IncidenteState {

  final Incidente incidente;
  final List<Incidente> incidentes;
  // AUX
  final String imagen;
  final List<double> ubicacion;
  

  IncidenteState({
    required this.incidente,
    required this.incidentes,
    required this.imagen,
    required this.ubicacion
  });

  IncidenteState copyWith({
    final Incidente? incidente,
    final List<Incidente>? incidentes,
    final String? imagen,
    final List<double>? ubicacion
  }) => IncidenteState(
    incidente: incidente ?? this.incidente,
    incidentes: incidentes ?? this.incidentes,
    imagen: imagen ?? this.imagen,
    ubicacion: ubicacion ?? this.ubicacion
  );

}