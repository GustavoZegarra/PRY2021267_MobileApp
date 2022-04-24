part of 'recomendacion_bloc.dart';

abstract class RecomendacionEvent {}

class SetIndexEventR extends RecomendacionEvent {
  final int idRecomendacion;
  SetIndexEventR(this.idRecomendacion);
}

class SetRecomendacionesEvent extends RecomendacionEvent {
  final List<Recomendacion> recomendaciones;
  SetRecomendacionesEvent(this.recomendaciones);
}