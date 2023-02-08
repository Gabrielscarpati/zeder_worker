import '../../core/core.dart';

class AvaliacaoPrestadorEntity extends Entity {
  final String idPrestador;
  final String idCliente;
  final double nota;
  final String comentario;
  final DateTime data;

  AvaliacaoPrestadorEntity({
    required super.id,
    required this.idPrestador,
    required this.idCliente,
    required this.nota,
    required this.comentario,
    required this.data,
  });

  factory AvaliacaoPrestadorEntity.fromJson(Map<String, dynamic> json) {
    return AvaliacaoPrestadorEntity(
      id: json['id'] ?? '',
      idPrestador: json['idPrestador'] ?? '',
      idCliente: json['idCliente'] ?? '',
      nota: DoubleUtil.toDoubleDefaultZero(json['nota']),
      comentario: json['comentario'] ?? '',
      data: DateUtil.toDateTimeDefaultDateZero(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idPrestador': idPrestador,
      'idCliente': idCliente,
      'nota': nota,
      'comentario': comentario,
      'data': data.toJsonString(),
    };
  }

  AvaliacaoPrestadorEntity copyWith({
    String? id,
    String? idPrestador,
    String? idCliente,
    double? nota,
    String? comentario,
    DateTime? data,
  }) {
    return AvaliacaoPrestadorEntity(
      id: id ?? this.id,
      idPrestador: idPrestador ?? this.idPrestador,
      idCliente: idCliente ?? this.idCliente,
      nota: nota ?? this.nota,
      comentario: comentario ?? this.comentario,
      data: data ?? this.data,
    );
  }
}

abstract class AvaliacaoPrestadorRepository extends Repository<AvaliacaoPrestadorEntity> {}

class AvaliacaoPrestadorAdapter extends Adapter<AvaliacaoPrestadorEntity> {
  @override
  AvaliacaoPrestadorEntity fromJson(Map<String, dynamic> json) {
    return AvaliacaoPrestadorEntity.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(AvaliacaoPrestadorEntity entity) {
    return entity.toJson();
  }
}
