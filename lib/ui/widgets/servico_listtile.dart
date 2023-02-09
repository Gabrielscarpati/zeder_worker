import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';

class ServicoListTile extends StatelessWidget {
  const ServicoListTile({super.key});

  String get nomeIcone => 'lightning-bolt';
  String get nomeServico => 'Eletricista';
  String get valorServico => 'R\$ 100.00 - R\$ 200.00';
  String get nota => '4.5';
  String get qtdeAvaliacoes => '(1.530)';

  Widget get leading => DSIconFilledSecondary(iconName: nomeIcone);
  Widget get title => DSTextTitleSecondary(text: nomeServico);
  Widget get subtitle => DSTextSubtitleSecondary(text: valorServico);
  Widget get trailing => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DSIconPrimary(iconName: 'seal'),
          const SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DSTextTitleBoldSecondary(text: nota),
              DSTextSubtitleSecondary(text: qtdeAvaliacoes),
            ],
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DSCardListTile(
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      onTap: () {},
    );
  }
}
