import 'package:bloc/bloc.dart';
import 'package:mobile_app/md_incidentes/models/motivo_model.dart';

part 'motivo_event.dart';
part 'motivo_state.dart';

class MotivoBloc extends Bloc<MotivoEvent, MotivoState> {
  
  MotivoBloc() : super(MotivoState(idMotivo: 0,motivo: Motivo(),motivos: const[])) {

    on<SetIdMotivoEvent>((event, emit) => emit(
      state.copyWith(
        idMotivo: event.idMotivo
      )
    ));

    on<SetMotivoEvent>((event, emit) => emit(
      state.copyWith(
        motivo: event.motivo
      )
    ));

    on<SetMotivosEvent>((event, emit) => emit(
      state.copyWith(
        motivos: event.motivos
      )
    ));

  }

  int getIdMotivoByDetalle(List<Motivo> motivos,String detalle){
    for(int i = 0; i < motivos.length; i++){
      if(motivos[i].detalle == detalle){
        return motivos[i].idMotivo;
      }
    }
    return 0;
  }

}