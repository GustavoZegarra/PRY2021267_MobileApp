class Usuario {

    Usuario({
        this.key,
        this.idUsuario,
        this.nombre,
        required this.correo,
        required this.token,
        this.celular,
        this.fechaNacimiento,
        this.idDni,
        this.dni,
        this.idPasaporte,
        this.pasaporte,
        this.incidentes,
    });

    String? key;
    int? idUsuario;
    String? nombre;
    String correo;
    String token;
    String? celular;
    dynamic fechaNacimiento;
    int? idDni;
    dynamic dni;
    dynamic idPasaporte;
    dynamic pasaporte;
    dynamic incidentes;

    factory Usuario.fromJson(dynamic json) {
    return Usuario(
        idUsuario: json["idUsuario"],
        nombre: json["nombre"],
        correo: json["correo"],
        token: json["token"],
        celular: json["celular"],
        fechaNacimiento: json["fechaNacimiento"],
        idDni: json["idDni"],
        dni: json["dni"],
        idPasaporte: json["idPasaporte"],
        pasaporte: json["pasaporte"],
        incidentes: json["incidentes"],
    );
  }

     Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "correo": correo,
        "token": token,
        "celular": celular,
        "fechaNacimiento": fechaNacimiento,
        "idDni": idDni,
        "dni": dni,
        "idPasaporte": idPasaporte,
        "pasaporte": pasaporte,
        "incidentes": incidentes,
    };

}
