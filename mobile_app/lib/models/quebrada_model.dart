class Quebrada {

  String nombre;
  double precipitacion;

  Quebrada(
    this.nombre,
    this.precipitacion,
  );

  factory Quebrada.fromJson(dynamic json) {
    return Quebrada(json['nombre'] as String, json['precipitacion'] as double);
  }

}
