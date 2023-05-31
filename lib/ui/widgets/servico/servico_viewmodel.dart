class ServicoViewModel {
  final String id;
  final String icone;
  final String servico;
  final String status;
  final String valor;
  final String data;
  final bool emDestaque;
  final List<dynamic> list_propostas;
  final List<dynamic> idsPrestadoresBid;
  final Map<String, dynamic> service_details;
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
  final List idsPropostasRecebidas;
  final String idPropostaAceita;
  final String idPrestador;
  final DateTime dataPropostaAceita;
  final bool flgAvisoCliente;
  final bool flgAvisoPrestador;
  final String idDisputa;

  const ServicoViewModel({
    required this.id,
    required this.icone,
    required this.servico,
    required this.status,
    required this.valor,
    required this.data,
    required this.emDestaque,
    required this.list_propostas,
    required this.idsPrestadoresBid,
    required this.service_details,
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
    required this.idsPropostasRecebidas,
    required this.idPropostaAceita,
    required this.idPrestador,
    required this.dataPropostaAceita,
    required this.flgAvisoCliente,
    required this.flgAvisoPrestador,
    required this.idDisputa,
  });
}
