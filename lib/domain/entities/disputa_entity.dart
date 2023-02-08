import '../../core/core.dart';

class DisputaEntity extends Entity {
  final String idChat;
  final String idProprietario;
  final DateTime dataCriacao;
  final DateTime dataLeitura;

  DisputaEntity({
    required super.id,
    required this.idChat,
    required this.idProprietario,
    required this.dataCriacao,
    required this.dataLeitura,
  });

  factory DisputaEntity.fromJson(Map<String, dynamic> json) {
    return DisputaEntity(
      id: json['id'] ?? '',
      idChat: json['idChat'] ?? '',
      idProprietario: json['idProprietario'] ?? '',
      dataCriacao: DateUtil.toDateTimeDefaultDateZero(json['dataCriacao']),
      dataLeitura: DateUtil.toDateTimeDefaultDateZero(json['dataLeitura']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idChat': idChat,
      'idProprietario': idProprietario,
      'dataCriacao': dataCriacao.toJsonString(),
      'dataLeitura': dataLeitura.toJsonString(),
    };
  }

  DisputaEntity copyWith({
    String? id,
    String? idChat,
    String? idProprietario,
    DateTime? dataCriacao,
    DateTime? dataLeitura,
  }) {
    return DisputaEntity(
      id: id ?? this.id,
      idChat: idChat ?? this.idChat,
      idProprietario: idProprietario ?? this.idProprietario,
      dataCriacao: dataCriacao ?? this.dataCriacao,
      dataLeitura: dataLeitura ?? this.dataLeitura,
    );
  }
}

abstract class DisputaRepository extends Repository<DisputaEntity> {}

class DisputaAdapter extends Adapter<DisputaEntity> {
  @override
  DisputaEntity fromJson(Map<String, dynamic> json) {
    return DisputaEntity.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(DisputaEntity entity) {
    return entity.toJson();
  }
}
