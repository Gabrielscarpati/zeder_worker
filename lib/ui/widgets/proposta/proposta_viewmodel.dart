class PropostaViewModel {
  final String idPrestador;
  final String idServico;
  final DateTime dataInicio;
  final double valor;
  final String consideracoes;
  final bool flgAvisoCliente;
  final bool flgAvisoPrestador;
  final String idCliente;
  final DateTime dataPropostaEnviada;
  final String nomeServico;

  PropostaViewModel({
    required this.idPrestador,
    required this.idServico,
    required this.dataInicio,
    required this.valor,
    required this.consideracoes,
    required this.flgAvisoCliente,
    required this.flgAvisoPrestador,
    required this.idCliente,
    required this.dataPropostaEnviada,
    required this.nomeServico,
  });
}