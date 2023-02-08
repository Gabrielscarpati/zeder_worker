import '../../core/core.dart';

class PrestadorServicoEntity extends Entity {
  final String idPrestador;
  final String idServico;
  final DateTime dataInicio;

  PrestadorServicoEntity({
    required super.id,
    required this.idPrestador,
    required this.idServico,
    required this.dataInicio,
  });

  factory PrestadorServicoEntity.fromJson(Map<String, dynamic> json) {
    return PrestadorServicoEntity(
      id: json['id'] ?? '',
      idPrestador: json['idPrestador'] ?? '',
      idServico: json['idServico'] ?? '',
      dataInicio: DateUtil.toDateTimeDefaultDateZero(json['dataInicio']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idPrestador': idPrestador,
      'idServico': idServico,
      'dataInicio': dataInicio.toJsonString(),
    };
  }

  PrestadorServicoEntity copyWith({
    String? id,
    String? idPrestador,
    String? idServico,
    DateTime? dataInicio,
  }) {
    return PrestadorServicoEntity(
      id: id ?? this.id,
      idPrestador: idPrestador ?? this.idPrestador,
      idServico: idServico ?? this.idServico,
      dataInicio: dataInicio ?? this.dataInicio,
    );
  }
}

abstract class PrestadorServicoRepository extends Repository<PrestadorServicoEntity> {}

class PrestadorServicoAdapter extends Adapter<PrestadorServicoEntity> {
  @override
  PrestadorServicoEntity fromJson(Map<String, dynamic> json) {
    return PrestadorServicoEntity.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(PrestadorServicoEntity entity) {
    return entity.toJson();
  }
}
