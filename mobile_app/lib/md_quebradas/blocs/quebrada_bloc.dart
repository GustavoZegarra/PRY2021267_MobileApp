import 'package:bloc/bloc.dart';
import 'package:mobile_app/exports/models.dart';

part 'quebrada_event.dart';
part 'quebrada_state.dart';

class QuebradaBloc extends Bloc<QuebradaEvent, QuebradaState> {

  QuebradaBloc() : super(QuebradaState(idQuebrada: 0,quebradas: const [])) {

    on<SetIndexEvent>((event, emit) => emit(
      state.copyWith(
        idQuebrada: event.idQuebrada,
        quebradas: null
      )
    ));

    on<SetQuebradasEvent>((event, emit) => emit(
      state.copyWith(
        idQuebrada: null,
        quebradas: event.quebradas
      )
    ));

  }

}
