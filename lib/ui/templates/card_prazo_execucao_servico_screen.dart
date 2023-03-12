import 'package:flutter/material.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:zeder/domain/domain.dart';
import 'package:zeder/ui/widgets/footer/confirmar_proposta/confirmar_proposta_viewmodel.dart';

import '../../domain/entities/prazo_execucao_servico_entity.dart';
import '../widgets/card_prazo_servico/card_prazo_execucao_servico.dart';
import '../widgets/card_prazo_servico/card_prazo_execucao_servico_viewmodel.dart';
import '../widgets/footer/confirmar_proposta/confirmar_proposta_footer.dart';
import '../widgets/footer/orcamento_gratuito/orcamento_gratuito_footer.dart';
import '../widgets/footer/orcamento_gratuito/orcamento_gratuito_viewmodel.dart';
import '../widgets/footer/solicitar_orcamento/solicitar_orcamento_footer.dart';
import '../widgets/footer/solicitar_orcamento/solicitar_orcamento_viewmodel.dart';

class CardPrazoExecucaoServicoScreen extends StatefulWidget {
  const CardPrazoExecucaoServicoScreen({Key? key}) : super(key: key);

  @override
  State<CardPrazoExecucaoServicoScreen> createState() => _CardPrazoExecucaoServicoScreenState();
}

class _CardPrazoExecucaoServicoScreenState extends State<CardPrazoExecucaoServicoScreen> {
  SolidController _controller = SolidController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Prazo Execucao Servico"),
      ),
      body: SizedBox(
        child: CardPrazoExecucaoServico(
          SelectCardRadioButtonSecondaryAction: () {
            print("SelectCardRadioButtonSecondaryAction");
          },
          onSelectCardAmanhaRadioButton: (p0) {
            print("onSelectAmanhaRadioButton");
          },
          onSelectSeteDiasRadioButton: (p0) {
            print("onSelectSeteDiasRadioButton");
          },
          onSelectTrintaDiasRadioButton: (p0) {
            print("onSelectTrintaDiasRadioButton");
          },
          onSelectSemLimiteRadioButton: (p0) {
            print("onSelectSemLimiteRadioButton");
          },

          selectedType: PrazoExecucaoServicoEntity.trintaDias(),

          ),
      )
        
    );
  }
}
