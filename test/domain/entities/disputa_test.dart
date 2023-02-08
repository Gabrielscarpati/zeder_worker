import 'package:flutter_test/flutter_test.dart';
import 'package:zeder/core/utils/date_utils.dart';
import 'package:zeder/domain/entities/disputa_entity.dart';

void main() {
  test('DisputaEntity.constructor: deve criar um objeto com os respectivos valores', () {
    DisputaEntity entity = DisputaEntity(
      id: '1',
      idChat: '1234',
      idProprietario: '4567',
      dataCriacao: DateTime(2023, 02, 05),
      dataLeitura: DateTime(2023, 02, 05),
    );
    expect(entity.id, "1");
    expect(entity.idChat, "1234");
    expect(entity.idProprietario, "4567");
    expect(entity.dataCriacao, DateTime(2023, 02, 05));
    expect(entity.dataLeitura, DateTime(2023, 02, 05));
  });

  test('DisputaEntity.fromJson: deve criar um objeto com os respectivos valores passados no json', () {
    DisputaEntity entity = DisputaEntity.fromJson({
      "id": '1',
      "idChat": '1234',
      "idProprietario": '4567',
      "dataCriacao": DateTime(2023, 02, 05),
      "dataLeitura": DateTime(2023, 02, 05),
    });
    expect(entity.id, "1");
    expect(entity.idChat, "1234");
    expect(entity.idProprietario, "4567");
    expect(entity.dataCriacao, DateTime(2023, 02, 05));
    expect(entity.dataLeitura, DateTime(2023, 02, 05));
  });

  test('DisputaEntity.fromJson: deve criar um objeto com os respectivos valores "default" quando o json for vazio', () {
    DisputaEntity entity = DisputaEntity.fromJson({});
    expect(entity.id, '');
    expect(entity.idChat, '');
    expect(entity.idProprietario, '');
    expect(entity.dataCriacao, DateUtil.dateZero);
    expect(entity.dataLeitura, DateUtil.dateZero);
  });

  test('DisputaEntity.toJson: deve retornar um json com os respectivos valores do obje', () {
    DisputaEntity entity = DisputaEntity.fromJson({
      "id": '1',
      "idChat": '1234',
      "idProprietario": '4567',
      "dataCriacao": DateTime(2023, 02, 05).toJsonString(),
      "dataLeitura": DateTime(2023, 02, 05).toJsonString(),
    });
    Map<String, dynamic> map = entity.toJson();
    expect(map['id'], "1");
    expect(map['idChat'], "1234");
    expect(map['idProprietario'], "4567");
    expect(map['dataCriacao'], DateTime(2023, 02, 05).toJsonString());
    expect(map['dataLeitura'], DateTime(2023, 02, 05).toJsonString());
  });

  test('DisputaEntity.copyWith: deve retornar uma copia do objeto com os respectivos valores passados nos paramentros', () {
    DisputaEntity entity = DisputaEntity.fromJson({
      "id": '1',
      "idChat": '1234',
      "idProprietario": '4567',
      "dataCriacao": DateTime(2023, 02, 05).toJsonString(),
      "dataLeitura": DateTime(2023, 02, 05).toJsonString(),
    });

    expect(entity.copyWith().id, "1");
    expect(entity.copyWith(id: '2').id, "2");

    expect(entity.copyWith().idChat, "1234");
    expect(entity.copyWith(idChat: '12').idChat, "12");

    expect(entity.copyWith().idProprietario, "4567");
    expect(entity.copyWith(idProprietario: '123').idProprietario, "123");

    expect(entity.copyWith().dataCriacao, DateTime(2023, 02, 05));
    expect(entity.copyWith(dataCriacao: DateTime(2023, 02, 06)).dataCriacao, DateTime(2023, 02, 06));

    expect(entity.copyWith().dataLeitura, DateTime(2023, 02, 05));
    expect(entity.copyWith(dataLeitura: DateTime(2023, 02, 06)).dataLeitura, DateTime(2023, 02, 06));
  });

  test('DisputaAdapter.fromJson: deve retornar um objeto criado apartir de um Json', () {
    DisputaAdapter adapter = DisputaAdapter();
    var entity = adapter.fromJson({
      "id": '1',
      "idChat": '1234',
      "idProprietario": '4567',
      "dataCriacao": DateTime(2023, 02, 05).toJsonString(),
      "dataLeitura": DateTime(2023, 02, 05).toJsonString(),
    });
    expect(entity.id, "1");
    expect(entity.idChat, "1234");
    expect(entity.idProprietario, "4567");
    expect(entity.dataCriacao, DateTime(2023, 02, 05));
    expect(entity.dataLeitura, DateTime(2023, 02, 05));
  });

  test('DisputaAdapter.toJson: deve retornar um Json do objeto passado no parametro', () {
    DisputaAdapter adapter = DisputaAdapter();
    DisputaEntity entity = DisputaEntity.fromJson({
      "id": '1',
      "idChat": '1234',
      "idProprietario": '4567',
      "dataCriacao": DateTime(2023, 02, 05).toJsonString(),
      "dataLeitura": DateTime(2023, 02, 05).toJsonString(),
    });

    Map<String, dynamic> map = adapter.toJson(entity);
    expect(map['id'], "1");
    expect(map['idChat'], "1234");
    expect(map['idProprietario'], "4567");
    expect(map['dataCriacao'], DateTime(2023, 02, 05).toJsonString());
    expect(map['dataLeitura'], DateTime(2023, 02, 05).toJsonString());
  });
}
