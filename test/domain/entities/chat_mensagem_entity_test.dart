import 'package:flutter_test/flutter_test.dart';
import 'package:zeder/core/utils/date_utils.dart';
import 'package:zeder/domain/entities/chat_mensagem_entity.dart';

void main() {
  test('ChatMensagemEntity.constructor: deve criar um objeto com os respectivos valores', () {
    ChatMensagemEntity entity = ChatMensagemEntity(
      id: "1",
      idChat: "2",
      idProprietario: "3",
      dataCriacao: DateTime(2023, 02, 05),
      dataLeitura: DateTime(2023, 02, 06),
    );
    expect(entity.id, "1");
    expect(entity.idChat, "2");
    expect(entity.idProprietario, "3");
    expect(entity.dataCriacao, DateTime(2023, 02, 05));
    expect(entity.dataLeitura, DateTime(2023, 02, 06));
  });

  test('ChatMensagemEntity.fromJson: deve criar um objeto com os respectivos valores passados no json', () {
    ChatMensagemEntity entity = ChatMensagemEntity.fromJson({
      "id": "1",
      "idChat": "2",
      "idProprietario": "3",
      "dataCriacao": "2023-02-05",
      "dataLeitura": "2023-02-06",
    });
    expect(entity.id, "1");
    expect(entity.idChat, "2");
    expect(entity.idProprietario, "3");
    expect(entity.dataCriacao, DateTime(2023, 02, 05));
    expect(entity.dataLeitura, DateTime(2023, 02, 06));
  });

  test('ChatMensagemEntity.fromJson: deve criar um objeto com os respectivos valores "default" quando o json for vazio', () {
    ChatMensagemEntity entity = ChatMensagemEntity.fromJson({});
    expect(entity.id, "");
    expect(entity.idChat, "");
    expect(entity.idProprietario, "");
    expect(entity.dataCriacao, DateUtil.dateZero);
    expect(entity.dataLeitura, DateUtil.dateZero);
  });

  test('ChatMensagemEntity.toJson: deve retornar um json com os respectivos valores do objeto', () {
    ChatMensagemEntity entity = ChatMensagemEntity.fromJson({
      "id": "1",
      "idChat": "2",
      "idProprietario": "3",
      "dataCriacao": "2023-02-05",
      "dataLeitura": "2023-02-06",
    });
    Map<String, dynamic> map = entity.toJson();
    expect(map['id'], "1");
    expect(map['idChat'], "2");
    expect(map['idProprietario'], "3");
    expect(map['dataCriacao'], DateTime(2023, 02, 05).toJsonString());
    expect(map['dataLeitura'], DateTime(2023, 02, 06).toJsonString());
  });

  test('ChatMensagemEntity.copyWith: deve retornar uma copia do objeto com os respectivos valores passados nos paramentros', () {
    ChatMensagemEntity entity = ChatMensagemEntity.fromJson({
      "id": "1",
      "idChat": "2",
      "idProprietario": "3",
      "dataCriacao": "2023-02-05",
      "dataLeitura": "2023-02-06",
    });

    expect(entity.copyWith().id, "1");
    expect(entity.copyWith(id: '2').id, "2");

    expect(entity.copyWith().idChat, "2");
    expect(entity.copyWith(idChat: '3').idChat, "3");

    expect(entity.copyWith().idProprietario, "3");
    expect(entity.copyWith(idProprietario: '4').idProprietario, "4");

    expect(entity.copyWith().dataCriacao, DateTime(2023, 02, 05));
    expect(entity.copyWith(dataCriacao: DateTime(2023, 02, 06)).dataCriacao, DateTime(2023, 02, 06));

    expect(entity.copyWith().dataLeitura, DateTime(2023, 02, 06));
    expect(entity.copyWith(dataLeitura: DateTime(2023, 02, 07)).dataLeitura, DateTime(2023, 02, 07));
  });

  test('ChatMensagemAdapter.fromJson: deve retornar um objeto criado apartir de um Json', () {
    ChatMensagemAdapter adapter = ChatMensagemAdapter();
    var entity = adapter.fromJson({
      "id": "1",
      "idChat": "2",
      "idProprietario": "3",
      "dataCriacao": "2023-02-05",
      "dataLeitura": "2023-02-06",
    });
    expect(entity.id, "1");
    expect(entity.idChat, "2");
    expect(entity.idProprietario, "3");
    expect(entity.dataCriacao, DateTime(2023, 02, 05));
    expect(entity.dataLeitura, DateTime(2023, 02, 06));
  });

  test('ChatMensagemAdapter.toJson: deve retornar um Json do objeto passado no parametro', () {
    ChatMensagemAdapter adapter = ChatMensagemAdapter();
    ChatMensagemEntity entity = ChatMensagemEntity.fromJson({
      "id": "1",
      "idChat": "2",
      "idProprietario": "3",
      "dataCriacao": "2023-02-05",
      "dataLeitura": "2023-02-06",
    });
    Map<String, dynamic> map = adapter.toJson(entity);
    expect(map['id'], "1");
    expect(map['idChat'], "2");
    expect(map['idProprietario'], "3");
    expect(map['dataCriacao'], DateTime(2023, 02, 05).toJsonString());
    expect(map['dataLeitura'], DateTime(2023, 02, 06).toJsonString());
  });
}
