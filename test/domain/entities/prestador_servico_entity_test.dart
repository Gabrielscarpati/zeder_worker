import 'package:flutter_test/flutter_test.dart';
import 'package:zeder/core/utils/date_utils.dart';
import 'package:zeder/domain/entities/prestador_servico_entity.dart';

void main() {
  test('PrestadorServico.constructor: deve criar um objeto com os respectivos valores', () {
    PrestadorServicoEntity entity = PrestadorServicoEntity(id: '3', idPrestador: '1', idServico: '2', dataInicio: DateTime(2023, 02, 05));
    expect(entity.id, "3");
    expect(entity.idPrestador, "1");
    expect(entity.idServico, "2");
    expect(entity.dataInicio.year, 2023);
    expect(entity.dataInicio.month, 02);
    expect(entity.dataInicio.day, 05);
  });

  test('PrestadorServico.fromJson: deve criar um objeto com os respectivos valores passados no json', () {
    PrestadorServicoEntity entity = PrestadorServicoEntity.fromJson({"id": "3", "idPrestador": "1", "idServico": "2", "dataInicio": "2023-02-05"});
    expect(entity.id, "3");
    expect(entity.idPrestador, "1");
    expect(entity.idServico, "2");
    expect(entity.dataInicio.year, 2023);
    expect(entity.dataInicio.month, 02);
    expect(entity.dataInicio.day, 05);
  });

  test('PrestadorServicoEntity.fromJson: deve criar um objeto com os respectivos valores "default" quando o json for vazio', () {
    PrestadorServicoEntity entity = PrestadorServicoEntity.fromJson({});
    expect(entity.id, "");
    expect(entity.idPrestador, "");
    expect(entity.idServico, "");
    expect(entity.dataInicio, DateUtil.dateZero);
  });

  test('PrestadorServicoEntity.toJson: deve retornar um json com os respectivos valores do objeto', () {
    PrestadorServicoEntity entity = PrestadorServicoEntity.fromJson({"id": "3", "idPrestador": "1", "idServico": "2", "dataInicio": "2023-02-05"});
    Map<String, dynamic> map = entity.toJson();
    expect(map['id'], "3");
    expect(map['idPrestador'], "1");
    expect(map['idServico'], "2");
    expect(map['dataInicio'], DateTime(2023, 02, 05).toJsonString());
  });

  test('PrestadorServicoEntity.copyWith: deve retornar uma copia do objeto com os respectivos valores passados nos paramentros', () {
    PrestadorServicoEntity entity = PrestadorServicoEntity.fromJson({"id": "3", "idPrestador": "1", "idServico": "2", "dataInicio": "2023-02-05"});

    expect(entity.copyWith().id, "3");
    expect(entity.copyWith(id: '4').id, "4");

    expect(entity.copyWith().idPrestador, "1");
    expect(entity.copyWith(idPrestador: '2').idPrestador, "2");

    expect(entity.copyWith().idServico, "2");
    expect(entity.copyWith(idServico: '3').idServico, "3");

    expect(entity.copyWith().dataInicio, DateTime(2023, 02, 05));
    expect(entity.copyWith(dataInicio: DateTime(2024, 02, 05)).dataInicio, DateTime(2024, 02, 05));
  });

  test('PrestadorServicoAdapter.fromJson: deve retornar um objeto criado apartir de um Json', () {
    PrestadorServicoAdapter adapter = PrestadorServicoAdapter();
    var entity = adapter.fromJson({"id": "3", "idPrestador": "1", "idServico": "2", "dataInicio": "2023-02-05"});
    expect(entity.id, "3");
    expect(entity.idPrestador, "1");
    expect(entity.idServico, "2");
    expect(entity.dataInicio.year, 2023);
    expect(entity.dataInicio.month, 02);
    expect(entity.dataInicio.day, 05);
  });

  test('PrestadorServicoAdapter.toJson: deve retornar um Json do objeto passado no parametro', () {
    PrestadorServicoAdapter adapter = PrestadorServicoAdapter();
    PrestadorServicoEntity entity = PrestadorServicoEntity.fromJson({"id": "3", "idPrestador": "1", "idServico": "2", "dataInicio": "2023-02-05"});
    Map<String, dynamic> map = adapter.toJson(entity);
    expect(map['id'], "3");
    expect(map['idPrestador'], "1");
    expect(map['idServico'], "2");
    expect(map['dataInicio'], DateTime(2023, 02, 05).toJsonString());
  });
  
     
}
