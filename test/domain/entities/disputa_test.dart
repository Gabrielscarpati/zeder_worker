import 'package:flutter_test/flutter_test.dart';
import 'package:zeder/core/utils/date_utils.dart';
import 'package:zeder/domain/entities/avaliacao_prestador_entity.dart';
import 'package:zeder/domain/entities/disputa_entity.dart';

void main() {

 test('DisputaEntity.constructor: deve criar um objeto com os respectivos valores', () {
   DisputaEntity entity = DisputaEntity(id: '1', id_chat: '1234', id_proprietario: '4567', data_criacao: DateTime(2023, 02, 05), data_leitura: DateTime(2023, 02, 05),  );
    expect(entity.id, "1");
    expect(entity.id_chat, "1234");
    expect(entity.id_proprietario, "4567");
    expect(entity.data_criacao, DateTime(2023, 02, 05));
    expect(entity.data_leitura, DateTime(2023, 02, 05));
  });

  test('DisputaEntity.fromJson: deve criar um objeto com os respectivos valores passados no json', () {
    DisputaEntity entity = DisputaEntity.fromJson({"id": '1', "id_chat": '1234', "id_proprietario": '4567', "data_criacao": DateTime(2023, 02, 05), "data_leitura": DateTime(2023, 02, 05),});
    expect(entity.id, "1");
    expect(entity.id_chat, "1234");
    expect(entity.id_proprietario, "4567");
    expect(entity.data_criacao, DateTime(2023, 02, 05));
    expect(entity.data_leitura, DateTime(2023, 02, 05));
  });

  test('DisputaEntity.fromJson: deve criar um objeto com os respectivos valores "default" quando o json for vazio', () {
    DisputaEntity entity = DisputaEntity.fromJson({});
      expect(entity.id, '');
      expect(entity.id_chat, '');
      expect(entity.id_proprietario, '');
      expect(entity.data_criacao, DateUtil.dateZero);
      expect(entity.data_leitura, DateUtil.dateZero);
    });

  test('DisputaEntity.toJson: deve retornar um json com os respectivos valores do obje', () {
    DisputaEntity entity = DisputaEntity.fromJson({"id": '1', "id_chat": '1234', "id_proprietario": '4567', "data_criacao": DateTime(2023, 02, 05), "data_leitura": DateTime(2023, 02, 05),});
    Map<String,dynamic> map = entity.toJson();
    expect(map['id'], "1");
    expect(map['id_chat'], "1234");
    expect(map['id_proprietario'], "4567");
    expect(map['data_criacao'], DateTime(2023, 02, 05));
    expect(map['data_leitura'], DateTime(2023, 02, 05));
  });


  test('DisputaEntity.copyWith: deve retornar uma copia do objeto com os respectivos valores passados nos paramentros', () {
    DisputaEntity entity = DisputaEntity.fromJson({"id": '1', "id_chat": '1234', "id_proprietario": '4567', "data_criacao": DateTime(2023, 02, 05), "data_leitura": DateTime(2023, 02, 05),});

    expect(entity.copyWith().id, "1");
    expect(entity.copyWith(id:'2').id, "2");

    expect(entity.copyWith().id_chat, "1234");
    expect(entity.copyWith(id_chat:'12').id_chat, "12");

    expect(entity.copyWith().id_proprietario, "4567");
    expect(entity.copyWith(id_proprietario:'123').id_proprietario, "123");

    expect(entity.copyWith().data_criacao, DateTime(2023, 02, 05));
    expect(entity.copyWith(data_criacao: DateTime(2023, 02, 06)).data_criacao, DateTime(2023, 02, 06));

    expect(entity.copyWith().data_leitura, DateTime(2023, 02, 05));
    expect(entity.copyWith(data_leitura:DateTime(2023, 02, 06)).data_leitura, DateTime(2023, 02, 06));
  });


}


