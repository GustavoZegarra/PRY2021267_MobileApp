part of 'categoria_bloc.dart';

abstract class CategoriaEvent {}

class SetIdCategoriaEvent extends CategoriaEvent {
  final int idCategoria;
  SetIdCategoriaEvent(this.idCategoria);
}

class SetCategoriasEvent extends CategoriaEvent {
  final List<Categoria> categorias;
  SetCategoriasEvent(this.categorias);
}

class SetIsCategoriaSelectedEvent extends CategoriaEvent {
  final bool isCategoriaSelected;
  SetIsCategoriaSelectedEvent(this.isCategoriaSelected);
}