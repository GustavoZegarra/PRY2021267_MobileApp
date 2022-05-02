import 'dart:convert';

import 'package:mobile_app/exports/models.dart';

class Incidente {
    Incidente({
        this.idIncidente,
        this.descripcion,
        this.imagen,
        this.fechaRegistro,
        this.fechaActualizacion,
        this.resuelto,
        this.idUsuario,
        this.usuario,
        this.idQuebrada,
        this.quebrada,
        this.idMotivo,
        this.motivo,
        this.idGps,
        this.gps,
    });

    int? idIncidente;
    String? descripcion;
    String? imagen;
    dynamic fechaRegistro;
    dynamic fechaActualizacion;
    bool? resuelto;
    int? idUsuario;
    Usuario? usuario;
    int? idQuebrada;
    dynamic quebrada;
    int? idMotivo;
    dynamic motivo;
    int? idGps;
    dynamic gps;

    factory Incidente.fromJson(dynamic json) {
    return Incidente(
        idIncidente: json["idIncidente"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
        fechaRegistro: DateTime.parse(json["fechaRegistro"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        resuelto: json["resuelto"],
        idUsuario: json["idUsuario"],
        usuario: Usuario.fromJson(json["usuario"]),
        idQuebrada: json["idQuebrada"],
        quebrada: json["quebrada"],
        idMotivo: json["idMotivo"],
        motivo: json["motivo"],
        idGps: json["idGPS"],
        gps: json["gps"],
    );}

    String toJson() => json.encode(toMap());

    factory Incidente.fromMap(Map<String, dynamic> json) => Incidente(
        idIncidente: json["idIncidente"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
        fechaRegistro: DateTime.parse(json["fechaRegistro"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        resuelto: json["resuelto"],
        idUsuario: json["idUsuario"],
        usuario: json["usuario"],
        idQuebrada: json["idQuebrada"],
        quebrada: json["quebrada"],
        idMotivo: json["idMotivo"],
        motivo: json["motivo"],
        idGps: json["idGPS"],
        gps: json["gps"],
    );

    Map<String, dynamic> toMap() => {
        "idIncidente": idIncidente,
        "descripcion": descripcion,
        "imagen": imagen,
        "fechaRegistro": fechaRegistro.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "resuelto": resuelto,
        "idUsuario": idUsuario,
        "usuario": usuario,
        "idQuebrada": idQuebrada,
        "quebrada": quebrada,
        "idMotivo": idMotivo,
        "motivo": motivo,
        "idGPS": idGps,
        "gps": gps,
    };
}
