import 'dart:convert';

class Categoria {
    Categoria({
        this.idCategoria = 0,
        this.detalle = 'default',
        this.motivos,
    });

    int idCategoria;
    String detalle;
    dynamic motivos;

    factory Categoria.fromJson(dynamic json) {
    return Categoria(
        idCategoria: json["idCategoria"],
        detalle: json["detalle"],
        motivos: json["motivos"],
    );}

    String toJson() => json.encode(toMap());

    factory Categoria.fromMap(Map<String, dynamic> json) => Categoria(
        idCategoria: json["idCategoria"],
        detalle: json["detalle"],
        motivos: json["motivos"],
    );

    Map<String, dynamic> toMap() => {
        "idCategoria": idCategoria,
        "detalle": detalle,
        "motivos": motivos,
    };
}
