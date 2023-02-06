import 'package:flutter_test/flutter_test.dart';
import 'package:zeder/core/utils/int_utils.dart';

void main() {
  test('IntUtil.toIntDefaultZero: deve retornar o numero passado no parametro como "numero"', () {
    expect(IntUtil.toIntDefaultZero(123), 123);
  });

  test('IntUtil.toIntDefaultZero: deve retornar o numero passado no parametro como "string"', () {
    expect(IntUtil.toIntDefaultZero('123'), 123);
  });

  test('IntUtil.toIntDefaultZero: deve retornar o numero passado no parametro como "string" se a string contiver espacos no inicio/fim', () {
    expect(IntUtil.toIntDefaultZero(" 123 "), 123);
  });

  test('IntUtil.toIntDefaultZero: deve retornar o Zero quando passado nulo', () {
    expect(IntUtil.toIntDefaultZero(null), 0);
  });

  test('IntUtil.toIntDefaultZero: deve retornar o Zero quando passado String sem numero', () {
    expect(IntUtil.toIntDefaultZero("adfasdfafd12346"), 0);
  });

  test('IntUtil.toIntDefaultZero: deve retornar zero passado no parametro como "string" se a string contiver espacos no meio', () {
    expect(IntUtil.toIntDefaultZero(" 12 3"), 0);
  });
}
