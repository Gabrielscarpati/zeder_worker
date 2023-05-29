class ServicoViewModel {
  final String icone;
  final String servico;
  final String status;
  final String valor;
  final String data;
  final bool emDestaque;
  final List<dynamic> list_propostas;

  const ServicoViewModel({
    required this.icone,
    required this.servico,
    required this.status,
    required this.valor,
    required this.data,
    required this.emDestaque,
    required this.list_propostas,
  });
}
