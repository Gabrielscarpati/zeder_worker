import 'package:flutter_test/flutter_test.dart';
import 'package:zeder/domain/entities/chat_entity.dart';

void main() {
  test('ChatEntity.constructor: deve criar um objeto com os respectivos valores', () {
    ChatEntity entity = ChatEntity(id: "1", idCliente: "2", idPrestador: "3", qtdMsgNaoLidaCliente: 1, qtdMsgNaoLidaPrestador: 2, ultMsgEnviadaCliente: "ultMsgEnviadaCliente", ultMsgEnviadaPrestador: "ultMsgEnviadaPrestador");
    expect(entity.id, "1");
    expect(entity.idCliente, "2");
    expect(entity.idPrestador, "3");
    expect(entity.qtdMsgNaoLidaCliente, 1);
    expect(entity.qtdMsgNaoLidaPrestador, 2);
    expect(entity.ultMsgEnviadaCliente, "ultMsgEnviadaCliente");
    expect(entity.ultMsgEnviadaPrestador, "ultMsgEnviadaPrestador");
  });

  test('ChatEntity.fromJson: deve criar um objeto com os respectivos valores passados no json', () {
    ChatEntity entity = ChatEntity.fromJson({"id": "1", "idCliente": "2", "idPrestador": "3", "qtdMsgNaoLidaCliente": 1, "qtdMsgNaoLidaPrestador": 2, "ultMsgEnviadaCliente": "ultMsgEnviadaCliente", "ultMsgEnviadaPrestador": "ultMsgEnviadaPrestador"});
    expect(entity.id, "1");
    expect(entity.idCliente, "2");
    expect(entity.idPrestador, "3");
    expect(entity.qtdMsgNaoLidaCliente, 1);
    expect(entity.qtdMsgNaoLidaPrestador, 2);
    expect(entity.ultMsgEnviadaCliente, "ultMsgEnviadaCliente");
    expect(entity.ultMsgEnviadaPrestador, "ultMsgEnviadaPrestador");
  });

  test('ChatEntity.fromJson: deve criar um objeto com os respectivos valores "default" quando o json for vazio', () {
    ChatEntity entity = ChatEntity.fromJson({});
    expect(entity.id, "");
    expect(entity.idCliente, "");
    expect(entity.idPrestador, "");
    expect(entity.qtdMsgNaoLidaCliente, 0);
    expect(entity.qtdMsgNaoLidaPrestador, 0);
    expect(entity.ultMsgEnviadaCliente, "");
    expect(entity.ultMsgEnviadaPrestador, "");
  });

  test('ChatEntity.toJson: deve retornar um json com os respectivos valores do obje', () {
    ChatEntity entity = ChatEntity.fromJson({
      "id": "1",
      "idCliente": "2",
      "idPrestador": "3",
      "qtdMsgNaoLidaCliente": 1,
      "qtdMsgNaoLidaPrestador": 2,
      "ultMsgEnviadaCliente": "ultMsgEnviadaCliente",
      "ultMsgEnviadaPrestador": "ultMsgEnviadaPrestador",
    });
    Map<String, dynamic> map = entity.toJson();
    expect(map['id'], "1");
    expect(map['idCliente'], "2");
    expect(map['idPrestador'], "3");
    expect(map['qtdMsgNaoLidaCliente'], 1);
    expect(map['qtdMsgNaoLidaPrestador'], 2);
    expect(map['ultMsgEnviadaCliente'], "ultMsgEnviadaCliente");
    expect(map['ultMsgEnviadaPrestador'], "ultMsgEnviadaPrestador");
  });

  test('ChatEntity.copyWith: deve retornar uma copia do objeto com os respectivos valores passados nos paramentros', () {
    ChatEntity entity = ChatEntity.fromJson({
      "id": "1",
      "idCliente": "2",
      "idPrestador": "3",
      "qtdMsgNaoLidaCliente": 1,
      "qtdMsgNaoLidaPrestador": 2,
      "ultMsgEnviadaCliente": "ultMsgEnviadaCliente",
      "ultMsgEnviadaPrestador": "ultMsgEnviadaPrestador",
    });

    expect(entity.copyWith().id, "1");
    expect(entity.copyWith(id: '2').id, "2");

    expect(entity.copyWith().idCliente, "2");
    expect(entity.copyWith(idCliente: '3').idCliente, "3");

    expect(entity.copyWith().idPrestador, "3");
    expect(entity.copyWith(idPrestador: '4').idPrestador, "4");

    expect(entity.copyWith().qtdMsgNaoLidaCliente, 1);
    expect(entity.copyWith(qtdMsgNaoLidaCliente: 2).qtdMsgNaoLidaCliente, 2);

    expect(entity.copyWith().qtdMsgNaoLidaPrestador, 2);
    expect(entity.copyWith(qtdMsgNaoLidaPrestador: 3).qtdMsgNaoLidaPrestador, 3);

    expect(entity.copyWith().ultMsgEnviadaCliente, "ultMsgEnviadaCliente");
    expect(entity.copyWith(ultMsgEnviadaCliente: "asdfasfasf").ultMsgEnviadaCliente, "asdfasfasf");

    expect(entity.copyWith().ultMsgEnviadaPrestador, "ultMsgEnviadaPrestador");
    expect(entity.copyWith(ultMsgEnviadaPrestador: "asdfasfasf").ultMsgEnviadaPrestador, "asdfasfasf");
  });
}
