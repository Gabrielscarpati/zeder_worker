import '../../core/utils/date_utils.dart';
import '../../core/utils/double_utils.dart';

class DisputaEntity {
  final String id;
  final String id_chat;
  final String id_proprietario;
  final DateTime data_criacao;
  final DateTime data_leitura;

  DisputaEntity({
    required this.id,
    required this.id_chat,
    required this.id_proprietario,
    required this.data_criacao,
    required this.data_leitura,
  });

  factory DisputaEntity.fromJson(Map<String, dynamic> json) {
    return DisputaEntity(
      id: json['id'] ?? '',
      id_chat: json['id_chat'] ?? '',
      id_proprietario: json['id_proprietario'] ?? '',
      data_criacao: json['data_criacao'] ?? DoubleUtil.toDoubleDefaultZero(json['data_criacao']),
      data_leitura: json['data_leitura'] ?? DoubleUtil.toDoubleDefaultZero(json['data_leitura']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_chat': id_chat,
      'id_proprietario': id_proprietario,
      'data_criacao': data_criacao,
      'data_leitura': data_leitura,
    };
  }

  DisputaEntity copyWith({
    String? id,
    String? id_chat,
    String? id_proprietario,
    DateTime? data_criacao,
    DateTime? data_leitura,
  }) {
    return DisputaEntity(
      id: id ?? this.id,
      id_chat: id_chat ?? this.id_chat,
      id_proprietario: id_proprietario ?? this.id_proprietario,
      data_criacao: data_criacao ?? this.data_criacao,
      data_leitura: data_leitura ?? this.data_leitura,
    );
  }
}
