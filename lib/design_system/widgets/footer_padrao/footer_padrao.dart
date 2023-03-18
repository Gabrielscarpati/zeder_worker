import 'package:flutter/material.dart';
import 'package:zeder/design_system/widgets/footer_padrao/footer_padrao_controller.dart';
import 'package:zeder/design_system/widgets/label_text.dart';

import '../../../../../design_system/widgets/footer.dart';
import '../../../../../design_system/widgets/text.dart';
import '../../../../design_system/widgets/players/barra_botoes_media.dart';

class FooterPadrao extends StatelessWidget {
  final FooterPadraoController controller;
  final Widget widgetBotaoTexto;
  final double headerHeight;
  const FooterPadrao({
    Key? key,
    required this.controller,
    required this.widgetBotaoTexto,
    required this.headerHeight,
  }) : super(key: key);

  static const double descricaoHeight = 120;
  static const double valorDataHeight = 90;

  @override
  Widget build(BuildContext context) {
    return Footer(header: header, body: body, maxHeight: (MediaQuery.of(context).size.height) * 0.85 - headerHeight - descricaoHeight - valorDataHeight);
  }

  Widget get header => Column(
        mainAxisSize: MainAxisSize.min,
        children: [barraBotoes, descricao, valorData],
      );

  Widget get barraBotoes => widgetBotaoTexto;

  Widget get descricao => SizedBox(
        height: descricaoHeight,
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DSLabelText(
                label: "Descrição",
                text: controller.descricao,
              ),
            ],
          ),
        ),
      );

  Widget get valorData => SizedBox(
        height: valorDataHeight,
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DSTextTitleBoldSecondary(text: controller.valor),
                  const DSTextSubtitleSecondary(text: "Valor Total do Orçamento"),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  DSTextTitleBoldSecondary(text: controller.data),
                  const DSTextSubtitleSecondary(text: "Data"),
                ],
              ),
            ],
          ),
        ),
      );

  Widget? get body => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BarraBotoesMedia(controller: controller),
          ],
        ),
      );
}
