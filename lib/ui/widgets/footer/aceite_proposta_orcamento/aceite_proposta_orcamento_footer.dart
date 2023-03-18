import 'package:flutter/material.dart';

import '../../../../design_system/widgets/text.dart';
import '../../botoes.dart';
import '../footer_padrao_servico/footer_padrao_servico.dart';

class AceitePropostaOrcamentoFooter extends FooterPadraoServico {
  final VoidCallback onPressedBotaoAceitar;
  final VoidCallback onPressedBotaoRecusar;

  const AceitePropostaOrcamentoFooter({
    super.key,
    required super.servico,
    required this.onPressedBotaoAceitar,
    required this.onPressedBotaoRecusar,
  });

  @override
  double get headerHeight => 140;

  @override
  Widget get widgetBotaoTexto => Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DSTextTitleBoldSecondary(text: 'Aceite a proposta'),
            const SizedBox(height: 24),
            BarraBotoesPadraoPequeno(
              textoBotaoPadrao: 'ACEITAR',
              onPressedBotaoPadrao: onPressedBotaoAceitar,
              textoBotaoSecundario: 'RECUSAR',
              onPressedBotaoSecundario: onPressedBotaoRecusar,
            ),
          ],
        ),
      );
}
