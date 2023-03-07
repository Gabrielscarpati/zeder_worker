import 'package:flutter/material.dart';
import 'package:zeder/ui/widgets/footer/confirmar_execucao_servico/confirmar_execucao_servico_footer_viewmodel.dart';
import '../../../../design_system/widgets/footer.dart';
import '../../../../design_system/widgets/text.dart';
import '../../botoes.dart';
import '../../players/barra_botoes_media.dart';

class ConfirmarExecucaoServicoFooter extends StatelessWidget {
  final ConfirmarExecucaoServicoFooterViewModel viewModel;

  final VoidCallback onPressedBotaoPadrao;
  final VoidCallback onEnviarAudio;
  final Function(String) onExcluirAudio;
  final bool permiteEnviarAudio;

  final VoidCallback onEnviarFotos;
  final Function(String) onExcluirFoto;
  final bool permiteEnviarFotos;

  final VoidCallback onEnviarVideos;
  final Function(String) onExcluirVideo;
  final bool permiteEnviarVideos;

  const ConfirmarExecucaoServicoFooter({
    Key? key,
    required this.onPressedBotaoPadrao,
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

  @override
  Widget build(BuildContext context) {
    return Footer(
      header: header,
      body: body,
    );
  }

  Widget get header => Column(
        mainAxisSize: MainAxisSize.min,
        children: [barraBotoes, descricao, valorData],
      );

  Widget get barraBotoes => Padding(
    padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const DSTextTitleBoldSecondary(text: "Confirme a execução do serviço"),
        const SizedBox(height: 4,),
        const DSTextSubtitleSecondary(text: "Liberar o pagamento do serviço para o prestador"),
        const SizedBox(height: 24,),
        BotaoPadraoGrande(texto: 'CONFIRMAR',
          onPressed: onPressedBotaoPadrao,
        ),
      ],
    ),
  );

  Widget get descricao => Padding(
    padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DSTextTitleBoldSecondary(text: "Descrição"),
        DSTextSubtitleSecondary(text: viewModel.descricao),
      ],
    ),
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
            onEnviarAudio: () {  },
            onExcluirAudio: (String ) {  },
            permiteEnviarAudio: false,
            urlsFotos: viewModel.urlsFotos ?? [],
            onEnviarFotos: () {  },
            onExcluirFoto: (String ) {  },
            permiteEnviarFotos: false,
            urlsVideos: viewModel.urlsVideos ?? [],
            onEnviarVideos: () {  },
            onExcluirVideo: (String ) {  },
            permiteEnviarVideos: false,
          ),
        ],
      ),
  );
}


