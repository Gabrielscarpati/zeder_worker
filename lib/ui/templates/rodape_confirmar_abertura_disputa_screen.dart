import 'package:flutter/material.dart';
import 'package:zeder/ui/widgets/footer/confirmar_abertura_disputa/confirmar_abertura_disputa_footer.dart';
import 'package:zeder/ui/widgets/footer/liberar_pagamento_servico/liberar_pagamento_servico_viewmodel.dart';
import '../widgets/footer/confirmar_abertura_disputa/confirmar_abertura_disputa_footer_viewmodel.dart';
import '../widgets/footer/liberar_pagamento_servico/liberar_pagamento_servico_footer.dart';

class RodapeConfirmarAberturaDisputaScreen extends StatefulWidget {
  const RodapeConfirmarAberturaDisputaScreen({Key? key}) : super(key: key);

  @override
  State<RodapeConfirmarAberturaDisputaScreen> createState() => _RodapeConfirmarAberturaDisputaScreenState();
}

class _RodapeConfirmarAberturaDisputaScreenState extends State<RodapeConfirmarAberturaDisputaScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirmar Abertura Disputa"),
      ),
      bottomSheet: ConfirmarAberturaDisputaFooter(
        viewModel:  const ConfirmarAberturaDispultaFooterViewModel(
          valor: "R\$ 100 - R\$ 600",
          data: "Amanhã",
          descricao: 'sdncndjcndfn  we  x xr xer er te rt  ty c tcht  ccty c ht h nnnjknjn',
          urlAudio: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
          urlsFotos: ['https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'],
          urlsVideos: ['https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'],
        ),
        onPressedBotaoPadrao: () {  },
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
