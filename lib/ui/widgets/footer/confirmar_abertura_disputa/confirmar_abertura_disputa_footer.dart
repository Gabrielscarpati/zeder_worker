import 'package:flutter/material.dart';

import '../../../../design_system/widgets/text.dart';
import '../../botoes.dart';
import '../footer_padrao_servico/footer_padrao_servico.dart';

class ConfirmarAberturaDisputaFooter extends FooterPadraoServico {
  final VoidCallback onPressedBotaoIniciarDisputa;

  const ConfirmarAberturaDisputaFooter({
    super.key,
    required super.servico,
    required this.onPressedBotaoIniciarDisputa,
  });

  @override
  double get headerHeight => 140;

  @override
  Widget get widgetBotaoTexto => Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DSTextTitleBoldSecondary(text: "Confirme a abertura da disputa"),
            const SizedBox(
              height: 4,
            ),
            const DSTextSubtitleSecondary(text: "As informações fornecidas serão avaliadas pelos nossos especialistas"),
            const SizedBox(
              height: 24,
            ),
            BotaoPadraoGrande(
              texto: 'INICIAR DISPUTA',
              onPressed: onPressedBotaoIniciarDisputa,
            ),
          ],
        ),
      );
}
