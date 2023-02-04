import 'package:flutter_test/flutter_test.dart';
import 'package:zeder/core/utils/bool_utils.dart';

void main() {
  test('BoolUtils.toBoolDefaultFalse: deve retornar false se o valor passado for nulo', () {
    expect(BoolUtil.toBoolDefaultFalse(null), false);
  });

  test('BoolUtils.toBoolDefaultFalse: deve retornar true se o valor passado for true', () {
    expect(BoolUtil.toBoolDefaultFalse(true), true);
  });

  test('BoolUtils.toBoolDefaultFalse: deve retornar true se o valor passado for "true"', () {
    expect(BoolUtil.toBoolDefaultFalse("true"), true);
  });

  test('BoolUtils.toBoolDefaultFalse: deve retornar true se o valor passado for "1"', () {
    expect(BoolUtil.toBoolDefaultFalse("1"), true);
  });

  test('BoolUtils.toBoolDefaultFalse: deve retornar true se o valor passado for 1', () {
    expect(BoolUtil.toBoolDefaultFalse(1), true);
  });

  test('BoolUtils.toBoolDefaultFalse: deve retornar true se o valor passado for uma lista', () {
    expect(BoolUtil.toBoolDefaultFalse([1,2,3,4]), false);
  });
  test('BoolUtils.toBoolDefaultFalse: deve retornar true se o valor passado for "Y', () {
    expect(BoolUtil.toBoolDefaultFalse("Y"), true);
  });
  test('BoolUtils.toBoolDefaultFalse: deve retornar true se o valor passado for "yEs', () {
    expect(BoolUtil.toBoolDefaultFalse("yEs"), true);
  });
}
