import 'package:flutter/material.dart';
import 'package:zeder/design_system/widgets/footer_padrao/footer_padrao.dart';
import 'package:zeder/domain/domain.dart';

import 'footer_padrao_servico_controller.dart';

abstract class FooterPadraoServico extends StatefulWidget {
  final ServicoEntity servico;

  const FooterPadraoServico({
    super.key,
    required this.servico,
  });

  Widget get widgetBotaoTexto;
  double get headerHeight;

  @override
  State<FooterPadraoServico> createState() => FooterPadraoServicoState();
}

class FooterPadraoServicoState extends State<FooterPadraoServico> {
  late FooterPadraoServicoController controller;

  @override
  void initState() {
    super.initState();
    controller = FooterPadraoServicoController(servico: widget.servico);
  }

  @override
  Widget build(BuildContext context) {
    return FooterPadrao(
      controller: controller,
      widgetBotaoTexto: widget.widgetBotaoTexto,
      headerHeight: widget.headerHeight,
    );
  }
}
