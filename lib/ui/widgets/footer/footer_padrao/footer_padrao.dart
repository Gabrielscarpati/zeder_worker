import 'package:flutter/material.dart';
import '../../../../../design_system/widgets/footer.dart';
import '../../../../../design_system/widgets/text.dart';
import '../../players/barra_botoes_media.dart';
import 'footer_padrao_viewmodel.dart';

class FooterPadraoFooter extends StatelessWidget {
  final double valorDataHeight;
  final double descricaoHeight;
  final double headerHeight;
  final Widget widgetBotaoTexto;
  final FooterPadraoFooterViewModel viewModel;
  final VoidCallback onEnviarAudio;
  final Function(String) onExcluirAudio;
  final bool permiteEnviarAudio;

  final VoidCallback onEnviarFotos;
  final Function(String) onExcluirFoto;
  final bool permiteEnviarFotos;

  final VoidCallback onEnviarVideos;
  final Function(String) onExcluirVideo;
  final bool permiteEnviarVideos;

  const FooterPadraoFooter({
    Key? key,
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
    required this.widgetBotaoTexto,
    required this.headerHeight,
    this.descricaoHeight = 80,
    this.valorDataHeight = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Footer(
      header: header,
      body: body,
      maxHeight: (MediaQuery.of(context).size.height) * 0.85 - headerHeight-descricaoHeight-valorDataHeight
    );
  }

  Widget get header => Column(
    mainAxisSize: MainAxisSize.min,
    children: [barraBotoes, descricao, valorData],
  );

  Widget get barraBotoes => widgetBotaoTexto;

  Widget get descricao => SizedBox(
    height: descricaoHeight,
    child: Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DSTextTitleBoldSecondary(text: "Descrição"),
          DSTextSubtitleSecondary(text: viewModel.descricao),
        ],
      ),
    ),
  );

  Widget get valorData => SizedBox(
    height: valorDataHeight,
    child: Padding(
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


