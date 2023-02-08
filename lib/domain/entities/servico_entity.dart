import '../../core/core.dart';

class ServicoEntity extends Entity {
  final DateTime dataCadastro;
  final String idTipoServico;
  final String idCliente;
  final String idCidade;
  final String descricao;
  final double valorInicial;
  final double valorFinal;
  final DateTime dataInicial;
  final DateTime dataFinal;
  final bool flgDatasFlexiveis;
  final String status;
  final List<String> idsPropostasRecebidas;
  final String idPropostaAceita;
  final String idPrestador;
  final DateTime dataPropostaAceita;
  final bool flgAvisoCliente;
  final bool flgAvisoPrestador;
  final String idDisputa;

  ServicoEntity({
    required super.id,
    required this.dataCadastro,
    required this.idTipoServico,
    required this.idCliente,
    required this.idCidade,
    required this.descricao,
    required this.valorInicial,
    required this.valorFinal,
    required this.dataInicial,
    required this.dataFinal,
    required this.flgDatasFlexiveis,
    required this.status,
    required this.idsPropostasRecebidas,
    required this.idPropostaAceita,
    required this.idPrestador,
    required this.dataPropostaAceita,
    required this.flgAvisoCliente,
    required this.flgAvisoPrestador,
    required this.idDisputa,
  });

  factory ServicoEntity.fromJson(Map<String, dynamic> json) {
    return ServicoEntity(
      id: json['id'] ?? '',
      dataCadastro: DateUtil.toDateTimeDefaultDateZero(json['dataCadastro']),
      idTipoServico: json['idTipoServico'] ?? '',
      idCliente: json['idCliente'] ?? '',
      idCidade: json['idCidade'] ?? '',
      descricao: json['descricao'] ?? '',
      valorInicial: DoubleUtil.toDoubleDefaultZero(json['valorInicial']),
      valorFinal: DoubleUtil.toDoubleDefaultZero(json['valorFinal']),
      dataInicial: DateUtil.toDateTimeDefaultDateZero(json['dataInicial']),
      dataFinal: DateUtil.toDateTimeDefaultDateZero(json['dataFinal']),
      flgDatasFlexiveis: BoolUtil.toBoolDefaultFalse(json['flgDatasFlexiveis']),
      status: json['status'] ?? '',
      idsPropostasRecebidas: ListUtil.toListDefaultEmpty<String>(json['idsPropostasRecebidas']),
      idPropostaAceita: json['idPropostaAceita'] ?? '',
      idPrestador: json['idPrestador'] ?? '',
      dataPropostaAceita: DateUtil.toDateTimeDefaultDateZero(json['dataPropostaAceita']),
      flgAvisoCliente: BoolUtil.toBoolDefaultFalse(json['flgAvisoCliente']),
      flgAvisoPrestador: BoolUtil.toBoolDefaultFalse(json['flgAvisoPrestador']),
      idDisputa: json['idDisputa'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dataCadastro': dataCadastro.toJsonString(),
      'idTipoServico': idTipoServico,
      'idCliente': idCliente,
      'idCidade': idCidade,
      'descricao': descricao,
      'valorInicial': valorInicial,
      'valorFinal': valorFinal,
      'dataInicial': dataInicial.toJsonString(),
      'dataFinal': dataFinal.toJsonString(),
      'flgDatasFlexiveis': flgDatasFlexiveis,
      'status': status,
      'idsPropostasRecebidas': idsPropostasRecebidas,
      'idPropostaAceita': idPropostaAceita,
      'idPrestador': idPrestador,
      'dataPropostaAceita': dataPropostaAceita.toJsonString(),
      'flgAvisoCliente': flgAvisoCliente,
      'flgAvisoPrestador': flgAvisoPrestador,
      'idDisputa': idDisputa,
    };
  }

  ServicoEntity copyWith({
    String? id,
    DateTime? dataCadastro,
    String? idTipoServico,
    String? idCliente,
    String? idCidade,
    String? descricao,
    double? valorInicial,
    double? valorFinal,
    DateTime? dataInicial,
    DateTime? dataFinal,
    bool? flgDatasFlexiveis,
    String? status,
    List<String>? idsPropostasRecebidas,
    String? idPropostaAceita,
    String? idPrestador,
    DateTime? dataPropostaAceita,
    bool? flgAvisoCliente,
    bool? flgAvisoPrestador,
    String? idDisputa,
  }) {
    return ServicoEntity(
      id: id ?? this.id,
      dataCadastro: dataCadastro ?? this.dataCadastro,
      idTipoServico: idTipoServico ?? this.idTipoServico,
      idCliente: idCliente ?? this.idCliente,
      idCidade: idCidade ?? this.idCidade,
      descricao: descricao ?? this.descricao,
      valorInicial: valorInicial ?? this.valorInicial,
      valorFinal: valorFinal ?? this.valorFinal,
      dataInicial: dataInicial ?? this.dataInicial,
      dataFinal: dataFinal ?? this.dataFinal,
      flgDatasFlexiveis: flgDatasFlexiveis ?? this.flgDatasFlexiveis,
      status: status ?? this.status,
      idsPropostasRecebidas: idsPropostasRecebidas ?? this.idsPropostasRecebidas,
      idPropostaAceita: idPropostaAceita ?? this.idPropostaAceita,
      idPrestador: idPrestador ?? this.idPrestador,
      dataPropostaAceita: dataPropostaAceita ?? this.dataPropostaAceita,
      flgAvisoCliente: flgAvisoCliente ?? this.flgAvisoCliente,
      flgAvisoPrestador: flgAvisoPrestador ?? this.flgAvisoPrestador,
      idDisputa: idDisputa ?? this.idDisputa,
    );
  }
}

abstract class ServicoRepository extends Repository<ServicoEntity> {}

class ServicoAdapter extends Adapter<ServicoEntity> {
  @override
  ServicoEntity fromJson(Map<String, dynamic> json) {
    return ServicoEntity.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(ServicoEntity entity) {
    return entity.toJson();
  }
}
