import 'package:flutter_test/flutter_test.dart';
import 'package:zeder/domain/entities/tipo_servico_entity.dart';

void main() {
  test('TipoServicoEntity.constructor: deve criar um objeto com os respectivos valores', () {
    TipoServicoEntity entity = TipoServicoEntity(id: "1", nome: "Eletricista", icone: "clear");
    expect(entity.id, "1");
    expect(entity.nome, "Eletricista");
    expect(entity.icone, "clear");
  });

  test('TipoServicoEntity.fromJson: deve criar um objeto com os respectivos valores passados no json', () {
    TipoServicoEntity entity = TipoServicoEntity.fromJson({"id": "1", "nome": "Eletricista", "icone": "clear"});
    expect(entity.id, "1");
    expect(entity.nome, "Eletricista");
    expect(entity.icone, "clear");
  });

  test('TipoServicoEntity.fromJson: deve criar um objeto com os respectivos valores "default" quando o json for vazio', () {
    TipoServicoEntity entity = TipoServicoEntity.fromJson({});
    expect(entity.id, '');
    expect(entity.nome, '');
    expect(entity.icone, '');
  });

  test('TipoServicoEntity.toJson: deve retornar um json com os respectivos valores do obje', () {
    TipoServicoEntity entity = TipoServicoEntity.fromJson({"id": "1", "nome": "Eletricista", "icone": "clear"});
    Map<String, dynamic> map = entity.toJson();
    expect(map['id'], "1");
    expect(map['nome'], "Eletricista");
    expect(map['icone'], "clear");
  });

  test('CidadeEntity.copyWith: deve retornar uma copia do objeto com os respectivos valores passados nos paramentros', () {
    TipoServicoEntity entity = TipoServicoEntity.fromJson({"id": "1", "nome": "Eletricista", "icone": "clear"});

    expect(entity.copyWith().id, "1");
    expect(entity.copyWith(id: '2').id, "2");

    expect(entity.copyWith().nome, "Eletricista");
    expect(entity.copyWith(nome: 'Motorista').nome, "Motorista");

    expect(entity.copyWith().icone, "clear");
    expect(entity.copyWith(icone: 'close').icone, "close");
  });

  test('TipoServicoAdapter.fromJson: deve retornar um objeto criado apartir de um Json', () {
    TipoServicoAdapter adapter = TipoServicoAdapter();
    var entity = adapter.fromJson({"id": "1", "nome": "Eletricista", "icone": "clear"});
    expect(entity.id, "1");
    expect(entity.nome, "Eletricista");
    expect(entity.icone, "clear");
  });

  test('TipoServicoAdapter.toJson: deve retornar um Json do objeto passado no parametro', () {
    TipoServicoAdapter adapter = TipoServicoAdapter();
    TipoServicoEntity entity = TipoServicoEntity.fromJson({"id": "1", "nome": "Eletricista", "icone": "clear"});
    Map<String, dynamic> map = adapter.toJson(entity);
    expect(map['id'], "1");
    expect(map['nome'], "Eletricista");
    expect(map['icone'], "clear");
  });
}
