import 'package:flutter_test/flutter_test.dart';
import 'package:zeder/core/utils/date_utils.dart';

void main() {
  test('DateUtils.dateZero: deve retornar  DateTime(0)', () {
    expect(DateUtil.dateZero, DateTime(0));
  });

  test('DateUtils.toDateTimeDefaultDateZero: deve retornar a data se foi passada uma data no parametro', () {
    DateTime date = DateTime(2020, 1, 1);
    expect(DateUtil.toDateTimeDefaultDateZero(date), date);
  });

  test('DateUtils.toDateTimeDefaultDateZero: deve retornar a data se foi passada uma data no formato "string" no parametro', () {
    DateTime date = DateUtil.toDateTimeDefaultDateZero("2020-12-31");
    expect(date.year, 2020);
    expect(date.month, 12);
    expect(date.day, 31);
  });

  test('DateUtils.toDateTimeDefaultDateZero: deve retornar dateZero se for passado nulo', () {
    expect(DateUtil.toDateTimeDefaultDateZero(null), DateUtil.dateZero);
  });

  test('DateUtils.toDateTimeDefaultDateZero: deve retornar dateZero se for passado String', () {
    expect(DateUtil.toDateTimeDefaultDateZero("null"), DateUtil.dateZero);
  });

  test('DateUtils.toJsonString: deve retornar a data toString() da data', () {
    DateTime date = DateTime(2020, 1, 1);
    expect(date.toJsonString(), date.toString());
  });


}
