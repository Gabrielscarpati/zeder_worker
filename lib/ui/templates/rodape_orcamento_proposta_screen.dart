import 'package:flutter/material.dart';
import '../widgets/footer/orcamento_proposta/orcamento_proposta_footer.dart';
import '../widgets/footer/orcamento_proposta/orcamento_proposta_viewmodel.dart';

class RodapeOrcamentoPropostaScreen extends StatefulWidget {
  const RodapeOrcamentoPropostaScreen({Key? key}) : super(key: key);

  @override
  State<RodapeOrcamentoPropostaScreen> createState() => _RodapeOrcamentoPropostaScreenState();
}

class _RodapeOrcamentoPropostaScreenState extends State<RodapeOrcamentoPropostaScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rodape Orcamento Proposta"),
      ),
      bottomSheet: OrcamentoPropostaFooter(
        viewModel: const OrcamentoPropostaFooterViewModel(
          valor: "R\$ 100 - R\$ 600",
          data: "Amanhã",
          descricao: 'sdncndjcndfn  we  x xr xer er te rt  ty c tcht  ccty c ht h nnnjknjn',
          urlAudio: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
          urlsFotos: ['https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'],
          urlsVideos: ['https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'],
        ),
        onEnviarAudio: () {  },
        onExcluirAudio: (String ) {  },
        permiteEnviarAudio: true,
        onEnviarFotos: () {  },
        onExcluirFoto: (String ) {  },
        permiteEnviarFotos: true,
        onEnviarVideos: () {  },
        onExcluirVideo: (String ) {  },
        permiteEnviarVideos: true,
      ),
    );
  }
}
