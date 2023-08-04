import 'package:intl/intl.dart';

class Utils{

  DateTime parseDateTime(dynamic dateString){
    return DateFormat('dd/MM/yyyy').parse(dateString);
  }
}