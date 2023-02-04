import 'package:flutter_test/flutter_test.dart';
import 'package:zeder/core/utils/date_utils.dart';
import 'package:zeder/domain/entities/servico_entity.dart';

void main() {

  test('ServicoEntity.constructor: deve criar um objeto com os respectivos valores', () {
    ServicoEntity entity = ServicoEntity(
      id: '1',
      dataCadastro: DateTime(2022,12,1),
      idTipoServico: '2',
      idCliente: '3',
      idCidade: '4',
      descricao: 'teste',
      valorInicial: 1.0,
      valorFinal: 2.0,
      dataInicial: DateTime(2023,12,1),
      dataFinal: DateTime(2024,12,1),
      flgDatasFlexiveis: true,
      status: 'teste',
      idsPropostasRecebidas: ['1'],
      idPropostaAceita: '5',
      idPrestador: '6',
      dataPropostaAceita: DateTime(2025,12,1),
      flgAvisoCliente: true,
      flgAvisoPrestador: false,
      idDisputa: '8',
     );
    expect(entity.id, "1");
    expect(entity.dataCadastro, DateTime(2022,12,1));
    expect(entity.idTipoServico, "2");
    expect(entity.idCliente, "3");
    expect(entity.idCidade, "4");
    expect(entity.descricao, "teste");
    expect(entity.valorInicial, 1.0);
    expect(entity.valorFinal, 2.0);
    expect(entity.dataInicial, DateTime(2023,12,1));
    expect(entity.dataFinal, DateTime(2024,12,1));
    expect(entity.flgDatasFlexiveis, true);
    expect(entity.status, "teste");
    expect(entity.idsPropostasRecebidas, ["1"]);
    expect(entity.idPropostaAceita, "5");
    expect(entity.idPrestador, "6");
    expect(entity.dataPropostaAceita, DateTime(2025,12,1));
    expect(entity.flgAvisoCliente, true);
    expect(entity.flgAvisoPrestador, false);
    expect(entity.idDisputa, "8");
  });

  test('ServicoEntity.fromJson: deve criar um objeto com os respectivos valores passados no json', ()
  {
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
    Map<String,dynamic> map = entity.toJson();
    expect(map['id'], "1");
    expect(map['dataCadastro'], DateTime(2022, 12, 1));
    expect(map['idTipoServico'], "2");
    expect(map['idCliente'], "3");
    expect(map['idCidade'], "4");
    expect(map['descricao'], "teste");
    expect(map['valorInicial'], 1.0);
    expect(map['valorFinal'], 2.0);
    expect(map['dataInicial'], DateTime(2023, 12, 1));
    expect(map['dataFinal'], DateTime(2024, 12, 1));
    expect(map['flgDatasFlexiveis'], true);
    expect(map['status'], "teste");
    expect(map['idsPropostasRecebidas'], ["1"]);
    expect(map['idPropostaAceita'], "5");
    expect(map['idPrestador'], "6");
    expect(map['dataPropostaAceita'], DateTime(2025, 12, 1));
    expect(map['flgAvisoCliente'], true);
    expect(map['flgAvisoPrestador'], false);
    expect(map['idDisputa'], "8");
  });


/*
  test('ClienteEntity.copyWith: deve retornar uma copia do objeto com os respectivos valores passados nos paramentros', () {
    ClienteEntity entity = ClienteEntity.fromJson({'id': '1', 'nome': 'Gabriel', 'email': 'gabriel@', 'cpfCnpj': '12345.456', 'tipoPessoa': 'F'});

    expect(entity.copyWith().id, "1");
    expect(entity.copyWith(id:'2').id, "2");

    expect(entity.copyWith().nome, "Gabriel");
    expect(entity.copyWith(nome:'Carlos').nome, "Carlos");

    expect(entity.copyWith().email, "gabriel@");
    expect(entity.copyWith(email:'gabriel@gmail').email, "gabriel@gmail");

    expect(entity.copyWith().cpfCnpj, "12345.456");
    expect(entity.copyWith(cpfCnpj:'12345.456444').cpfCnpj, "12345.456444");

    expect(entity.copyWith().tipoPessoa, "F");
    expect(entity.copyWith(tipoPessoa:'J').tipoPessoa, "J");
  });
*/
}


