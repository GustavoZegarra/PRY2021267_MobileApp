import 'package:bloc/bloc.dart';
import 'package:mobile_app/exports/models.dart';

part 'recomendacion_event.dart';
part 'recomendacion_state.dart';

class RecomendacionBloc extends Bloc<RecomendacionEvent, RecomendacionState> {

  RecomendacionBloc() : super(RecomendacionState(idRecomendacion: 0,recomendaciones: const [])) {

    on<SetIndexEventR>((event, emit) => emit(
      state.copyWith(
        idRecomendacion: event.idRecomendacion,
        recomendaciones: null
      )
    ));

    on<SetRecomendacionesEvent>((event, emit) => emit(
      state.copyWith(
        idRecomendacion: null,
        recomendaciones: event.recomendaciones
      )
    ));

  }

}
