import 'package:flutter/material.dart';

import '../../domain/entities/servico_entity.dart';
import '../widgets/footer/orcamento_proposta/orcamento_proposta_footer.dart';

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
        servico: ServicoEntity.test(),
      ),
    );
  }
}
