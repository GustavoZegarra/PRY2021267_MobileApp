// To parse this JSON data, do
//
//     final gps = gpsFromMap(jsonString);

import 'dart:convert';

class Gps {
    Gps({
        this.idGps,
        this.latitud,
        this.longitud,
        this.incidente
    });

    int? idGps;
    double? latitud;
    double? longitud;
    dynamic incidente;

    factory Gps.fromJson(dynamic json) {
    return Gps(
        idGps: json["idGPS"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        incidente: json["incidente"],
    );}

    String toJson() => json.encode(toMap());

    factory Gps.fromMap(Map<String, dynamic> json) => Gps(
        idGps: json["idGPS"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        incidente: json["incidente"],
    );

    Map<String, dynamic> toMap() => {
        "idGPS": idGps,
        "latitud": latitud,
        "longitud": longitud,
        "incidente": incidente,
    };
}
