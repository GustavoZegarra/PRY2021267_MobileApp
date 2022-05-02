import 'package:bloc/bloc.dart';
import 'package:mobile_app/md_incidentes/models/incidente_model.dart';

part 'incidente_event.dart';
part 'incidente_state.dart';

class IncidenteBloc extends Bloc<IncidenteEvent, IncidenteState> {
  
  IncidenteBloc() : super(IncidenteState(
    incidente: Incidente(),
    incidentes: const[],
    imagen: '',
    ubicacion: const[]
  )) {

    on<SetIncidenteEvent>((event, emit) => emit(
      state.copyWith(
        incidente: event.incidente
      )
    ));

    on<SetIncidentesEvent>((event, emit) => emit(
      state.copyWith(
        incidentes: event.incidentes
      )
    ));

    on<SetImagenEvent>((event, emit) => emit(
      state.copyWith(
        imagen: event.imagen
      )
    ));

    on<SetUbicacionEvent>((event, emit) => emit(
      state.copyWith(
        ubicacion: event.ubicacion
      )
    ));

  }
}
