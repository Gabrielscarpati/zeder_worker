import 'package:flutter/material.dart';

import '../widgets/footer/solicitar_orcamento/solicitar_orcamento_footer.dart';
import '../widgets/footer/solicitar_orcamento/solicitar_orcamento_viewmodel.dart';

class RodapeSolicitarOrcamentoScreen extends StatefulWidget {
  const RodapeSolicitarOrcamentoScreen({Key? key}) : super(key: key);

  @override
  State<RodapeSolicitarOrcamentoScreen> createState() => _RodapeSolicitarOrcamentoScreenState();
}

class _RodapeSolicitarOrcamentoScreenState extends State<RodapeSolicitarOrcamentoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rodape Solicitar Orcamento"),
      ),
      bottomSheet: SolicitarOrcamentoFooter(
        viewModel: const SolicitarOrcamentoFooterViewModel(
          valor: "R\$ 100 - R\$ 600",
          data: "Amanhã",
        ),
        onClickSolicitarOrcamento: () {},
      ),
    );
  }
}
