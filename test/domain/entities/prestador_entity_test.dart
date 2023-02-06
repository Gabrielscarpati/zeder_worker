import 'package:flutter_test/flutter_test.dart';
import 'package:zeder/domain/entities/prestador_entity.dart';

void main() {
  test('PrestadorEntity.constructor: deve criar um objeto com os respectivos valores', () {
    PrestadorEntity entity = PrestadorEntity(id: "1", nome: "Pedro", email: "pedro@gmail", qtdeNotas1: 1, qtdeNotas2: 2, qtdeNotas3: 3, qtdeNotas4: 4, qtdeNotas5: 5);
    expect(entity.id, "1");
    expect(entity.nome, "Pedro");
    expect(entity.email, "pedro@gmail");
    expect(entity.qtdeNotas1, 1);
    expect(entity.qtdeNotas2, 2);
    expect(entity.qtdeNotas3, 3);
    expect(entity.qtdeNotas4, 4);
    expect(entity.qtdeNotas5, 5);
  });

  test('PrestadorEntity.fromJson: deve criar um objeto com os respectivos valores passados no json', () {
    PrestadorEntity entity = PrestadorEntity.fromJson({"id": "1", "nome": "Pedro", "email": "pedro@gmail", "qtdeNotas1": 1, "qtdeNotas2": 2, "qtdeNotas3": 3, "qtdeNotas4": 4, "qtdeNotas5": 5});
    expect(entity.id, "1");
    expect(entity.nome, "Pedro");
    expect(entity.email, "pedro@gmail");
    expect(entity.qtdeNotas1, 1);
    expect(entity.qtdeNotas2, 2);
    expect(entity.qtdeNotas3, 3);
    expect(entity.qtdeNotas4, 4);
    expect(entity.qtdeNotas5, 5);
  });

  test('PrestadorEntity.fromJson: deve criar um objeto com os respectivos valores "default" quando o json for vazio', () {
    PrestadorEntity entity = PrestadorEntity.fromJson({});
    expect(entity.id, '');
    expect(entity.nome, '');
    expect(entity.email, '');
    expect(entity.qtdeNotas1, 0);
    expect(entity.qtdeNotas2, 0);
    expect(entity.qtdeNotas3, 0);
    expect(entity.qtdeNotas4, 0);
    expect(entity.qtdeNotas5, 0);
  });

  test('PrestadorEntity.toJson: deve retornar um json com os respectivos valores do obje', () {
    PrestadorEntity entity = PrestadorEntity.fromJson({"id": "1", "nome": "Pedro", "email": "pedro@gmail", "qtdeNotas1": 1, "qtdeNotas2": 2, "qtdeNotas3": 3, "qtdeNotas4": 4, "qtdeNotas5": 5});
    Map<String, dynamic> map = entity.toJson();
    expect(map['id'], "1");
    expect(map['nome'], "Pedro");
    expect(map['email'], "pedro@gmail");
    expect(map['qtdeNotas1'], 1);
    expect(map['qtdeNotas2'], 2);
    expect(map['qtdeNotas3'], 3);
    expect(map['qtdeNotas4'], 4);
    expect(map['qtdeNotas5'], 5);
  });

  test('v.copyWith: deve retornar uma copia do objeto com os respectivos valores passados nos paramentros', () {
    PrestadorEntity entity = PrestadorEntity.fromJson({"id": "1", "nome": "Pedro", "email": "pedro@gmail", "qtdeNotas1": 1, "qtdeNotas2": 2, "qtdeNotas3": 3, "qtdeNotas4": 4, "qtdeNotas5": 5});

    expect(entity.copyWith().id, "1");
    expect(entity.copyWith(id: '2').id, "2");

    expect(entity.copyWith().nome, "Pedro");
    expect(entity.copyWith(nome: 'João').nome, "João");

    expect(entity.copyWith().email, "pedro@gmail");
    expect(entity.copyWith(email: 'pedro@hotmail').email, "pedro@hotmail");

    expect(entity.copyWith().qtdeNotas1, 1);
    expect(entity.copyWith(qtdeNotas1: 2).qtdeNotas1, 2);

    expect(entity.copyWith().qtdeNotas2, 2);
    expect(entity.copyWith(qtdeNotas2: 3).qtdeNotas2, 3);

    expect(entity.copyWith().qtdeNotas3, 3);
    expect(entity.copyWith(qtdeNotas3: 4).qtdeNotas3, 4);

    expect(entity.copyWith().qtdeNotas4, 4);
    expect(entity.copyWith(qtdeNotas4: 5).qtdeNotas4, 5);

    expect(entity.copyWith().qtdeNotas5, 5);
    expect(entity.copyWith(qtdeNotas5: 6).qtdeNotas5, 6);
  });

  test('PrestadorEntity.qtdeNotas: deve retornar a soma das quantidades de notas', () {
    PrestadorEntity entity = PrestadorEntity.fromJson({
      "id": "1",
      "nome": "Pedro",
      "email": "pedro@gmail",
      "qtdeNotas1": 1,
      "qtdeNotas2": 2,
      "qtdeNotas3": 3,
      "qtdeNotas4": 4,
      "qtdeNotas5": 5,
    });

    expect(entity.qtdeNotas, 15);
  });

  test('PrestadorEntity.nota: deve retornar 0 se nao houver nenhuma nota em "qtdeNotas"', () {
    PrestadorEntity entity = PrestadorEntity.fromJson({
      "id": "1",
      "nome": "Pedro",
      "email": "pedro@gmail",
      "qtdeNotas1": 0,
      "qtdeNotas2": 0,
      "qtdeNotas3": 0,
      "qtdeNotas4": 0,
      "qtdeNotas5": 0,
    });

    expect(entity.nota, 0);
  });

  test('PrestadorEntity.nota: deve retornar 3 se houverem 1 em cada "qtdeNotas"', () {
    PrestadorEntity entity = PrestadorEntity.fromJson({
      "id": "1",
      "nome": "Pedro",
      "email": "pedro@gmail",
      "qtdeNotas1": 1,
      "qtdeNotas2": 1,
      "qtdeNotas3": 1,
      "qtdeNotas4": 1,
      "qtdeNotas5": 1,
    });

    expect(entity.nota, 3.0);
  });

  test('PrestadorEntity.nota: deve retornar 5 se houver somente 1 em "qtdeNotas5" e os demais qtdeNotas com zero', () {
    PrestadorEntity entity = PrestadorEntity.fromJson({
      "id": "1",
      "nome": "Pedro",
      "email": "pedro@gmail",
      "qtdeNotas1": 0,
      "qtdeNotas2": 0,
      "qtdeNotas3": 0,
      "qtdeNotas4": 0,
      "qtdeNotas5": 1,
    });

    expect(entity.nota, 5.0);
  });
}
