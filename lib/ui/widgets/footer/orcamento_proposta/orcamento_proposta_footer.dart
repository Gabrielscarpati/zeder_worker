import 'package:flutter/material.dart';

import '../footer_padrao_servico/footer_padrao_servico.dart';

class OrcamentoPropostaFooter extends FooterPadraoServico {
  const OrcamentoPropostaFooter({
    super.key,
    required super.servico,
  });

  @override
  double get headerHeight => 0;

  @override
  Widget get widgetBotaoTexto => const SizedBox.shrink();
}
