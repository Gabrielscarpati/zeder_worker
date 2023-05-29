import 'package:flutter_test/flutter_test.dart';
import 'package:zeder/core/utils/date_utils.dart';
import 'package:zeder/domain/entities/servico_entity.dart';

void main() {
  test('ServicoEntity.constructor: deve criar um objeto com os respectivos valores', () {
    ServicoEntity entity = ServicoEntity(
      id: '1',
      dataCadastro: DateTime(2022, 12, 1),
      idTipoServico: '2',
      idCliente: '3',
      idCidade: '4',
      descricao: 'teste',
      valorInicial: 1.0,
      valorFinal: 2.0,
      dataInicial: DateTime(2023, 12, 1),
      dataFinal: DateTime(2024, 12, 1),
      flgDatasFlexiveis: true,
      status: 'teste',
      idsPropostasRecebidas: ['1', '2', '3'],
      idPropostaAceita: '5',
      idPrestador: '6',
      dataPropostaAceita: DateTime(2025, 12, 1),
      flgAvisoCliente: true,
      flgAvisoPrestador: false,
      idDisputa: '8',
      servico: '',
      icone: '',
    );
    expect(entity.id, "1");
    expect(entity.dataCadastro, DateTime(2022, 12, 1));
    expect(entity.idTipoServico, "2");
    expect(entity.idCliente, "3");
    expect(entity.idCidade, "4");
    expect(entity.descricao, "teste");
    expect(entity.valorInicial, 1.0);
    expect(entity.valorFinal, 2.0);
    expect(entity.dataInicial, DateTime(2023, 12, 1));
    expect(entity.dataFinal, DateTime(2024, 12, 1));
    expect(entity.flgDatasFlexiveis, true);
    expect(entity.status, "teste");
    expect(entity.idsPropostasRecebidas, ["1", "2", "3"]);
    expect(entity.idPropostaAceita, "5");
    expect(entity.idPrestador, "6");
    expect(entity.dataPropostaAceita, DateTime(2025, 12, 1));
    expect(entity.flgAvisoCliente, true);
    expect(entity.flgAvisoPrestador, false);
    expect(entity.idDisputa, "8");
  });

  test('ServicoEntity.fromJson: deve criar um objeto com os respectivos valores passados no json', () {
    ServicoEntity entity = ServicoEntity.fromJson({
      'id': '1',
      'dataCadastro': DateTime(2022, 12, 1),
      'idTipoServico': '2',
      'idCliente': '3',
      'idCidade': '4',
      'descricao': 'teste',
      'valorInicial': 1.0,
      'valorFinal': 2.0,
      'dataInicial': DateTime(2023, 12, 1),
      'dataFinal': DateTime(2024, 12, 1),
      'flgDatasFlexiveis': true,
      'status': 'teste',
      'idsPropostasRecebidas': ['1'],
      'idPropostaAceita': '5',
      'idPrestador': '6',
      'dataPropostaAceita': DateTime(2025, 12, 1),
      'flgAvisoCliente': true,
      'flgAvisoPrestador': false,
      'idDisputa': '8',
    });
    expect(entity.id, "1");
    expect(entity.dataCadastro, DateTime(2022, 12, 1));
    expect(entity.idTipoServico, "2");
    expect(entity.idCliente, "3");
    expect(entity.idCidade, "4");
    expect(entity.descricao, "teste");
    expect(entity.valorInicial, 1.0);
    expect(entity.valorFinal, 2.0);
    expect(entity.dataInicial, DateTime(2023, 12, 1));
    expect(entity.dataFinal, DateTime(2024, 12, 1));
    expect(entity.flgDatasFlexiveis, true);
    expect(entity.status, "teste");
    expect(entity.idsPropostasRecebidas, ["1"]);
    expect(entity.idPropostaAceita, "5");
    expect(entity.idPrestador, "6");
    expect(entity.dataPropostaAceita, DateTime(2025, 12, 1));
    expect(entity.flgAvisoCliente, true);
    expect(entity.flgAvisoPrestador, false);
    expect(entity.idDisputa, "8");
  });

  test('ServicoEntity.fromJson: deve criar um objeto com os respectivos valores "default" quando o json for vazio', () {
    ServicoEntity entity = ServicoEntity.fromJson({});
    expect(entity.id, "");
    expect(entity.dataCadastro, DateUtil.dateZero);
    expect(entity.idTipoServico, "");
    expect(entity.idCliente, "");
    expect(entity.idCidade, "");
    expect(entity.descricao, "");
    expect(entity.valorInicial, 0);
    expect(entity.valorFinal, 0);
    expect(entity.dataInicial, DateUtil.dateZero);
    expect(entity.dataFinal, DateUtil.dateZero);
    expect(entity.flgDatasFlexiveis, false);
    expect(entity.status, "");
    expect(entity.idsPropostasRecebidas, []);
    expect(entity.idPropostaAceita, "");
    expect(entity.idPrestador, "");
    expect(entity.dataPropostaAceita, DateUtil.dateZero);
    expect(entity.flgAvisoCliente, false);
    expect(entity.flgAvisoPrestador, false);
    expect(entity.idDisputa, "");
  });

  test('ServicoEntity.toJson: deve retornar um json com os respectivos valores do objeto', () {
    ServicoEntity entity = ServicoEntity.fromJson({
      'id': '1',
      'dataCadastro': DateTime(2022, 12, 1),
      'idTipoServico': '2',
      'idCliente': '3',
      'idCidade': '4',
      'descricao': 'teste',
      'valorInicial': 1.0,
      'valorFinal': 2.0,
      'dataInicial': DateTime(2023, 12, 1),
      'dataFinal': DateTime(2024, 12, 1),
      'flgDatasFlexiveis': true,
      'status': 'teste',
      'idsPropostasRecebidas': ['1'],
      'idPropostaAceita': '5',
      'idPrestador': '6',
      'dataPropostaAceita': DateTime(2025, 12, 1),
      'flgAvisoCliente': true,
      'flgAvisoPrestador': false,
      'idDisputa': '8',
    });
    Map<String, dynamic> map = entity.toJson();
    expect(map['id'], "1");
    expect(map['dataCadastro'], DateTime(2022, 12, 1).toJsonString());
    expect(map['idTipoServico'], "2");
    expect(map['idCliente'], "3");
    expect(map['idCidade'], "4");
    expect(map['descricao'], "teste");
    expect(map['valorInicial'], 1.0);
    expect(map['valorFinal'], 2.0);
    expect(map['dataInicial'], DateTime(2023, 12, 1).toJsonString());
    expect(map['dataFinal'], DateTime(2024, 12, 1).toJsonString());
    expect(map['flgDatasFlexiveis'], true);
    expect(map['status'], "teste");
    expect(map['idsPropostasRecebidas'], ["1"]);
    expect(map['idPropostaAceita'], "5");
    expect(map['idPrestador'], "6");
    expect(map['dataPropostaAceita'], DateTime(2025, 12, 1).toJsonString());
    expect(map['flgAvisoCliente'], true);
    expect(map['flgAvisoPrestador'], false);
    expect(map['idDisputa'], "8");
  });

  test('ServicoEntity.copyWith: deve retornar uma copia do objeto com os respectivos valores passados nos paramentros', () {
    ServicoEntity entity = ServicoEntity.fromJson({
      'id': '1',
      'dataCadastro': DateTime(2022, 12, 1),
      'idTipoServico': '2',
      'idCliente': '3',
      'idCidade': '4',
      'descricao': 'teste',
      'valorInicial': 1.0,
      'valorFinal': 2.0,
      'dataInicial': DateTime(2023, 12, 1),
      'dataFinal': DateTime(2024, 12, 1),
      'flgDatasFlexiveis': true,
      'status': 'teste',
      'idsPropostasRecebidas': ['1'],
      'idPropostaAceita': '5',
      'idPrestador': '6',
      'dataPropostaAceita': DateTime(2025, 12, 1),
      'flgAvisoCliente': true,
      'flgAvisoPrestador': false,
      'idDisputa': '8',
    });

    expect(entity.copyWith().id, "1");
    expect(entity.copyWith(id: '2').id, "2");

    expect(entity.copyWith().dataCadastro, DateTime(2022, 12, 1));
    expect(entity.copyWith(dataCadastro: DateTime(2023, 12, 1)).dataCadastro, DateTime(2023, 12, 1));

    expect(entity.copyWith().idTipoServico, "2");
    expect(entity.copyWith(idTipoServico: '3').idTipoServico, "3");

    expect(entity.copyWith().idCliente, "3");
    expect(entity.copyWith(idCliente: '4').idCliente, "4");

    expect(entity.copyWith().idCidade, "4");
    expect(entity.copyWith(idCidade: '5').idCidade, "5");

    expect(entity.copyWith().descricao, "teste");
    expect(entity.copyWith(descricao: 'teste2').descricao, "teste2");

    expect(entity.copyWith().valorInicial, 1.0);
    expect(entity.copyWith(valorInicial: 2.0).valorInicial, 2.0);

    expect(entity.copyWith().valorFinal, 2.0);
    expect(entity.copyWith(valorFinal: 3.0).valorFinal, 3.0);

    expect(entity.copyWith().dataInicial, DateTime(2023, 12, 1));
    expect(entity.copyWith(dataInicial: DateTime(2024, 12, 1)).dataInicial, DateTime(2024, 12, 1));

    expect(entity.copyWith().dataFinal, DateTime(2024, 12, 1));
    expect(entity.copyWith(dataFinal: DateTime(2025, 12, 1)).dataFinal, DateTime(2025, 12, 1));

    expect(entity.copyWith().flgDatasFlexiveis, true);
    expect(entity.copyWith(flgDatasFlexiveis: false).flgDatasFlexiveis, false);

    expect(entity.copyWith().status, "teste");
    expect(entity.copyWith(status: 'teste2').status, "teste2");

    expect(entity.copyWith().idsPropostasRecebidas, ["1"]);
    expect(entity.copyWith(idsPropostasRecebidas: ["2"]).idsPropostasRecebidas, ["2"]);

    expect(entity.copyWith().idPropostaAceita, "5");
    expect(entity.copyWith(idPropostaAceita: '6').idPropostaAceita, "6");

    expect(entity.copyWith().idPrestador, "6");
    expect(entity.copyWith(idPrestador: '7').idPrestador, "7");

    expect(entity.copyWith().dataPropostaAceita, DateTime(2025, 12, 1));
    expect(entity.copyWith(dataPropostaAceita: DateTime(2026, 12, 1)).dataPropostaAceita, DateTime(2026, 12, 1));

    expect(entity.copyWith().flgAvisoCliente, true);
    expect(entity.copyWith(flgAvisoCliente: false).flgAvisoCliente, false);

    expect(entity.copyWith().flgAvisoPrestador, false);
    expect(entity.copyWith(flgAvisoPrestador: true).flgAvisoPrestador, true);

    expect(entity.copyWith().idDisputa, "8");
    expect(entity.copyWith(idDisputa: '9').idDisputa, "9");
  });

  test('ServicoAdapter.fromJson: deve retornar um objeto criado apartir de um Json', () {
    ServicoAdapter adapter = ServicoAdapter();
    var entity = adapter.fromJson({
      'id': '1',
      'dataCadastro': DateTime(2022, 12, 1),
      'idTipoServico': '2',
      'idCliente': '3',
      'idCidade': '4',
      'descricao': 'teste',
      'valorInicial': 1.0,
      'valorFinal': 2.0,
      'dataInicial': DateTime(2023, 12, 1),
      'dataFinal': DateTime(2024, 12, 1),
      'flgDatasFlexiveis': true,
      'status': 'teste',
      'idsPropostasRecebidas': ['1'],
      'idPropostaAceita': '5',
      'idPrestador': '6',
      'dataPropostaAceita': DateTime(2025, 12, 1),
      'flgAvisoCliente': true,
      'flgAvisoPrestador': false,
      'idDisputa': '8',
    });
    expect(entity.id, "1");
    expect(entity.dataCadastro, DateTime(2022, 12, 1));
    expect(entity.idTipoServico, "2");
    expect(entity.idCliente, "3");
    expect(entity.idCidade, "4");
    expect(entity.descricao, "teste");
    expect(entity.valorInicial, 1.0);
    expect(entity.valorFinal, 2.0);
    expect(entity.dataInicial, DateTime(2023, 12, 1));
    expect(entity.dataFinal, DateTime(2024, 12, 1));
    expect(entity.flgDatasFlexiveis, true);
    expect(entity.status, "teste");
    expect(entity.idsPropostasRecebidas, ["1"]);
    expect(entity.idPropostaAceita, "5");
    expect(entity.idPrestador, "6");
    expect(entity.dataPropostaAceita, DateTime(2025, 12, 1));
    expect(entity.flgAvisoCliente, true);
    expect(entity.flgAvisoPrestador, false);
    expect(entity.idDisputa, "8");
  });

  test('ServicoAdapter.toJson: deve retornar um Json do objeto passado no parametro', () {
    ServicoAdapter adapter = ServicoAdapter();
    ServicoEntity entity = ServicoEntity.fromJson({
      'id': '1',
      'dataCadastro': DateTime(2022, 12, 1),
      'idTipoServico': '2',
      'idCliente': '3',
      'idCidade': '4',
      'descricao': 'teste',
      'valorInicial': 1.0,
      'valorFinal': 2.0,
      'dataInicial': DateTime(2023, 12, 1),
      'dataFinal': DateTime(2024, 12, 1),
      'flgDatasFlexiveis': true,
      'status': 'teste',
      'idsPropostasRecebidas': ['1'],
      'idPropostaAceita': '5',
      'idPrestador': '6',
      'dataPropostaAceita': DateTime(2025, 12, 1),
      'flgAvisoCliente': true,
      'flgAvisoPrestador': false,
      'idDisputa': '8',
    });
    Map<String, dynamic> map = adapter.toJson(entity);

    expect(map['id'], "1");
    expect(map['dataCadastro'], DateTime(2022, 12, 1).toJsonString());
    expect(map['idTipoServico'], "2");
    expect(map['idCliente'], "3");
    expect(map['idCidade'], "4");
    expect(map['descricao'], "teste");
    expect(map['valorInicial'], 1.0);
    expect(map['valorFinal'], 2.0);
    expect(map['dataInicial'], DateTime(2023, 12, 1).toJsonString());
    expect(map['dataFinal'], DateTime(2024, 12, 1).toJsonString());
    expect(map['flgDatasFlexiveis'], true);
    expect(map['status'], "teste");
    expect(map['idsPropostasRecebidas'], ["1"]);
    expect(map['idPropostaAceita'], "5");
    expect(map['idPrestador'], "6");
    expect(map['dataPropostaAceita'], DateTime(2025, 12, 1).toJsonString());
    expect(map['flgAvisoCliente'], true);
    expect(map['flgAvisoPrestador'], false);
    expect(map['idDisputa'], "8");
  });
}
