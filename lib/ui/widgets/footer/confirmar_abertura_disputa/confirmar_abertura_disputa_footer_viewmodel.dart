class ConfirmarAberturaDispultaFooterViewModel {
  final String valor;
  final String data;
  final String descricao;
  final String? urlAudio;
  final List<String>? urlsFotos;
  final List<String>? urlsVideos;

  const ConfirmarAberturaDispultaFooterViewModel({
    required this.valor,
    required this.data,
    required this.descricao,
    this.urlAudio,
    this.urlsFotos,
    this.urlsVideos,
  });
}