part of 'quebrada_bloc.dart';

class QuebradaState {

  final int idQuebrada;
  final List<Quebrada> quebradas;

  QuebradaState({
    required this.idQuebrada,
    required this.quebradas,
  });

  QuebradaState copyWith({
  final int? idQuebrada,
  final List<Quebrada>? quebradas
  }) => QuebradaState(
    idQuebrada: idQuebrada ?? this.idQuebrada,
    quebradas: quebradas ?? this.quebradas
  );

}
