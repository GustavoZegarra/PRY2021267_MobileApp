part of 'incidente_bloc.dart';

abstract class IncidenteEvent {}

class SetIncidenteEvent extends IncidenteEvent {
  final Incidente incidente;
  SetIncidenteEvent(this.incidente);
}

class SetIncidentesEvent extends IncidenteEvent {
  final List<Incidente> incidentes;
  SetIncidentesEvent(this.incidentes);
}

class SetImagenEvent extends IncidenteEvent {
  final String imagen;
  SetImagenEvent(this.imagen);
}

class SetUbicacionEvent extends IncidenteEvent {
  final List<double> ubicacion;
  SetUbicacionEvent(this.ubicacion);
}
