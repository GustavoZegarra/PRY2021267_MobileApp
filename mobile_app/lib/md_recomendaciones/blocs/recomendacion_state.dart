part of 'recomendacion_bloc.dart';

class RecomendacionState {

  final int idRecomendacion;
  final List<Recomendacion> recomendaciones;

  RecomendacionState({
    required this.idRecomendacion,
    required this.recomendaciones,
  });

  RecomendacionState copyWith({
  final int? idRecomendacion,
  final List<Recomendacion>? recomendaciones
  }) => RecomendacionState(
    idRecomendacion: idRecomendacion ?? this.idRecomendacion,
    recomendaciones: recomendaciones ?? this.recomendaciones
  );

}
