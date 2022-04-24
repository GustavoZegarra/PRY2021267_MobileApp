import 'dart:convert';

class ApiPeru {
    ApiPeru({
        this.numero = '',
        this.nombreCompleto = '',
        this.nombres = '',
        this.apellidoPaterno = '',
        this.apellidoMaterno = '',
        this.codigoVerificacion = 0,
        this.fechaNacimiento,
        this.sexo,
        this.estadoCivil,
        this.departamento = '',
        this.provincia = '',
        this.distrito = '',
        this.direccion = '',
        this.direccionCompleta = '',
        this.ubigeoReniec = '',
        this.ubigeoSunat = '',
        this.ubigeo = const [],
    });

    String numero;
    String nombreCompleto;
    String nombres;
    String apellidoPaterno;
    String apellidoMaterno;
    int codigoVerificacion;
    dynamic fechaNacimiento;
    dynamic sexo;
    dynamic estadoCivil;
    String departamento;
    String provincia;
    String distrito;
    String direccion;
    String direccionCompleta;
    String ubigeoReniec;
    String ubigeoSunat;
    List<String> ubigeo;

    factory ApiPeru.fromJson(String str) => ApiPeru.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ApiPeru.fromMap(Map<String, dynamic> json) => ApiPeru(
        numero: json["numero"],
        nombreCompleto: json["nombre_completo"],
        nombres: json["nombres"],
        apellidoPaterno: json["apellido_paterno"],
        apellidoMaterno: json["apellido_materno"],
        codigoVerificacion: json["codigo_verificacion"],
        fechaNacimiento: json["fecha_nacimiento"],
        sexo: json["sexo"],
        estadoCivil: json["estado_civil"],
        departamento: json["departamento"],
        provincia: json["provincia"],
        distrito: json["distrito"],
        direccion: json["direccion"],
        direccionCompleta: json["direccion_completa"],
        ubigeoReniec: json["ubigeo_reniec"],
        ubigeoSunat: json["ubigeo_sunat"],
        ubigeo: List<String>.from(json["ubigeo"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "numero": numero,
        "nombre_completo": nombreCompleto,
        "nombres": nombres,
        "apellido_paterno": apellidoPaterno,
        "apellido_materno": apellidoMaterno,
        "codigo_verificacion": codigoVerificacion,
        "fecha_nacimiento": fechaNacimiento,
        "sexo": sexo,
        "estado_civil": estadoCivil,
        "departamento": departamento,
        "provincia": provincia,
        "distrito": distrito,
        "direccion": direccion,
        "direccion_completa": direccionCompleta,
        "ubigeo_reniec": ubigeoReniec,
        "ubigeo_sunat": ubigeoSunat,
        "ubigeo": List<dynamic>.from(ubigeo.map((x) => x)),
    };
}