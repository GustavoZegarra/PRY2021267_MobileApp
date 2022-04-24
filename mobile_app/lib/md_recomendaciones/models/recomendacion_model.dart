class Recomendacion {

    Recomendacion({
        this.key,
        required this.idRecomendacion,
        required this.detalle,
        required this.idNivel,
        this.nivel,
    });

    String? key;
    int idRecomendacion;
    String? detalle;
    int? idNivel;
    dynamic nivel;

    factory Recomendacion.fromJson(dynamic json) {
    return Recomendacion(
      idRecomendacion: json['idRecomendacion'], 
      detalle: json['detalle'],
      idNivel: json['idNivel']
    );
  }

}