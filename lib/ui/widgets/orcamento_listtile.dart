import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';

class OrcamentoListTile extends StatelessWidget {
  const OrcamentoListTile({super.key});

  String get nomeIcone => 'lightning-bolt';
  String get nomeOrcamento => 'Eletricista';
  String get statusOrcamento => 'R\$ 100.00 - R\$ 200.00';
  String get valor => 'R\$ 100 - 622';
  String get tempo => 'Expira em 1 dias';
  bool get hasNewInfo => false;

  Widget get leading => DSIconFilledSecondary(iconName: nomeIcone);
  Widget get title => DSTextTitleSecondary(text: nomeOrcamento);
  Widget get subtitle => DSTextSubtitleSecondary(text: statusOrcamento);
  Widget get trailing => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          
         
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DSTextTitleBoldSecondary(text: valor),
              DSTextSubtitleSecondary(text: tempo),
            ],
          ),
           const SizedBox(width: 8),
          const DSIconSecondary(iconName: 'menu-right'),
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
