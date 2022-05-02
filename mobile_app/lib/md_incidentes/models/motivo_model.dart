import 'dart:convert';

class Motivo {
    Motivo({
        this.idMotivo = 0,
        this.detalle = '',
        this.idCategoria = 0,
        this.categoria,
        this.incidentes,
    });

    int idMotivo;
    String detalle;
    int idCategoria;
    dynamic categoria;
    dynamic incidentes;

    factory Motivo.fromJson(dynamic json) {
    return Motivo(
        idMotivo: json["idMotivo"],
        detalle: json["detalle"],
        idCategoria: json["idCategoria"],
        categoria: json["categoria"],
        incidentes: json["incidentes"],
    );}

    String toJson() => json.encode(toMap());

    factory Motivo.fromMap(Map<String, dynamic> json) => Motivo(
        idMotivo: json["idMotivo"],
        detalle: json["detalle"],
        idCategoria: json["idCategoria"],
        categoria: json["categoria"],
        incidentes: json["incidentes"],
    );

    Map<String, dynamic> toMap() => {
        "idMotivo": idMotivo,
        "detalle": detalle,
        "idCategoria": idCategoria,
        "categoria": categoria,
        "incidentes": incidentes,
    };
}
