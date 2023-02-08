import 'package:flutter_test/flutter_test.dart';
import 'package:zeder/core/utils/date_utils.dart';
import 'package:zeder/domain/entities/avaliacao_prestador_entity.dart';

void main() {
  test('MemoryRepository: deve criar um objeto com os respectivos valores', () {
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
}
