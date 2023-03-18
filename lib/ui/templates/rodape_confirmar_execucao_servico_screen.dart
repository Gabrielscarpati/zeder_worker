import 'package:flutter/material.dart';
import 'package:zeder/ui/widgets/footer/confirmar_execucao_servico/confirmar_execucao_servico_footer.dart';

import '../../domain/entities/servico_entity.dart';

class RodapeConfirmarExecucaoServicoScreen extends StatefulWidget {
  const RodapeConfirmarExecucaoServicoScreen({Key? key}) : super(key: key);

  @override
  State<RodapeConfirmarExecucaoServicoScreen> createState() => _RodapeConfirmarExecucaoServicoScreenState();
}

class _RodapeConfirmarExecucaoServicoScreenState extends State<RodapeConfirmarExecucaoServicoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rodape Confirmar execucao Servico"),
      ),
      bottomSheet: ConfirmarExecucaoServicoFooter(
        servico: ServicoEntity.test(),
        onPressedBotaoConfimar: () {},
      ),
    );
  }
}
