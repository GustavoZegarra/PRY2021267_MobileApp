import 'package:bloc/bloc.dart';
import 'package:mobile_app/exports/models.dart';

part 'quebrada_event.dart';
part 'quebrada_state.dart';

class QuebradaBloc extends Bloc<QuebradaEvent, QuebradaState> {

  QuebradaBloc() : super(QuebradaState(idQuebrada: 0,quebrada: Quebrada(idQuebrada:0,nombre: '',descripcion: ''),quebradas: const [])) {

    on<SetIndexEvent>((event, emit) => emit(
      state.copyWith(
        idQuebrada: event.idQuebrada,
        quebradas: null
      )
    ));

    on<SetQuebradaEvent>((event, emit) => emit(
      state.copyWith(
        quebrada: event.quebrada
      )
    ));

    on<SetQuebradasEvent>((event, emit) => emit(
      state.copyWith(
        idQuebrada: null,
        quebradas: event.quebradas
      )
    ));

  }

  int getIdQuebradaByNombre(List<Quebrada> quebradas,String nombre){
    for(int i = 0; i < quebradas.length; i++){
      if(quebradas[i].nombre == nombre){
        return quebradas[i].idQuebrada;
      }
    }
    return 0;
  }

}
