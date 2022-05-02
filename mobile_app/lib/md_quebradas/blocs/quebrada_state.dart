part of 'quebrada_bloc.dart';

class QuebradaState {

  final int idQuebrada;
  final Quebrada quebrada;
  final List<Quebrada> quebradas;

  QuebradaState({
    required this.idQuebrada,
    required this.quebrada,
    required this.quebradas,
  });

  QuebradaState copyWith({
  final int? idQuebrada,
  final Quebrada? quebrada,
  final List<Quebrada>? quebradas
  }) => QuebradaState(
    idQuebrada: idQuebrada ?? this.idQuebrada,
    quebrada: quebrada ?? this.quebrada,
    quebradas: quebradas ?? this.quebradas
  );

}
