import 'package:flutter_test/flutter_test.dart';
import 'package:zeder/core/core.dart';
import 'package:zeder/domain/entities/proposta_entity.dart';

void main() {
  test('PropostaEntity.constructor: deve criar um objeto com os respectivos valores', () {
    PropostaEntity entity = PropostaEntity(id: '1', idPrestador: '2', idServico: '3', dataInicio: DateTime(2023, 02, 01), valor: 150.50, consideracoes: 'consideracoes', flgAvisoPrestador: true, flgAvisoCliente: false, idCliente: '', dataPropostaEnviada: DateTime.now(), nomeServico: '');
    expect(entity.id, "1");
    expect(entity.idPrestador, "2");
    expect(entity.idServico, "3");
    expect(entity.dataInicio, DateTime(2023, 02, 01));
    expect(entity.valor, 150.50);
    expect(entity.consideracoes, "consideracoes");
    expect(entity.flgAvisoPrestador, true);
    expect(entity.flgAvisoCliente, false);
  });

  test('PropostaEntity.fromJson: deve criar um objeto com os respectivos valores passados no json', () {
    PropostaEntity entity = PropostaEntity.fromJson({"id": "1", "idPrestador": "2", "idServico": "3", "dataInicio": "2023-02-01", "valor": 150.50, "consideracoes": 'consideracoes', "flgAvisoPrestador": true, "flgAvisoCliente": false});
    expect(entity.id, "1");
    expect(entity.idPrestador, "2");
    expect(entity.idServico, "3");
    expect(entity.dataInicio, DateTime(2023, 02, 01));
    expect(entity.valor, 150.50);
    expect(entity.consideracoes, "consideracoes");
    expect(entity.flgAvisoPrestador, true);
    expect(entity.flgAvisoCliente, false);
  });

  test('PropostaEntity.fromJson: deve criar um objeto com os respectivos valores "default" quando o json for vazio', () {
    PropostaEntity entity = PropostaEntity.fromJson({});
    expect(entity.id, "");
    expect(entity.idPrestador, "");
    expect(entity.idServico, "");
    expect(entity.dataInicio, DateUtil.dateZero);
    expect(entity.valor, 0);
    expect(entity.consideracoes, "");
    expect(entity.flgAvisoPrestador, false);
    expect(entity.flgAvisoCliente, false);
  });

  test('PropostaEntity.toJson: deve retornar um json com os respectivos valores do obje', () {
    PropostaEntity entity = PropostaEntity.fromJson({
      "id": "1",
      "idPrestador": "2",
      "idServico": "3",
      "dataInicio": "2023-02-01",
      "valor": 150.50,
      "consideracoes": 'consideracoes',
      "flgAvisoPrestador": true,
      "flgAvisoCliente": false,
    });
    Map<String, dynamic> map = entity.toJson();
    expect(map['id'], "1");
    expect(map['idPrestador'], "2");
    expect(map['idServico'], "3");
    expect(map['dataInicio'], DateTime(2023, 02, 01).toJsonString());
    expect(map['valor'], 150.50);
    expect(map['consideracoes'], "consideracoes");
    expect(map['flgAvisoPrestador'], true);
    expect(map['flgAvisoCliente'], false);
  });

  test('PropostaEntity.copyWith: deve retornar uma copia do objeto com os respectivos valores passados nos paramentros', () {
    PropostaEntity entity = PropostaEntity.fromJson({
      "id": "1",
      "idPrestador": "2",
      "idServico": "3",
      "dataInicio": "2023-02-01",
      "valor": 150.50,
      "consideracoes": 'consideracoes',
      "flgAvisoPrestador": true,
      "flgAvisoCliente": false,
    });

    expect(entity.copyWith().id, "1");
    expect(entity.copyWith(id: '2').id, "2");

    expect(entity.copyWith().idPrestador, "2");
    expect(entity.copyWith(idPrestador: '3').idPrestador, "3");

    expect(entity.copyWith().idServico, "3");
    expect(entity.copyWith(idServico: '4').idServico, "4");

    expect(entity.copyWith().dataInicio, DateTime(2023, 02, 01));
    expect(entity.copyWith(dataInicio: DateTime(2024, 02, 01)).dataInicio, DateTime(2024, 02, 01));

    expect(entity.copyWith().valor, 150.50);
    expect(entity.copyWith(valor: 100).valor, 100);

    expect(entity.copyWith().consideracoes, "consideracoes");
    expect(entity.copyWith(consideracoes: 'asdf').consideracoes, "asdf");

    expect(entity.copyWith().flgAvisoPrestador, true);
    expect(entity.copyWith(flgAvisoPrestador: false).flgAvisoPrestador, false);

    expect(entity.copyWith().flgAvisoCliente, false);
    expect(entity.copyWith(flgAvisoCliente: true).flgAvisoCliente, true);
  });

  test('PropostaAdapter.fromJson: deve retornar um objeto criado apartir de um Json', () {
    PropostaAdapter adapter = PropostaAdapter();

    var entity = adapter.fromJson({
      "id": "1",
      "idPrestador": "2",
      "idServico": "3",
      "dataInicio": "2023-02-01",
      "valor": 150.50,
      "consideracoes": 'consideracoes',
      "flgAvisoPrestador": true,
      "flgAvisoCliente": false,
    });
    expect(entity.copyWith().id, "1");
    expect(entity.copyWith(id: '2').id, "2");

    expect(entity.copyWith().idPrestador, "2");
    expect(entity.copyWith(idPrestador: '3').idPrestador, "3");

    expect(entity.copyWith().idServico, "3");
    expect(entity.copyWith(idServico: '4').idServico, "4");

    expect(entity.copyWith().dataInicio, DateTime(2023, 02, 01));
    expect(entity.copyWith(dataInicio: DateTime(2024, 02, 01)).dataInicio, DateTime(2024, 02, 01));

    expect(entity.copyWith().valor, 150.50);
    expect(entity.copyWith(valor: 100).valor, 100);

    expect(entity.copyWith().consideracoes, "consideracoes");
    expect(entity.copyWith(consideracoes: 'asdf').consideracoes, "asdf");

    expect(entity.copyWith().flgAvisoPrestador, true);
    expect(entity.copyWith(flgAvisoPrestador: false).flgAvisoPrestador, false);

    expect(entity.copyWith().flgAvisoCliente, false);
    expect(entity.copyWith(flgAvisoCliente: true).flgAvisoCliente, true);
  });

  test('PropostaAdapter.toJson: deve retornar um Json do objeto passado no parametro', () {
    PropostaAdapter adapter = PropostaAdapter();
    PropostaEntity entity = PropostaEntity.fromJson({
      "id": "1",
      "idPrestador": "2",
      "idServico": "3",
      "dataInicio": "2023-02-01",
      "valor": 150.50,
      "consideracoes": 'consideracoes',
      "flgAvisoPrestador": true,
      "flgAvisoCliente": false,
    });
    Map<String, dynamic> map = adapter.toJson(entity);

    expect(map['id'], "1");
    expect(map['idPrestador'], "2");
    expect(map['idServico'], "3");
    expect(map['dataInicio'], DateTime(2023, 02, 01).toJsonString());
    expect(map['valor'], 150.50);
    expect(map['consideracoes'], "consideracoes");
    expect(map['flgAvisoPrestador'], true);
    expect(map['flgAvisoCliente'], false);
  });
}
