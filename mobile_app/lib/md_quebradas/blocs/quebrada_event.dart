part of 'quebrada_bloc.dart';

abstract class QuebradaEvent {}

class SetIndexEvent extends QuebradaEvent {
  final int idQuebrada;
  SetIndexEvent(this.idQuebrada);
}

class SetQuebradasEvent extends QuebradaEvent {
  final List<Quebrada> quebradas;
  SetQuebradasEvent(this.quebradas);
}