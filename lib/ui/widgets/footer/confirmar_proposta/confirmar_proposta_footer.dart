import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/widgets/footer/solicitar_orcamento/solicitar_orcamento_viewmodel.dart';

import '../../../../design_system/widgets/footer.dart';
import '../../../../design_system/widgets/text.dart';
import '../../botoes.dart';
import 'orcamento_gratuito_viewmodel.dart';

class ConfirmarPropostaFooter extends StatelessWidget {
  final VoidCallback onClickConfirmarProsta;
  const ConfirmarPropostaFooter({
    Key? key,
    required this.onClickConfirmarProsta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Footer(
      header: header,
      body: body,
    );
  }

  Widget get header => Column(
        mainAxisSize: MainAxisSize.min,
        children: [title, selecionarFormaPagamento, divider, botao],
      );

  Widget? get body => null;

  Widget get title => const Padding(
        padding:  EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DSTextTitleBoldSecondary(text: "Escolha uma forma de pagameneto"),
                 DSTextSubtitleSecondary(text: "Parcelamento em até 12x"),
              ],
            ),
          ],
        ),
      );



  Widget get selecionarFormaPagamento => const Padding(padding: EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          DSTextTitleBoldSecondary(text: "Escolha uma forma de pagameneto"),
          DSTextSubtitleSecondary(text: "Parcelamento em até 12x"),
        ],
      ),
    ],
  )
  );

  Widget get botao => Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: BotaoPadraoGrande(texto: "Confirmar Proposta", onPressed: onClickConfirmarProsta),
      );

  Widget get divider => const Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 16),
        child: Material(child: Divider()),
      );
}
