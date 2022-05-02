part of 'motivo_bloc.dart';

class MotivoState {

  final int idMotivo;
  final Motivo motivo;
  final List<Motivo> motivos;

  MotivoState({
    required this.idMotivo,
    required this.motivo,
    required this.motivos
  });

  MotivoState copyWith({
    final int? idMotivo,
    final Motivo? motivo,
    final List<Motivo>? motivos
  }) => MotivoState(
    idMotivo: idMotivo ?? this.idMotivo,
    motivo: motivo ?? this.motivo,
    motivos: motivos ?? this.motivos,
  );

}