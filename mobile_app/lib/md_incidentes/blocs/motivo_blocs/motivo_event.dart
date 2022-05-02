part of 'motivo_bloc.dart';

abstract class MotivoEvent {}

class SetMotivosEvent extends MotivoEvent {
  final List<Motivo> motivos;
  SetMotivosEvent(this.motivos);
}

class SetMotivoEvent extends MotivoEvent {
  final Motivo motivo;
  SetMotivoEvent(this.motivo);
}

class SetIdMotivoEvent extends MotivoEvent {
  final int idMotivo;
  SetIdMotivoEvent(this.idMotivo);
}