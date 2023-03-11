import 'package:intl/intl.dart';

class Data {

  static String? getSystemTime(){
    var nowTime=DateTime.now();
    return DateFormat("H:m:s").format(nowTime);
  }

}