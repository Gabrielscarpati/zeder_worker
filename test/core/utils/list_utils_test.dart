import 'package:flutter_test/flutter_test.dart';
import 'package:zeder/core/utils/double_utils.dart';
import 'package:zeder/core/utils/list_utils.dart';

void main() {

  test('ListUtils.toListDefaultEmpty: deve retornar uma lista vazia se for passado nulo', () {
    expect(ListUtil.toListDefaultEmpty(null),[] );
  });

  test('ListUtils.toListDefaultEmpty: deve retornar a lista que for passada como parametro', () {
    expect(ListUtil.toListDefaultEmpty([]),[] );
  });

  test('ListUtils.toListDefaultEmpty: deve retornar a lista que for passada como parametro', () {
    expect(ListUtil.toListDefaultEmpty([12,2,2,3]),[12,2,2,3] );
  });

  test('ListUtils.toListDefaultEmpty: deve retornar uma lista vazia se for passada uma string no parametro', () {
    expect(ListUtil.toListDefaultEmpty("[12,2,2,3]"),[] );
  });

}
