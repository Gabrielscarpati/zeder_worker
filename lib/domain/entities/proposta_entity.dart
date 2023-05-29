import '../../core/core.dart';

class PropostaEntity extends Entity {
  final String idPrestador;
  final String idServico;
  final DateTime dataInicio;
  final double valor;
  final String consideracoes;
  final bool flgAvisoCliente;
  final bool flgAvisoPrestador;

  PropostaEntity({
    required super.id,
    required this.idPrestador,
    required this.idServico,
    required this.dataInicio,
    required this.valor,
    required this.consideracoes,
    required this.flgAvisoCliente,
    required this.flgAvisoPrestador,
  });//lG72vV9GqWyIVWlMl1jR

  factory PropostaEntity.fromJson(Map<String, dynamic> json) {
    return PropostaEntity(
      id: json['id'] ?? '',
      idPrestador: json['idPrestador'] ?? '',
      idServico: json['idServico'] ?? '',
      dataInicio: DateUtil.toDateTimeDefaultDateZero(json['dataInicio']),
      valor: DoubleUtil.toDoubleDefaultZero(json['valor']),
      consideracoes: json['consideracoes'] ?? '',
      flgAvisoCliente: BoolUtil.toBoolDefaultFalse(json['flgAvisoCliente']),
      flgAvisoPrestador: BoolUtil.toBoolDefaultFalse(json['flgAvisoPrestador']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idPrestador': idPrestador,
      'idServico': idServico,
      'dataInicio': dataInicio.toJsonString(),
      'valor': valor,
      'consideracoes': consideracoes,
      'flgAvisoCliente': flgAvisoCliente,
      'flgAvisoPrestador': flgAvisoPrestador,
    };
  }

  PropostaEntity copyWith({
    String? id,
    String? idPrestador,
    String? idServico,
    DateTime? dataInicio,
    double? valor,
    String? consideracoes,
    bool? flgAvisoCliente,
    bool? flgAvisoPrestador,
  }) {
    return PropostaEntity(
      id: id ?? this.id,
      idPrestador: idPrestador ?? this.idPrestador,
      idServico: idServico ?? this.idServico,
      dataInicio: dataInicio ?? this.dataInicio,
      valor: valor ?? this.valor,
      consideracoes: consideracoes ?? this.consideracoes,
      flgAvisoCliente: flgAvisoCliente ?? this.flgAvisoCliente,
      flgAvisoPrestador: flgAvisoPrestador ?? this.flgAvisoPrestador,
    );
  }
}

abstract class PropostaRepository extends Repository<PropostaEntity> {}

class PropostaAdapter extends Adapter<PropostaEntity> {
  @override
  PropostaEntity fromJson(Map<String, dynamic> json) {
    return PropostaEntity.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(PropostaEntity entity) {
    return entity.toJson();
  }
}
