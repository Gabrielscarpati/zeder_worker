import 'package:flutter_test/flutter_test.dart';
import 'package:zeder/domain/entities/cliente_entity.dart';

void main() {
  test('ClienteEntity.constructor: deve criar um objeto com os respectivos valores', () {
    ClienteEntity entity = ClienteEntity(id: '1', nome: 'Gabriel', email: 'gabriel@', cpfCnpj: '12345.456', tipoPessoa: 'F', profile_picture: '');
    expect(entity.id, "1");
    expect(entity.nome, "Gabriel");
    expect(entity.email, "gabriel@");
    expect(entity.cpfCnpj, "12345.456");
    expect(entity.tipoPessoa, "F");
  });

  test('ClienteEntity.fromJson: deve criar um objeto com os respectivos valores passados no json', () {
    ClienteEntity entity = ClienteEntity.fromJson({'id': '1', 'nome': 'Gabriel', 'email': 'gabriel@', 'cpfCnpj': '12345.456', 'tipoPessoa': 'F'});
    expect(entity.id, "1");
    expect(entity.nome, "Gabriel");
    expect(entity.email, "gabriel@");
    expect(entity.cpfCnpj, "12345.456");
    expect(entity.tipoPessoa, "F");
  });

  test('ClienteEntity.fromJson: deve criar um objeto com os respectivos valores "default" quando o json for vazio', () {
    ClienteEntity entity = ClienteEntity.fromJson({});
    expect(entity.id, '');
    expect(entity.nome, '');
    expect(entity.email, "");
    expect(entity.cpfCnpj, "");
    expect(entity.tipoPessoa, "");
  });

  test('ClienteEntity.toJson: deve retornar um json com os respectivos valores do objeto', () {
    ClienteEntity entity = ClienteEntity.fromJson({'id': '1', 'nome': 'Gabriel', 'email': 'gabriel@', 'cpfCnpj': '12345.456', 'tipoPessoa': 'F'});
    Map<String, dynamic> map = entity.toJson();
    expect(map['id'], "1");
    expect(map['nome'], "Gabriel");
    expect(map['email'], "gabriel@");
    expect(map['cpfCnpj'], "12345.456");
    expect(map['tipoPessoa'], "F");
  });

  test('ClienteEntity.copyWith: deve retornar uma copia do objeto com os respectivos valores passados nos paramentros', () {
    ClienteEntity entity = ClienteEntity.fromJson({'id': '1', 'nome': 'Gabriel', 'email': 'gabriel@', 'cpfCnpj': '12345.456', 'tipoPessoa': 'F'});

    expect(entity.copyWith().id, "1");
    expect(entity.copyWith(id: '2').id, "2");

    expect(entity.copyWith().nome, "Gabriel");
    expect(entity.copyWith(nome: 'Carlos').nome, "Carlos");

    expect(entity.copyWith().email, "gabriel@");
    expect(entity.copyWith(email: 'gabriel@gmail').email, "gabriel@gmail");

    expect(entity.copyWith().cpfCnpj, "12345.456");
    expect(entity.copyWith(cpfCnpj: '12345.456444').cpfCnpj, "12345.456444");

    expect(entity.copyWith().tipoPessoa, "F");
    expect(entity.copyWith(tipoPessoa: 'J').tipoPessoa, "J");
  });

  test('ClienteAdapter.fromJson: deve retornar um objeto criado apartir de um Json', () {
    ClienteAdapter adapter = ClienteAdapter();
    var entity = adapter.fromJson({'id': '1', 'nome': 'Gabriel', 'email': 'gabriel@', 'cpfCnpj': '12345.456', 'tipoPessoa': 'F'});
    expect(entity.id, "1");
    expect(entity.nome, "Gabriel");
    expect(entity.email, "gabriel@");
    expect(entity.cpfCnpj, "12345.456");
    expect(entity.tipoPessoa, "F");
  });

  test('ClienteAdapter.toJson: deve retornar um Json do objeto passado no parametro', () {
    ClienteAdapter adapter = ClienteAdapter();
    ClienteEntity entity = ClienteEntity.fromJson({'id': '1', 'nome': 'Gabriel', 'email': 'gabriel@', 'cpfCnpj': '12345.456', 'tipoPessoa': 'F'});
    Map<String, dynamic> map = adapter.toJson(entity);
    expect(map['id'], "1");
    expect(map['nome'], "Gabriel");
    expect(map['email'], "gabriel@");
    expect(map['cpfCnpj'], "12345.456");
    expect(map['tipoPessoa'], "F");
  });
}
