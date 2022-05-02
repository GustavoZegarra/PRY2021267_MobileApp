part of 'categoria_bloc.dart';

class CategoriaState {

  final int idCategoria;
  final List<Categoria> categorias;
  final bool isCategoriaSelected;

  CategoriaState({
    required this.idCategoria,
    required this.categorias,
    required this.isCategoriaSelected,
  });

  CategoriaState copyWith({
  final int? idCategoria,
  final List<Categoria>? categorias,
  final bool? isCategoriaSelected
  }) => CategoriaState(
    idCategoria: idCategoria ?? this.idCategoria,
    categorias: categorias ?? this.categorias,
    isCategoriaSelected: isCategoriaSelected ?? this.isCategoriaSelected
  );

}