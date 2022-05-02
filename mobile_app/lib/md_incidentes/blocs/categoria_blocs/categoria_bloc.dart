import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_app/md_incidentes/models/categoria_model.dart';

part 'categoria_event.dart';
part 'categoria_state.dart';

class CategoriaBloc extends Bloc<CategoriaEvent, CategoriaState> {
  
  CategoriaBloc() : super(CategoriaState(idCategoria:0,categorias: const[],isCategoriaSelected:false)) {
    
    on<SetIdCategoriaEvent>((event, emit) => emit(
      state.copyWith(
        idCategoria: event.idCategoria,
        categorias: null,
        isCategoriaSelected: null
      )
    ));

    on<SetCategoriasEvent>((event, emit) => emit(
      state.copyWith(
        idCategoria: null,
        categorias: event.categorias,
        isCategoriaSelected: null
      )
    ));

    on<SetIsCategoriaSelectedEvent>((event, emit) => emit(
      state.copyWith(
        idCategoria: null,
        categorias: null,
        isCategoriaSelected: event.isCategoriaSelected
      )
    ));

  }

}