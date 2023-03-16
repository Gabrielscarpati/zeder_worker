import 'package:flutter/material.dart';

import '../../../../design_system/widgets/footer.dart';
import '../../../../design_system/widgets/label_text.dart';
import '../../../../design_system/widgets/text.dart';
import '../../botoes.dart';
import '../../players/barra_botoes_media.dart';
import 'liberar_pagamento_servico_viewmodel.dart';

class LiberarPagamentoServicoFooter extends StatelessWidget {
  final LiberarPagamentoServicoFooterViewModel viewModel;

  final VoidCallback onPressedBotaoPadrao;
  final VoidCallback onPressedBotaoSecundario;
  final VoidCallback onEnviarAudio;
  final Function(String) onExcluirAudio;
  final bool permiteEnviarAudio;

  final VoidCallback onEnviarFotos;
  final Function(String) onExcluirFoto;
  final bool permiteEnviarFotos;

  final VoidCallback onEnviarVideos;
  final Function(String) onExcluirVideo;
  final bool permiteEnviarVideos;

  const LiberarPagamentoServicoFooter({
    Key? key,
    required this.onPressedBotaoPadrao,
    required this.onPressedBotaoSecundario,
    required this.viewModel,
    required this.onEnviarAudio,
    required this.onExcluirAudio,
    required this.permiteEnviarAudio,
    required this.onEnviarFotos,
    required this.onExcluirFoto,
    required this.permiteEnviarFotos,
    required this.onEnviarVideos,
    required this.onExcluirVideo,
    required this.permiteEnviarVideos,
  }) : super(key: key);

  static const double headerHeight = 340;

  @override
  Widget build(BuildContext context) {
    return Footer(
      header: header,
      body: body,
      maxHeight: (MediaQuery.of(context).size.height) * 0.85 - headerHeight,
    );
  }

  Widget get header => SizedBox(
        height: headerHeight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [barraBotoes, descricao, valorData],
        ),
      );

  Widget get barraBotoes => Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DSTextSubtitleSecondary(text: "O prestador concluiu o serviço. Você aceita liberar o pagamento para o pretador?"),
            const SizedBox(height: 24),
            BarraBotoesPadraoPequeno(
              textoBotaoPadrao: 'RECUSAR',
              onPressedBotaoPadrao: onPressedBotaoPadrao,
              textoBotaoSecundario: 'ACEITAR',
              onPressedBotaoSecundario: onPressedBotaoSecundario,
            ),
          ],
        ),
      );

  Widget get descricao => Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 0),
        child: DSLabelText(label: "Descrição", text: viewModel.descricao),
      );

  Widget get valorData => Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DSTextTitleBoldSecondary(text: viewModel.valor),
                const DSTextSubtitleSecondary(text: "Valor Total do Orçamento"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                DSTextTitleBoldSecondary(text: viewModel.data),
                const DSTextSubtitleSecondary(text: "Data"),
              ],
            ),
          ],
        ),
      );

  Widget? get body => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BarraBotoesMedia(
              urlAudio: viewModel.urlAudio,
              onEnviarAudio: () {},
              onExcluirAudio: (String) {},
              permiteEnviarAudio: false,
              urlsFotos: viewModel.urlsFotos ?? [],
              onEnviarFotos: () {},
              onExcluirFoto: (String) {},
              permiteEnviarFotos: false,
              urlsVideos: viewModel.urlsVideos ?? [],
              onEnviarVideos: () {},
              onExcluirVideo: (String) {},
              permiteEnviarVideos: false,
            ),
          ],
        ),
      );
}
