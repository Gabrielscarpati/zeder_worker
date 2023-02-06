import '../../core/core.dart';

class PrestadorServicoEntity {
  final String idPrestador;
  final String idServico;
  final DateTime dataInicio;

  PrestadorServicoEntity({
    required this.idPrestador,
    required this.idServico,
    required this.dataInicio,
  });

  factory PrestadorServicoEntity.fromJson(Map<String, dynamic> json) {
    return PrestadorServicoEntity(
      idPrestador: json['idPrestador'] ?? '',
      idServico: json['idServico'] ?? '',
      dataInicio: DateUtil.toDateTimeDefaultDateZero(json['dataInicio']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idPrestador': idPrestador,
      'idServico': idServico,
      'dataInicio': dataInicio.toJsonString(),
    };
  }

  PrestadorServicoEntity copyWith({
    String? idPrestador,
    String? idServico,
    DateTime? dataInicio,
  }) {
    return PrestadorServicoEntity(
      idPrestador: idPrestador ?? this.idPrestador,
      idServico: idServico ?? this.idServico,
      dataInicio: dataInicio ?? this.dataInicio,
    );
  }
}
