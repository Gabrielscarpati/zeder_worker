import 'package:flutter_test/flutter_test.dart';
import 'package:zeder/core/utils/double_utils.dart';

void main() {
  test('DoubleUtils.toDoubleDefaultZero: deve retornar o numero passado no parametro como "numero"', () {
    expect(DoubleUtil.toDoubleDefaultZero(123.234),123.234 );
  });

  test('DoubleUtils.toDoubleDefaultZero: deve retornar o numero passado no parametro como "string"', () {
    expect(DoubleUtil.toDoubleDefaultZero('123.234'),123.234 );
  });

  test('DoubleUtils.toDoubleDefaultZero: deve retornar o numero passado no parametro como "string" se a string contiver espacos no inicio/fim', () {
    expect(DoubleUtil.toDoubleDefaultZero(" 123.234 "), 123.234);
  });

  test('DoubleUtils.toDoubleDefaultZero: deve retornar o Zero quando passado nulo', () {
    expect(DoubleUtil.toDoubleDefaultZero(null),0 );
  });

  test('DoubleUtils.toDoubleDefaultZero: deve retornar o Zero quando passado String sem numero', () {
    expect(DoubleUtil.toDoubleDefaultZero("null"),0 );
  });

    test('DoubleUtils.toDoubleDefaultZero: deve retornar zero passado no parametro como "string" se a string contiver espacos no inicio/fim', () {
      expect(DoubleUtil.toDoubleDefaultZero(" 123. 234 "), 0);
    });



}
