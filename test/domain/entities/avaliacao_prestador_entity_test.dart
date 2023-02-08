import 'package:flutter_test/flutter_test.dart';
import 'package:zeder/core/utils/date_utils.dart';
import 'package:zeder/domain/entities/avaliacao_prestador_entity.dart';

void main() {
  test('AvaliacaoPrestadorEntity.constructor: deve criar um objeto com os respectivos valores', () {
    AvaliacaoPrestadorEntity entity = AvaliacaoPrestadorEntity(
      id: '1',
      idPrestador: '1234',
      idCliente: '4567',
      nota: 4.5656,
      comentario: 'muito bom',
      data: DateTime(2023, 02, 05),
    );
    expect(entity.id, "1");
    expect(entity.idPrestador, "1234");
    expect(entity.idCliente, "4567");
    expect(entity.nota, 4.5656);
    expect(entity.comentario, "muito bom");
    expect(entity.data, DateTime(2023, 02, 05));
  });

  test('AvaliacaoPrestadorEntity.fromJson: deve criar um objeto com os respectivos valores passados no json', () {
    AvaliacaoPrestadorEntity entity = AvaliacaoPrestadorEntity.fromJson({
      "id": '1',
      "idPrestador": '1234',
      "idCliente": '4567',
      "nota": 4.5656,
      "comentario": 'muito bom',
      "data": DateTime(2023, 02, 05).toJsonString(),
    });
    expect(entity.id, "1");
    expect(entity.idPrestador, "1234");
    expect(entity.idCliente, "4567");
    expect(entity.nota, 4.5656);
    expect(entity.comentario, "muito bom");
    expect(entity.data, DateTime(2023, 02, 05));
  });

  test('AvaliacaoPrestadorEntity.fromJson: deve criar um objeto com os respectivos valores "default" quando o json for vazio', () {
    AvaliacaoPrestadorEntity entity = AvaliacaoPrestadorEntity.fromJson({});
    expect(entity.id, '');
    expect(entity.idPrestador, '');
    expect(entity.idCliente, '');
    expect(entity.nota, 0);
    expect(entity.comentario, '');
    expect(entity.data, DateUtil.dateZero);
  });

  test('AvaliacaoPrestadorEntity.toJson: deve retornar um json com os respectivos valores do obje', () {
    AvaliacaoPrestadorEntity entity = AvaliacaoPrestadorEntity.fromJson({
      "id": '1',
      "idPrestador": '1234',
      "idCliente": '4567',
      "nota": 4.5656,
      "comentario": 'muito bom',
      "data": DateTime(2023, 02, 05).toJsonString(),
    });
    Map<String, dynamic> map = entity.toJson();
    expect(map['id'], "1");
    expect(map['idPrestador'], "1234");
    expect(map['idCliente'], "4567");
    expect(map['nota'], 4.5656);
    expect(map['comentario'], "muito bom");
    expect(map['data'], DateTime(2023, 02, 05).toJsonString());
  });

  test('AvaliacaoPrestadorEntity.copyWith: deve retornar uma copia do objeto com os respectivos valores passados nos paramentros', () {
    AvaliacaoPrestadorEntity entity = AvaliacaoPrestadorEntity.fromJson({
      "id": '1',
      "idPrestador": '1234',
      "idCliente": '4567',
      "nota": 4.5656,
      "comentario": 'muito bom',
      "data": DateTime(2023, 02, 05).toJsonString(),
    });

    expect(entity.copyWith().id, "1");
    expect(entity.copyWith(id: '2').id, "2");

    expect(entity.copyWith().idPrestador, "1234");
    expect(entity.copyWith(idPrestador: '12').idPrestador, "12");

    expect(entity.copyWith().idCliente, "4567");
    expect(entity.copyWith(idCliente: '123').idCliente, "123");

    expect(entity.copyWith().nota, 4.5656);
    expect(entity.copyWith(nota: 4.565623).nota, 4.565623);

    expect(entity.copyWith().comentario, "muito bom");
    expect(entity.copyWith(comentario: 'kkk').comentario, "kkk");

    expect(entity.copyWith().data, DateTime(2023, 02, 05));
    expect(entity.copyWith(data: DateTime(2023, 02, 06)).data, DateTime(2023, 02, 06));
  });
}
