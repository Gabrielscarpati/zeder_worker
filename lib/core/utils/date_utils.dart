class DateUtil {
  static final DateTime dateZero = DateTime(0);

  static DateTime toDateTimeDefaultDateZero(dynamic value) {
    if (value is DateTime) return value;
    return DateTime.tryParse(value.toString()) ?? dateZero;
  }

  static String getExibitionDate(DateTime date){
    int day = date.day;
    int month = date.month;
    String year = date.year.toString();
    
    String sday = '';
    String smonth = '';
    String syear = '';
    if(day < 10){
      sday = '0$day';
    }else{
      sday = day.toString();
    }

    if(month == 1){
      smonth = 'Janeiro';
    }
    if(month == 2){
      smonth = 'Fevereiro';
    }
    if(month == 3){
      smonth = 'Março';
    }
    if(month == 4){
      smonth = 'Abril';
    }
    if(month == 5){
      smonth = 'Maio';
    }
    if(month == 6){
      smonth = 'Junho';
    }
    if(month == 7){
      smonth = 'Julho';
    }
    if(month == 8){
      smonth = 'Agosto';
    }
    if(month == 9){
      smonth = 'Setembro';
    }
    if(month == 10){
      smonth = 'Outubro';
    }
    if(month == 11){
      smonth = 'Novembro';
    }
    if(month == 12){
      smonth = 'Dezembro';
    }

    return '$sday $smonth $year';

    
    
  }
}

class DateFormat {
  static String format(DateTime date) {
    return date.toString();
  }
}

extension DateUtils on DateTime {
  String toJsonString() {
    return toString();
  }
}
