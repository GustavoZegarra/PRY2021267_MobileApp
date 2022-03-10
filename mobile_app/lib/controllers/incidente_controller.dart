import 'package:location/location.dart';

class IncidenteController {
//Por ahora esto hace que no de error el combobox

//Consultar Api Categoria

  String temp_cate = 'Seleccione';
  final List<String> lista_categoria = <String>[
    'LLuvia fuerte',
    'Inundacion',
    'Huayco'
  ];

//consultar api Motivo

  String temp_moti = 'Seleccione';
  final List<String> lista_motivo = <String>[
    'Inundacion en mi casa',
    'Huayco por mi casa',
    'Caida de poste de luz'
  ];



}
