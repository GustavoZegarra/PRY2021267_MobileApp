class Quebrada {

    Quebrada({
        this.key,
        required this.idQuebrada,
        required this.nombre,
        required this.descripcion,
        this.sensores,
        this.incidentes,
    });

    String? key;
    int idQuebrada;
    String nombre;
    String? descripcion;
    dynamic sensores;
    dynamic incidentes;

    factory Quebrada.fromJson(dynamic json) {
    return Quebrada(
      idQuebrada: json['idQuebrada'], 
      nombre: json['nombre'],
      descripcion: json['descripcion']
    );
  }

}
