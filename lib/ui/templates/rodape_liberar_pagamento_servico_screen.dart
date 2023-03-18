import 'package:flutter/material.dart';

import '../../domain/entities/servico_entity.dart';
import '../widgets/footer/liberar_pagamento_servico/liberar_pagamento_servico_footer.dart';

class RodapeLiberarPagamentoServicoScreen extends StatefulWidget {
  const RodapeLiberarPagamentoServicoScreen({Key? key}) : super(key: key);

  @override
  State<RodapeLiberarPagamentoServicoScreen> createState() => _RodapeLiberarPagamentoServicoScreenState();
}

class _RodapeLiberarPagamentoServicoScreenState extends State<RodapeLiberarPagamentoServicoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liberar Pagamento Servico"),
      ),
      bottomSheet: LiberarPagamentoServicoFooter(
        servico: ServicoEntity.test(),
        onPressedBotaoAceitar: () {},
        onPressedBotaoRecusar: () {},
      ),
    );
  }
}
