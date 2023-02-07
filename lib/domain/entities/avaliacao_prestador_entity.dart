import '../../core/utils/date_utils.dart';
import '../../core/utils/double_utils.dart';

class AvaliacaoPrestadorEntity {
  final String id;
  final String prestador_id;
  final String id_cliente;
  final double nota;
  final String comentario;
  final DateTime data;

  AvaliacaoPrestadorEntity({
    required this.id,
    required this.prestador_id,
    required this.id_cliente,
    required this.nota,
    required this.comentario,
    required this.data,
  });

  factory AvaliacaoPrestadorEntity.fromJson(Map<String, dynamic> json) {
    return AvaliacaoPrestadorEntity(
      id: json['id'] ?? '',
      prestador_id: json['prestador_id'] ?? '',
      id_cliente: json['id_cliente'] ?? '',
      nota: json['nota'] ?? DoubleUtil.toDoubleDefaultZero(json['nota']),
      comentario: json['comentario'] ?? '',
      data: json['data'] ?? DateUtil.toDateTimeDefaultDateZero(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'prestador_id': prestador_id,
      'id_cliente': id_cliente,
      'nota': nota,
      'comentario': comentario,
      'data': data,
    };
  }

  AvaliacaoPrestadorEntity copyWith({
    String? id,
    String? prestador_id,
    String? id_cliente,
    double? nota,
    String? comentario,
    DateTime? data,
  }) {
    return AvaliacaoPrestadorEntity(
      id: id ?? this.id,
      prestador_id: prestador_id ?? this.prestador_id,
      id_cliente: id_cliente ?? this.id_cliente,
      nota: nota ?? this.nota,
      comentario: comentario ?? this.comentario,
      data: data ?? this.data,
    );
  }
}
