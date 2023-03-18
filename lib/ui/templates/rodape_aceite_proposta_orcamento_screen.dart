import 'package:flutter/material.dart';
import 'package:zeder/domain/domain.dart';

import '../widgets/footer/aceite_proposta_orcamento/aceite_proposta_orcamento_footer.dart';

class RodapeAceitePropostaOrcamentoScreen extends StatefulWidget {
  const RodapeAceitePropostaOrcamentoScreen({Key? key}) : super(key: key);

  @override
  State<RodapeAceitePropostaOrcamentoScreen> createState() => _RodapeAceitePropostaOrcamentoScreenState();
}

class _RodapeAceitePropostaOrcamentoScreenState extends State<RodapeAceitePropostaOrcamentoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rodape Aceite Proposta Orcamento"),
      ),
      bottomSheet: AceitePropostaOrcamentoFooter(
        servico: ServicoEntity.test(),
        onPressedBotaoAceitar: () {},
        onPressedBotaoRecusar: () {},
      ),
    );
  }
}
