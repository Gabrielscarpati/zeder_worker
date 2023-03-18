import 'package:flutter/material.dart';

import '../../../../design_system/widgets/text.dart';
import '../../botoes.dart';
import '../footer_padrao_servico/footer_padrao_servico.dart';

class ContactarPrestadorServicoFooter extends FooterPadraoServico {
  final VoidCallback onPressedBotaoEnviarMensagem;

  const ContactarPrestadorServicoFooter({
    super.key,
    required super.servico,
    required this.onPressedBotaoEnviarMensagem,
  });

  @override
  double get headerHeight => 140;

  @override
  Widget get widgetBotaoTexto => Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DSTextTitleBoldSecondary(text: "Converse com o prestador"),
            const SizedBox(
              height: 4,
            ),
            const DSTextSubtitleSecondary(text: "Envie mensagens direto para o prestador"),
            const SizedBox(
              height: 24,
            ),
            BotaoPadraoGrande(
              texto: 'ENVIAR MENSAGEM',
              onPressed: onPressedBotaoEnviarMensagem,
            ),
          ],
        ),
      );
}
