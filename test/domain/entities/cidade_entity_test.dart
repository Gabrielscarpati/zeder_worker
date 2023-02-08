import 'package:flutter_test/flutter_test.dart';
import 'package:zeder/domain/entities/cidade_entity.dart';

void main() {
  test('CidadeEntity.constructor: deve criar um objeto com os respectivos valores', () {
    CidadeEntity entity = CidadeEntity(id: "1", nome: "São Paulo", uf: "SP");
    expect(entity.id, "1");
    expect(entity.nome, "São Paulo");
    expect(entity.uf, "SP");
  });

  test('CidadeEntity.fromJson: deve criar um objeto com os respectivos valores passados no json', () {
    CidadeEntity entity = CidadeEntity.fromJson({"id": "1", "nome": "São Paulo", "uf": "SP"});
    expect(entity.id, "1");
    expect(entity.nome, "São Paulo");
    expect(entity.uf, "SP");
  });

  test('CidadeEntity.fromJson: deve criar um objeto com os respectivos valores "default" quando o json for vazio', () {
    CidadeEntity entity = CidadeEntity.fromJson({});
    expect(entity.id, '');
    expect(entity.nome, '');
    expect(entity.uf, '');
  });

  test('CidadeEntity.toJson: deve retornar um json com os respectivos valores do obje', () {
    CidadeEntity entity = CidadeEntity.fromJson({"id": "1", "nome": "São Paulo", "uf": "SP"});
    Map<String, dynamic> map = entity.toJson();
    expect(map['id'], "1");
    expect(map['nome'], "São Paulo");
    expect(map['uf'], "SP");
  });

  test('CidadeEntity.copyWith: deve retornar uma copia do objeto com os respectivos valores passados nos paramentros', () {
    CidadeEntity entity = CidadeEntity.fromJson({"id": "1", "nome": "São Paulo", "uf": "SP"});

    expect(entity.copyWith().id, "1");
    expect(entity.copyWith(id: '2').id, "2");

    expect(entity.copyWith().nome, "São Paulo");
    expect(entity.copyWith(nome: 'colatina').nome, "colatina");

    expect(entity.copyWith().uf, "SP");
    expect(entity.copyWith(uf: 'ES').uf, "ES");
  });

  test('CidadeAdapter.fromJson: deve retornar um objeto criado apartir de um Json', () {
    CidadeAdapter adapter = CidadeAdapter();
    var entity = adapter.fromJson({"id": "1", "nome": "São Paulo", "uf": "SP"});
    expect(entity.id, "1");
    expect(entity.nome, "São Paulo");
    expect(entity.uf, "SP");
  });

  test('CidadeAdapter.toJson: deve retornar um Json do objeto passado no parametro', () {
    CidadeAdapter adapter = CidadeAdapter();
    CidadeEntity entity = CidadeEntity.fromJson({"id": "1", "nome": "São Paulo", "uf": "SP"});
    Map<String, dynamic> map = adapter.toJson(entity);
    expect(map['id'], "1");
    expect(map['nome'], "São Paulo");
    expect(map['uf'], "SP");
  });
}
