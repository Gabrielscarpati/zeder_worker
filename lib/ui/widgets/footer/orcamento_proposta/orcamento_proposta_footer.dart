import 'package:flutter/material.dart';
import '../../../../design_system/widgets/footer.dart';
import '../footer_padrao/footer_padrao.dart';
import '../footer_padrao/footer_padrao_viewmodel.dart';
import 'orcamento_proposta_viewmodel.dart';

class OrcamentoPropostaFooter extends StatelessWidget {
  final OrcamentoPropostaFooterViewModel viewModel;
  final VoidCallback onEnviarAudio;
  final Function(String) onExcluirAudio;
  final bool permiteEnviarAudio;

  final VoidCallback onEnviarFotos;
  final Function(String) onExcluirFoto;
  final bool permiteEnviarFotos;

  final VoidCallback onEnviarVideos;
  final Function(String) onExcluirVideo;
  final bool permiteEnviarVideos;

  const OrcamentoPropostaFooter({
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Footer(
      header: FooterPadraoFooter(
          viewModel: FooterPadraoFooterViewModel(
            descricao: viewModel.descricao,
            valor: viewModel.valor,
            data: viewModel.data,
          ),
        onEnviarAudio: () {  },
        onExcluirAudio: (String ) { },
        permiteEnviarAudio: false,
        onEnviarFotos: () {  },
        onExcluirFoto: (String ) {  },
        permiteEnviarFotos: true,
        onEnviarVideos: () {  },
        onExcluirVideo: (String ) {  },
        permiteEnviarVideos: true,
        widgetBotaoTexto: Container(),
        headerHeight: 0,
      ),
    );
  }
}


