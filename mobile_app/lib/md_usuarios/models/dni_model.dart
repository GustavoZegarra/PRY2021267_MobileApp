class Dni {

    Dni({
        this.key,
        required this.idDni,
        required this.dni,
        this.codVerificacion,
        this.direccion,
        this.referencia,
        this.idDistrito
    });

    String? key;
    int idDni;
    String dni;
    int? codVerificacion;
    String? direccion;
    String? referencia;
    dynamic idDistrito;

    factory Dni.fromJson(dynamic json) {
    return Dni(
        idDni: json["idDni"],
        dni: json["dni"],
        codVerificacion: json["codVerificacion"],
        direccion: json["direccion"],
        referencia: json["referencia"],
        idDistrito: json["idDistrito"]
    );
  }

     Map<String, dynamic> toMap() => {
        "dni": dni,
        "codVerificacion": codVerificacion,
        "direccion": direccion,
        "referencia": referencia,
        "idDistrito": idDistrito
    };

}
