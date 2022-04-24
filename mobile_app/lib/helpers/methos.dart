import 'package:intl/intl.dart';

class Methods {

  static bool isInt(String value){
    try{
      int.parse(value);
      return true;
    } catch (err){
      return false;
    }
  }

  static bool isDateTime(String value){
    try{
      DateFormat("dd/MM/yyyy").parseStrict(value);
      return true;
    } catch (err){
      return false;
    }
  }

  static bool isYearReal(int value){
    final maxYear = DateTime.now().year-18;
    final minYear = DateTime.now().year-118;
    if (value >= minYear && value <= maxYear){
      return true;
    }
    return false;
  }
}