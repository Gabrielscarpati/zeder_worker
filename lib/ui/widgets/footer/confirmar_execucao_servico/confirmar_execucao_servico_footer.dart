import 'package:flutter/material.dart';

import '../../../../design_system/widgets/text.dart';
import '../../botoes.dart';
import '../footer_padrao_servico/footer_padrao_servico.dart';

class ConfirmarExecucaoServicoFooter extends FooterPadraoServico {
  final VoidCallback onPressedBotaoConfimar;

  const ConfirmarExecucaoServicoFooter({
    super.key,
    required super.servico,
    required this.onPressedBotaoConfimar,
  });

  @override
  double get headerHeight => 140;

  @override
  Widget get widgetBotaoTexto => Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DSTextTitleBoldSecondary(text: "Confirme a execução do serviço"),
            const SizedBox(
              height: 4,
            ),
            const DSTextSubtitleSecondary(text: "Liberar o pagamento do serviço para o prestador"),
            const SizedBox(
              height: 24,
            ),
            BotaoPadraoGrande(
              texto: 'CONFIRMAR',
              onPressed: onPressedBotaoConfimar,
            ),
          ],
        ),
      );
}
